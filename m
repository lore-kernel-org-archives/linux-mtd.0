Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E31DE-0004qF-0R
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 20:46:28 -0400
Message-ID: <42FA9FDA.1090505@mvista.com>
Date: Wed, 10 Aug 2005 17:46:18 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Josh Boyer <jdub@us.ibm.com>
References: <1122558140.22995.4.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1122558140.22995.4.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [Fwd: mtd/drivers/mtd/chips cfi_cmdset_0001.c, 1.179,
 1.180	cfi_cmdset_0002.c,
 1.119, 1.120 cfi_cmdset_0020.c, 1.19,	1.20 cfi_util.c, 1.8, 1.9]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> 
> It seems Intel also has some chips that use version 1.4 of the CFI
> extended query table.  The Intel StrataFlash P30 (JS28FxxxP30xxx) report
> version 1.4 of the table.
> 
> Has anyone had a chance to test out whether these will work with the
> current driver?

Nicolas recently committed changes that add Intel CFI 1.4 support for 
Intel StrataFlash(r) Cellular Memory (M18), aka "Sibley".  Some changes 
for programming region info come along with CFI 1.4, haven't checked P30 
datasheet to verify its support for all that.

-- 
Todd
