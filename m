Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184JpR-0000W7-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 12:37:37 +0100
Date: Wed, 23 Oct 2002 14:07:34 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Frank Neuber <neuber@convergence.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info
Message-ID: <20021023120734.GB31696@wohnheim.fh-wedel.de>
References: <20021018104910.GA11807@jupiter> <26791.1034943288@passion.cambridge.redhat.com> <20021019164445.GA9364@wohnheim.fh-wedel.de> <20021022103936.GA24369@jupiter> <20021022170803.GA9161@wohnheim.fh-wedel.de> <20021023094928.GA27905@jupiter> <20021023100618.GB13926@wohnheim.fh-wedel.de> <20021023102709.GA28181@jupiter>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021023102709.GA28181@jupiter>
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

On Wed, 23 October 2002 12:27:09 +0200, Frank Neuber wrote:
> Ahh, much more better. This is a good starting point. Thanks!

My desk is a mess, my brain is a mess, my patches should be better,
but... sorry for the inconvenience!

> I try to make this more generic (if time left :-)))

Allow me to drop some ideas. Maybe someone else picks those up, before
I do:

- All the mapping drivers in drivers/mtd/maps are just specialized
  and tweaked versions of physmap.c.
- physmap.c was not generic enough. I wrote mphysmap.c for a reason.
- It should be possible to provide a small api that is generic enough
  to rewrite all the mapping drivers in <20 lines of code.

That's the goal. This might be the path:

- physmap.c allows for one range only. Some drivers need multiple
  ranges. Pick mphysmap.c or write something similar.
- Some drivers need to cut out a small range from the middle for the
  bootloader. They then concatenate the range before and after the
  bootloader into one virtual partition. Find a clean solution for
  this.

When physmap.c or any variant is generic enough to do all this, it
needs two or three interfaces:
- Command line, a lot of people should need that.
- A c api for the "got a d-box, hit this options" type files.
(-) Maybe a config language interface. You should cut back on the
  flexibility, though, the Config.in part of the mphysmap patch is
  ugly already, concatenate won't make it any better.

That is my bold vision of how it should be right. Not that I expect it
to be done, but still...

Jörn

-- 
Don't worry about people stealing your ideas. If your ideas are any good,
you'll have to ram them down people's throats.
-- Howard Aiken quoted by Ken Iverson quoted by Jim Horning quoted by
   Raph Levien, 1979
