Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pxVw-0000bm-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 20:21:20 +0100
Received: from mailc.telia.com ([194.22.190.4])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pxVu-0000bg-00
	for mtd@infradead.org; Wed, 18 Apr 2001 20:21:18 +0100
Message-ID: <003501c0c83d$36d89de0$d897143e@jocke>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Vipin Malik" <vipin.malik@daniel.com>
Cc: <mtd@infradead.org>
References: <001001c0c826$63b43200$0a01a8c0@Win1> <3ADDCACB.15BF0590@daniel.com>
Subject: Re: JFFS2 as root FS
Date: Wed, 18 Apr 2001 21:24:32 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


----- Original Message -----
From: "Vipin Malik" <vipin.malik@daniel.com>
To: <joakim.tjernlund@lumentis.se>
Cc: <mtd@infradead.org>
Sent: den 18 april 2001 19:11
Subject: Re: JFFS2 as root FS


> Joakim Tjernlund wrote:
>
> > Hi there
> >
> > Has anybody managed to get a root FS with JFFS2 to work?
>
> Sure! But as you say that you followed the HOWTO, and since I wrote the
> HOWTO,
> I guess that something in my procedures tripped you up that worked ok for
> me :)

Dont think so, I think it's me :-)

>
>
> >
> > I followed the mtd howto and I have a root partition(with the necessary
> > files) and
> > all I get is: "Kernel panic: I have no root and I want to scream"
> > message.
>
> Hmm, what kernel version are you using? I've never seen that message (I've
> seen Kernel panic: Unable to open root..blah blah..)

I using a 2.4 kernel I pulled from Cort Dougan's PPC tree a few weeks ago.
Can't remeber which version rigth now, I will have to check when I get back
to work tomorrow. Should I change to the latest official kernel(2.4.3)?

>
>
> >
> >
> > first I tried to use "rdev zvmlinux /dev/mtdblock1", but
> > the kernel ignored that an did a NFS mount as usual.
>
> Wait, wait, wait. What do you mean by this? This is *a problem* right
> here.
>
> Why is it doing a NFS mount? Please describe your config and what you are
> trying to do.
> "usual" kernels don't NFS mount their root fs!

I am using an RPX CLLF board with a PPC869T. I found a config under
arch/ppc/defconfigs
(If my memory don't fail me)

In that config there were an automount(??) option enabled and a Root fs on
NFS option also
enabled.  I will  disable them and se what happens.


>
>
>
> > I then
> > specified on the kernel commad line: root=/dev/mtdblock1
> > and the I got the kernel panic above.
>
> Well, the kernel may not be able to understand the "mtdblock1" device by
> name unless you patched
> the init/main.c file to list a conversion table from mtdblockxx to a
> *device number*.

Well, this I have not done. Cant remember I saw that in the mtd howto, is
that patch
included in later kernels?



Other questions i have:

  Is mkfs.jffs2 Endian safe? I mean can I run mkfs.jffs2 on an Intel PC and
then copy it to my RPX board?

  Is there a way to disable compression in JFFS2?

I have also noted that sym links in JFFS2 have zero size,  a bug?

>
>
> >
> >
> > Any Ideas?
>
> These are some.
>
> Vipin
>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
