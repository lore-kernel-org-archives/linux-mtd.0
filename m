Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184LVZ-0000hB-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 14:25:13 +0100
Message-Id: <200210231355.g9NDt6s03055@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>,
   Frank Neuber <neuber@convergence.de>
Subject: Re: parse_cmdline_partitions equivalent for map_info
Date: Wed, 23 Oct 2002 16:01:35 +0200
Cc: linux-mtd@lists.infradead.org
References: <20021018104910.GA11807@jupiter> <20021023102709.GA28181@jupiter> <20021023120734.GB31696@wohnheim.fh-wedel.de>
In-Reply-To: <20021023120734.GB31696@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Am Mittwoch, 23. Oktober 2002 14:07 schrieb Jörn Engel:
> Allow me to drop some ideas. Maybe someone else picks those up, before
> I do:
>
> - All the mapping drivers in drivers/mtd/maps are just specialized
>   and tweaked versions of physmap.c.

Not all, but most of them are (see my previous mail).

> - physmap.c was not generic enough. I wrote mphysmap.c for a reason.
> - It should be possible to provide a small api that is generic enough
>   to rewrite all the mapping drivers in <20 lines of code.

Agreed 98%: I doubt that it will be feasible to cover *all* possible 
configurations in a single generic physmap.c, so the possiblity to drop in a 
specialized mapping driver as a last resort should stay. But generally, I 
agree that there are far too many mapping drivers today.

>
> That's the goal. This might be the path:
>
> - physmap.c allows for one range only. Some drivers need multiple
>   ranges. Pick mphysmap.c or write something similar.

Yep.

> - Some drivers need to cut out a small range from the middle for the
>   bootloader. They then concatenate the range before and after the
>   bootloader into one virtual partition. Find a clean solution for
>   this.

Hmm, I would have thought that mtdconcat.c does this nicely already? (Maybe 
I'm biased since I'm the author of that module, but I'm open to discussion)


>
> When physmap.c or any variant is generic enough to do all this, it
> needs two or three interfaces:
> - Command line, a lot of people should need that.

why not use what is there already (cmdline.c) ?


> - A c api for the "got a d-box, hit this options" type files.

Not sure what you mean by "c api", but generally, MTD is already a nightmare 
to configure for a non-guru, unless there is a specific mapping driver for 
your hardware that you can just click. So this ability to just tickbox your 
platform should definitely stay (or even be extended) when a new concept gets 
introduced.

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO AG
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
