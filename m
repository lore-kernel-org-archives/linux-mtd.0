Received: from rv-out-0708.google.com ([209.85.198.248])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K33pU-0006YI-6m
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 06:47:40 +0000
Received: by rv-out-0708.google.com with SMTP id b17so1113096rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 01 Jun 2008 23:47:39 -0700 (PDT)
Message-ID: <bae050c10806012347p3f7e3bf0v3642383edaffd92b@mail.gmail.com>
Date: Mon, 2 Jun 2008 14:47:38 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test
In-Reply-To: <1212387497.31023.172.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10806012229n78668cf3rf71c44bd396a7fba@mail.gmail.com>
	<1212387497.31023.172.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/2/08, Artem Bityutskiy <dedekind@infradead.org> wrote:
> [Fixed abused mail subject]
I wished I know how to fix it. Is there any mailbox supply References:
or In-Reply-To: headers when you write a new Email? Or is there some
special operation to do this?

> On Mon, 2008-06-02 at 13:29 +0800, Nancy wrote:
> >     Thank you for sharing your test report!
> >     For ubiblk,  cp; sync;  is not enough, cause ubiblk hold back a LEB
> > in ram until another logical block number LEB wants to use the
> > writecache(in ubiblk) or an block device layer "release" call will
> > drive the LEB in writecache to be written on Nand Flash.
> >     For FAT, when it write some files, usually, it modify FAT table
> > first, then goes the file contends, finally still need to change
> > something in FAT table or whatever it is which belongs to the
> > Filesystem meta data. That means, the last LEB hold back in ram
> > contains the most important data (filesystem meta data). If there
> > comes unclean reboot. That may lost lots of data. Though UBI tolerant
> > unclean reboot. In this case, you should use tool "dosfsck
> > /dev/ubiblockN -a" before you mount ubiblock again. And see what you
> > have lost!
> >     To be safe, you should do : cp...; sync; flushcache /dev/ubiblockN
> >     I'm not sure block device layer's Ioctl "BLKFLSBUF" use in this
> > way. Is there any command like sync, not just sync the buffer cache,
> > but also the buffer in dirver layer( call that ioctl :-)
>
> Sorry, but these things are absolutely unacceptable and mean your
> implementation is broken.

     That's OK. For me, better have a faulty one than have nothing at
all. Hope someone will fix it or create a new one instead!
     Because that's mainly for FAT, lost some user data is not that
unaccepable. Cause most of the user data have bak in PC. Just make
sure when you download somefiles from PC through USB, unload USB
properly, the script will close the ubiblock device. That's safe.
     When you want to write something in ubiblock device in target
board, you should be aware of flushcache things.  Unclean reboot
happened rarely.
     At least this faulty accepted by my customers :-)


-- 
Best wishes,
Nancy
