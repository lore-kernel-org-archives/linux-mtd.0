Received: from tomts23.bellnexxia.net ([209.226.175.185] helo=tomts23-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175wh8-0008CW-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 May 2002 23:47:30 +0100
Date: Thu, 9 May 2002 18:47:27 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Darren Martz <dmartz@shelbrook.com>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: RE: Boot from DoC2000 
In-Reply-To: <003501c1f7a8$de322840$9702a8c0@maverick>
Message-ID: <Pine.LNX.4.44.0205091840570.21136-100000@server.superbt.com>
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

Darren,

On Thu, 9 May 2002, Darren Martz wrote:

> Is there a document that covers most/part of this? I am assuming the
> 0.92 build has DoC support.

There is a patch to GRUB enabling DoC read support.  The latest one is

       patches/grub-2002-02-19-doc.patch

in MTD CVS repository.  One has to apply it with the following command:

        cd ~/grub
        patch -p0 -i ~/infradead.org/mtd/patches/grub-2002-02-19-doc.patch

You can experience inconsistencies between the patch and the latest GRUB 
Changelog.

Once you patched the GRUB source code, take a look at README_DiskOnChip 
for further configuration commands.  You may be required to update 
autoconf and automake.

Ilguiz
