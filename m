Received: from web9401.mail.yahoo.com ([216.136.129.107])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17740X-0006TI-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 May 2002 01:48:09 +0100
Message-ID: <20020513004807.53730.qmail@web9401.mail.yahoo.com>
Date: Sun, 12 May 2002 17:48:07 -0700 (PDT)
From: Matt Cochran <matthewcochran@yahoo.com>
Subject: Re: Filesystem Driver Panic 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <1195.1020845726@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Here's an example:
I created a FAT partition on the system, and formatted
it to the same. I copied one set of files to it, and
restarted the machine.

I needed to change one of the files, but when I
removed the file I got:

Filesystem Panic (dev 5d:01)
fat_free: deleting beyond EOF
Filesystem has been set read-only

And then rm fails.

I have also noticed that the files copied to the
filesystem are often corrupted.

You're right, I was unable to reproduce this using
only /dev/nftla. Unfortunately, I can't get syslinux
to work without using partitions. Is there a way out
along this path, or do I need to take another
approach?

Matt




--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> matthewcochran@yahoo.com said:
> > I've been developing a system using kernel 2.4.18
> and the MTD drivers
> > packaged with it on a system with a Millenium DOC.
> I've enabled
> > read-write support and can successfully read the
> test VFAT filesystem
> > on the DOC. However, after multiple writes,
> approximately 6, I get a
> > "filesystem panic" from the kernel, and the device
> is remounted
> > read-only.
> 
> Can you give more details? Can you reproduce by just
> reading from and 
> writing to the raw /dev/nftla device?
> 
> It's better to format with their DFORMAT program
> than nftl_format.
> 
> --
> dwmw2
> 
> 



__________________________________________________
Do You Yahoo!?
LAUNCH - Your Yahoo! Music Experience
http://launch.yahoo.com
