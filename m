Received: from ip68-6-32-22.sb.sd.cox.net ([68.6.32.22] helo=speedy.datawave.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ttNe-0001Ls-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 18:21:50 +0100
From: "Brian J. Fox" <bfox@ua.com>
To: elf@buici.com
CC: Russ.Dill@asu.edu, manningc2@actrix.gen.nz,
	linux-mtd@lists.infradead.org, yaffs@toby-churchill.org
In-reply-to: <20020924171419.GA2733@buici.com> (message from Marc Singer on
	Tue, 24 Sep 2002 10:14:19 -0700)
Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading
Message-Id: <E17ttNA-0004ZZ-00@speedy.datawave.net>
Date: Tue, 24 Sep 2002 10:21:20 -0700
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

   From: Marc Singer <elf@buici.com>
   Cc: Charles Manning <manningc2@actrix.gen.nz>, linux-mtd@lists.infradead.org,
      yaffs@toby-churchill.org
   Date: Tue, 24 Sep 2002 10:14:19 -0700

   On Tue, Sep 24, 2002 at 09:59:03AM -0700, Russ Dill wrote:
   > On Tue, 2002-09-24 at 09:53, Marc Singer wrote:
   > > On Tue, Sep 24, 2002 at 12:53:36AM -0700, Russ Dill wrote:
   > > > 
   > > 
   > > A question, though.  I've been doing compression tests with cramfs.
   > > I'm finding that gzip -9 of an ext2 filesystem produces smaller images
   > > than mkcramfs.  Have you ever compared the two?
   > 
   > cramfs is meant to be lean, fast, and low on ram consumption, if you
   > compress the whole thing at once, you have to load the whole thing into
   > ram to read any of it, so cramfs compresses PAGE_CACHE (4096) sized
   > pages at a time

   That's what isn't clear.  I made two filesystems with the same
   contents.  One cramfs and the other ext2.  The ext2 filesystem
   compressed was smaller than the cramfs.  My understanding is that both
   must be uncompressed into a ramfs to be used.  If this is correct,
   then the only comparable consideration is the size of the compressed
   data.

No, the size of the uncompressed data is also important.

Is the ext2 system uncompressed bigger, smaller, or the same size as
the uncompressed? cramfs?

brian
