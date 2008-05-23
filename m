Received: from yw-out-1718.google.com ([74.125.46.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JzR8g-0002zi-QA
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 06:52:31 +0000
Received: by yw-out-1718.google.com with SMTP id 5so334211ywm.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 May 2008 23:52:15 -0700 (PDT)
Message-ID: <80b317760805222352v3701dcc5p7aa0108fb72b2192@mail.gmail.com>
Date: Fri, 23 May 2008 08:52:15 +0200
From: "Richard Genoud" <richard.genoud@gmail.com>
To: James <jamessteward@optusnet.com.au>
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
In-Reply-To: <1211524684.6203.13.camel@torchwood>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<1211524684.6203.13.camel@torchwood>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/5/23 James <jamessteward@optusnet.com.au>:
> Hi Richard,
> The NAND flash was erased and root jffs2 image written using the SAM-BA
> utility, then boot the kernel to use this as its rootfs.  It mounts ok
> to begin with, then I get heaps of jffs2 warnings and finally a kernel
> bug, I think at fs/jffs2/file.c:251 (I don't have the system here at
> home.)
ok, so, that's weird...

> What version of kernel, patches and compiler are you using?
it was 2.6.24 with at91 patchset (
http://maxim.org.za/AT91RM9200/2.6/2.6.24-at91.patch.gz )
(beware to choose software ECC in at91 nand ecc kernel option if you
want to be sam-ba compatible)
