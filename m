Received: from mailout01.sul.t-online.com ([194.25.134.80] helo=mailout01.sul.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gJ8h-0004kp-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2001 05:57:43 +0100
Message-ID: <3B9C49AC.1422EFC7@gmx.de>
Date: Mon, 10 Sep 2001 07:03:40 +0200
From: Thomas Eschenbacher <Thomas.Eschenbacher@gmx.de>
MIME-Version: 1.0
To: "Bao C. Ha" <baoha@sensoria.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: Boot up problem with Kernel 2.4.8
References: <025b01c13974$5e400cd0$456c020a@SENSORIA>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

"Bao C. Ha" wrote:
> 
> I have a strange problem with kernel 2.4.8.  When
> I tried to boot up with "root=/dev/mtdblock/3", it
> gets panic and can't find the root device.  When,
> I change to "root=1f03", it works.  I am using
> RedBoot if it matters, but it works with 2.4.5
> before.

I had the same problem with a plain 2.4.9. Rober Kaiser gave me the hint
that there's something missing in the device list in
"linux/init/main.c":

#ifdef CONFIG_NFTL
    { "nftla", 0x5d00 },
    { "nftlb", 0x5d10 },
    { "nftlc", 0x5d20 },
    { "nftld", 0x5d30 },
#endif
#ifdef CONFIG_FTL
    { "ftla", 0x2c00 },
    { "ftlb", 0x2c10 },
    { "ftlc", 0x2c20 },
    { "ftld", 0x2c30 },
#endif
#ifdef CONFIG_MTD
    { "mtdblock", 0x1f00 },
#endif


As an alternative, you can switch to kernel 2.4.9 and apply Alan Cox's
patch-2.4.9-ac9. This also made JFFS2 working and maybe it also solves
your problem ;-)

Thomas.

(thanks to Alan for porting JFFS2!)
-- 
________________________________________________________________________
Thomas Eschenbacher                           Thomas.Eschenbacher@gmx.de
