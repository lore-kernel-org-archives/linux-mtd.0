Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16e8H8-0005BL-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 05:29:42 +0000
Received: from ilatypov by infradead.org with local (Exim 3.20 #2)
	id 16e8S3-000110-00
	for linux-mtd@lists.infradead.org; Fri, 22 Feb 2002 05:40:59 +0000
Date: Fri, 22 Feb 2002 00:37:40 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Vadim Khmelnitsky <VadimK@m-sys.com>
cc: Mark Meade <mark@lakeshoremicro.com>,
    Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: RE: DiskOnChip 2000 and Millenium support in GRUB bootloader 
In-Reply-To: <AEA9DCA73595D411A6D4009027DE9C5E019BF9C8@MSI-EX6>
Message-ID: <Pine.LNX.4.44.0202220030340.7347-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

OK, I updated the util/doc_loadbios to accept an extra offset paramter
(1024).

Also, patches/grub-2002-02-19-doc.patch will skip the 1K IPL area if
Millenium is detected (I know it is silly to detect the DoC type in the
bootloader at run time -- please change that to conditional compilation if
you wish).

The updated patch will need proper auto-configured files.  You can
re-generate them by running
   aclocal && automake && autoconf
in the GRUB's top level directory.

Anyone wants to try his/her Millenium? Mark?

Ilguiz

On Thu, 21 Feb 2002, Vadim Khmelnitsky wrote:

> If you want to make doc-loadbios to work with Millennium chip you should
> put it behind IPL code . IPL is 512 bites long . We have two copies of
> it . So, you can put your code at offset 1KB .
