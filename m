Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rVX5-0001Yx-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 02:52:55 +0100
Date: Sun, 22 Apr 2001 18:52:23 -0700
From: David Schleef <ds@schleef.org>
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Cc: David Woodhouse <dwmw2@infradead.org>, mtd@infradead.org
Subject: Re: JFFS2 as root FS
Message-ID: <20010422185223.A7345@stm.lbl.gov>
Reply-To: David Schleef <ds@schleef.org>
References: <002d01c0ca3a$23ee2f20$5cd9b5d4@jocke> <000901c0c90c$2acad3e0$8b96143e@jocke> <000e01c0c8d6$dfb791c0$0a01a8c0@Win1> <19069.987688353@redhat.com> <2192.987784007@redhat.com> <32289.987852161@redhat.com> <006801c0caa0$bdbf8fc0$8997143e@jocke>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <006801c0caa0$bdbf8fc0$8997143e@jocke>; from Joakim.Tjernlund@lumentis.se on Sat, Apr 21, 2001 at 10:22:08PM +0200
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

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
