Received: from ns1.idleaire.net ([65.220.16.2] helo=iasrv1.idleaire.net)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CmH3T-000333-NF
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2005 14:42:52 -0500
From: Dave Dillow <dave@thedillows.org>
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E79351813A1@atcml01.atc.army.mil>
References: <EFF9A3506F74924AB5CC77BDC66E79351813A1@atcml01.atc.army.mil>
Content-Type: text/plain
Message-Id: <1104954164.12749.6.camel@dillow.idleaire.com>
Mime-Version: 1.0
Date: Wed, 05 Jan 2005 14:42:44 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems mounting file system and booting with DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-05 at 14:00, Carlos, John J USAATC wrote:
> Hello All,
> 
>   I will try again and see if I can get some insight as to my problem.

Sorry, got busy with other projects....

I've not got a complete patch at the moment, but in
drivers/mtd/inftlcore.c, you will find the lines:

parity = (nrbits(thisVUC, 16) & 0x1) ? 0x1 : 0;
parity |= (nrbits(prev_block, 16) & 0x1) ? 0x2 : 0;
parity |= (nrbits(anac, 8) & 0x1) ? 0x4 : 0;
parity |= (nrbits(nacs, 8) & 0x1) ? 0x8 : 0;

Those need to be changed to:

parity = (nrbits((thisVUC & 0xff) ^
		(thisVUC >> 8), 8) & 0x1) ? 0x8 : 0;
parity |= (nrbits((prev_block & 0xff) ^
		(prev_block >> 8), 8) & 0x1) ? 0x4 : 0;
parity |= (nrbits(anac, 8) & 0x1) ? 0x2 : 0;
parity |= (nrbits(nacs, 8) & 0x1) ? 0x1 : 0;

I believe this will fix the parity generation problem, and will be a
start to keep the DoC BIOS extension from corrupting your device. There
are other compatibility problems, but I think this is the only one that
will corrupt things.

The Linux INFTL doesn't check the parity (well, it didn't at the time I
looked at this), so no need to change it there.

Using this change should let you boot from the DoC using the BIOS
extensions and lilo or syslinux, but won't affect docboot, AFAIK.
-- 
Dave Dillow <dave@thedillows.org>
