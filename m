Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M9TJ-0007wr-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 15:35:41 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D995554@webmail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'Vipin Malik' <vipin.malik@daniel.com>, David Woodhouse
	 <dwmw2@infradead.org>
Cc: Frederic Giasson <fgiasson@mediatrix.com>,
	linux-mtd@lists.infradead.org, jffs-dev@axis.com, Jean-Denis Boyer
	 <jdboyer@mediatrix.com>
Subject: RE: JFFS2 Stability problem!
Date: Mon, 16 Jul 2001 10:34:40 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Here are Vipin's debug terminal log:

<snip>

Message from syslogd@elan at Sun Jul 15 12:27:26 2001 ...
elan kernel: 4c6d10 is obsolete... skipping

Message from syslogd@elan at Sun Jul 15 12:27:56 2001 ...
elan kernel: 00000, bad_size 0x00000000 (total 0x00800000 of =
0x00800000)

Message from syslogd@elan at Sun Jul 15 12:28:17 2001 ...
elan kernel: 29298, erasing_size 0x00000000, bad_size 0x00000000 (total =

0x00800000 of 0x00800000)

Message from syslogd@elan at Sun Jul 15 12:29:59 2001 ...
elan kernel: 31ba0c is obsolete... skipping

Message from syslogd@elan at Sun Jul 15 12:30:30 2001 ...
elan kernel:  nextblock->free_size 0x0003b150

<snip>

Message from syslogd@elan at Sun Jul 15 15:08:44 2001 ...
elan kernel: 006c0000, nextblock->free_size 0x000366b8

Message from syslogd@elan at Sun Jul 15 15:08:44 2001 ...
elan kernel: 000000, bad_size 0x00000000 (total 0x00800000 of =
0x00800000)

Message from syslogd@elan at Sun Jul 15 15:10:07 2001 ...
elan kernel: 00, bad_size 0x00000000 (total 0x00800000 of 0x00800000)

Message from syslogd@elan at Sun Jul 15 15:10:12 2001 ...
elan kernel: 00000, bad_size 0x00000000 (total 0x00800000 of =
0x00800000)


P.S. I did not get those errors on my terminal, though.

Fr=E9d=E9ric Giasson





-----Original Message-----
From: Vipin Malik [mailto:vipin.malik@daniel.com]
Sent: Monday, July 16, 2001 10:37 AM
To: David Woodhouse
Cc: Frederic Giasson; linux-mtd@lists.infradead.org; jffs-dev@axis.com;
Jean-Denis Boyer
Subject: Re: JFFS2 Stability problem!


David Woodhouse wrote:

> fgiasson@mediatrix.com said:
> >       I found a stability problem that looks like a flash space =
leak
while
> > running intense test case with JFFS2.
>
> Definitely looks like a leak. Does the space come back after an =
unmount
and
> remount?

[root@elan /root]# rm -rf /mnt/jffs2/*

[root@elan /root]# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock1            8192      2544      5648  31% /mnt/jffs2

[root@elan /root]# umount /mnt/jffs2/
[root@elan /root]#
[root@elan /root]# mount -t jffs2 /dev/mtdblock1 /mnt/jffs2/
[root@elan /root]#
[root@elan /root]# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock1            8192      1284      6908  16% /mnt/jffs2

[root@elan /root]#

Hence Yes!

Vipin
P.S. I also got some strange (debug type) messages from JFFS2 on the
terminal I
was running the program at, but NOT on the serial console (why?)
I sent those to Frederic. I don't have access to those here, but maybe
Frederic
can forward them to you. It may help decipher what is going on.
