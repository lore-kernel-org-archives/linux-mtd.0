Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pyPH-0001CL-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 21:18:31 +0100
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pyPE-0001CF-00
	for mtd@infradead.org; Wed, 18 Apr 2001 21:18:28 +0100
Message-ID: <3ADDF6C4.4FA823CD@daniel.com>
Date: Wed, 18 Apr 2001 15:19:16 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
CC: mtd@infradead.org
Subject: Re: JFFS2 as root FS
References: <001001c0c826$63b43200$0a01a8c0@Win1> <3ADDCACB.15BF0590@daniel.com> <003501c0c83d$36d89de0$d897143e@jocke>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Joakim Tjernlund wrote:

> ----- Original Message -----
> From: "Vipin Malik" <vipin.malik@daniel.com>
> To: <joakim.tjernlund@lumentis.se>
> Cc: <mtd@infradead.org>
> Sent: den 18 april 2001 19:11
> Subject: Re: JFFS2 as root FS
>
> > Joakim Tjernlund wrote:
> >
> > > Hi there
> > >
> > > Has anybody managed to get a root FS with JFFS2 to work?
> >
> > Sure! But as you say that you followed the HOWTO, and since I wrote the
> > HOWTO,
> > I guess that something in my procedures tripped you up that worked ok for
> > me :)
>
> Dont think so, I think it's me :-)
>
> >
> >
> > >
> > > I followed the mtd howto and I have a root partition(with the necessary
> > > files) and
> > > all I get is: "Kernel panic: I have no root and I want to scream"
> > > message.
> >
> > Hmm, what kernel version are you using? I've never seen that message (I've
> > seen Kernel panic: Unable to open root..blah blah..)
>
> I using a 2.4 kernel I pulled from Cort Dougan's PPC tree a few weeks ago.
> Can't remeber which version rigth now, I will have to check when I get back
> to work tomorrow. Should I change to the latest official kernel(2.4.3)?

I don't know. Never played with a non-x86 kernel (well if you don't count the
dragonball kernel variant).
I wouldn't think that you would need to update to the latest one, but i'll let
someone who know's reply.

Make sure that you have the latest sources from CVS patched in though. You
don't want to be playing with the
default mtd/jffs stuff that came with the kernel.


>
>
> >
> >
> > >
> > >
> > > first I tried to use "rdev zvmlinux /dev/mtdblock1", but
> > > the kernel ignored that an did a NFS mount as usual.
> >
> > Wait, wait, wait. What do you mean by this? This is *a problem* right
> > here.
> >
> > Why is it doing a NFS mount? Please describe your config and what you are
> > trying to do.
> > "usual" kernels don't NFS mount their root fs!
>
> I am using an RPX CLLF board with a PPC869T. I found a config under
> arch/ppc/defconfigs
> (If my memory don't fail me)
>
> In that config there were an automount(??) option enabled and a Root fs on
> NFS option also
> enabled.  I will  disable them and se what happens.

I don't think that just enabling these options actually *does* mount root over
nfs. It just allows
it. (Disclaimer: I've never mounted root over nfs myself so take this with a
pinch of salt).

>
>
> >
> >
> >
> > > I then
> > > specified on the kernel commad line: root=/dev/mtdblock1
> > > and the I got the kernel panic above.
> >
> > Well, the kernel may not be able to understand the "mtdblock1" device by
> > name unless you patched
> > the init/main.c file to list a conversion table from mtdblockxx to a
> > *device number*.
>
> Well, this I have not done. Cant remember I saw that in the mtd howto, is
> that patch
> included in later kernels?

You don't need to apply the patch if you stick with the rdev stuff, as that
uses device numbers to
tell the kernel what root is.

You may have to dive into the kernel sources and put prink's to see that your
kernel thinks root device is
that it's  trying to mount. That'll tell you where the problem lies in the
first place.

If it doesn't say something like 31:1 (for /dev/mtdblock1) then your rdev
command did not take. Investigate that then.

If your root device is correct then investigate why it could not mount it. You
did run lilo after you did rdev?



>
>
> Other questions i have:
>
>   Is mkfs.jffs2 Endian safe? I mean can I run mkfs.jffs2 on an Intel PC and
> then copy it to my RPX board?

There *are* people using mtd/jffs on PPC. See the list archives for some issues
that people have had and their possible solutions.

Hmm, you'r not trying to mount jffs as root before you can manually mount it as
a "regular" partition under full manual control?
If you have endian issues, they should pop up at that time. Debugging endian
issues and root mounting problems is not a good plan.


>
>
>   Is there a way to disable compression in JFFS2?

Not that I know of. I think it's in the to-do list. Ask David W.

>
>
> I have also noted that sym links in JFFS2 have zero size,  a bug?

David?


Vipin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
