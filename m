Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rcfj-00035H-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 10:30:19 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'David Schleef'" <ds@schleef.org>
Cc: "'David Woodhouse'" <dwmw2@infradead.org>, <mtd@infradead.org>
Subject: RE: JFFS2 as root FS
Date: Mon, 23 Apr 2001 11:28:53 +0200
Message-ID: <001801c0cbd7$d09d70c0$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010422185223.A7345@stm.lbl.gov>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi again

I noted that your man page(nice work) states that JFFS2 and mkfs.jffs2 do
not
support hard links, but the MTD homepage states otherwise.
Is it just mkfs.jffs2 that don't support hardlinks?

         Jocke

-----Original Message-----
From: David Schleef [mailto:ds@stm.lbl.gov]On Behalf Of David Schleef
Sent: Monday, April 23, 2001 3:52
To: Joakim Tjernlund
Cc: David Woodhouse; mtd@infradead.org
Subject: Re: JFFS2 as root FS


On Sat, Apr 21, 2001 at 10:22:08PM +0200, Joakim Tjernlund wrote:
> > Joakim.Tjernlund@lumentis.se said:
> > > In the mean time I would appriciate any pointers to fix the endian
> > > problems in mkfs.jffs2 and how to disable compression in JFFS2(can
> > > that  be done with mkfs.jffs2?).
> >
> > David Schleef gave me patches to do byteswapping the other day. I
> requested
> > some cleanups but his code was perfectly usable as it was.
>
> Sure would like to lay my hands on that code ...


I just checked it in, along with a man page describing the various
options as I understand them.  I also wrote a little shell script
that creates a test filesystem and compares it to a reference
filesystem.  The reference filesystems were created on i386 and
powerpc hosts before I made the endianness changes.  The limit
of my testing is creating a BE JFFS2 filesystem on an i386 and
comparing it to the reference filesystem -- they were identical,
so I called the operation a success.  I'll check in the test
script in the next couple days.




dave...



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
