Received: from sccrmhc01.attbi.com ([204.127.202.61])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nIR9-0006k1-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 13:42:11 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Henrik Nordstrom <hno@marasystems.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: DOC 2000 and GRUB
Date: Fri, 6 Sep 2002 08:40:26 -0400
Cc: Russ Dill <Russ.Dill@asu.edu>,
 mateo@posta.star.si,
 linux-mtd@lists.infradead.org
References: <200209061149.02058.hno@marasystems.com> <20020906110053.EFQR11061.sccrmhc01.attbi.com@there> <200209061427.15220.hno@marasystems.com>
In-Reply-To: <200209061427.15220.hno@marasystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020906124140.HVSQ11061.sccrmhc01.attbi.com@there>
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

Henrik Nordstrom wrote:
> I tried to patch my GRUB to read 0x00 as 0xFF some days ago, but it failed
> miserably.. but I only changed the ifs around the message. Maybe there is
> other things that need to be changed?

I don't think so -- all I did was accept UnitSizeFactors of both 0x0 and 
0xff.  No other changes were needed to make it work on a Millennium.

It's my understanding that there are some DoC 2000's that may have values 
other than 0x0 or 0xff.  In this case, we might need to move some of David's 
changes from nftlmount.c into Grub's bdev_diskonchip.c.
