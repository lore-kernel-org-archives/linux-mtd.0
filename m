Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kiXD-0000kT-EF
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 12:02:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Zachi Friedman <zachi.friedman@m-sys.com>
In-Reply-To: <97303ED3C472254E8888E5F74A783471045BD2@msu-ex01.corp.m-sys.com>
References: <97303ED3C472254E8888E5F74A783471045BD2@msu-ex01.corp.m-sys.com>
Message-Id: <1060254121.25209.69.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 07 Aug 2003 12:02:02 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Dave Dillow <dave@thedillows.org>
Subject: RE: Problems with 128MB DoC 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-08-04 at 19:17, Zachi Friedman wrote:
> I have just grabbed one of those MD2202-D128, and ran some tests on it.
> It is built out of 2 flash devices, 64MB each. They seem to be Samsung
> KM29V512000, and their flash chip ID is EC 76.
> 
> It seems you have a problem if you get C6 C6... It is definitely not the
> correct flash ID.

There really does seem to be other differences between the old and new
DiskOnChip 2000 ASICs, other than the ChipID and the Toggle bit.

Perhaps it's not an _intentional_ difference and the new ASIC is just
less tolerant of something we're doing wrong in the doc2000.c driver? 

Dave, does the code in drivers/mtd/nand/diskonchip.c work for you if you
hack it to have the correct address for the DiskOnChip, and make the
ident bits work?


-- 
dwmw2
