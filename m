Received: from ns1.idleaire.net ([65.220.16.2] helo=iasrv1.idleaire.net)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CehXG-00050m-Ov
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 17:22:19 -0500
From: Dave Dillow <dave@thedillows.org>
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E7935181391@atcml01.atc.army.mil>
References: <EFF9A3506F74924AB5CC77BDC66E7935181391@atcml01.atc.army.mil>
Content-Type: text/plain
Message-Id: <1103149330.5809.1.camel@dillow.idleaire.com>
Mime-Version: 1.0
Date: Wed, 15 Dec 2004 17:22:11 -0500
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Big Problem with DOC 128Mbyte Help! ADDED Note
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-12-15 at 09:49, Carlos, John J USAATC wrote:
> The docfdisk utility shows that there are two partitions.  The BDL and the
> BDTL partition.  Could this be giving me problems?  Should I get rid of the
> two partitions and have one large one?  Is that even possible?

IIRC, the BDL partition is the DOC BIOS extension, which you'll need for
using a standard BIOS.

The BDTL is the actual data partition.

Your setup is normal.
-- 
Dave Dillow <dave@thedillows.org>
