Received: from yx-out-1718.google.com ([74.125.44.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWIK0-00042d-EJ
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 22:08:00 +0000
Received: by yx-out-1718.google.com with SMTP id 3so114471yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 15:07:59 -0700 (PDT)
Message-ID: <3d9141e80808211507r3079199cx93f8115664f02f49@mail.gmail.com>
Date: Fri, 22 Aug 2008 00:07:58 +0200
From: "Per Andersson" <avtobiff@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC] Add support for MTD in parted/partman
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear linux-mtd,

I have just finished my Google Summer of Code project
called Debian NAS. Read more about the project in
[0] and [1].

Currently parted, and partman, cannot partition MTD flash.
I would like to introduce this functionality.

I got confused by code found in the setup of the Kurobox
Pro in the kernel, the "partitions" on flash were hard coded
into the source.

So, I wonder, what is the way to go with adding support for
partitioning MTD flash? (I have read the JFFS2 article and
skimmed the UBI and UBIFS articles.)


Best regards,
Per

[0] http://oshw.org/usr/avtobiff/gsoc/08/debiannas
[1] http://oshw.org/avtoblag/
