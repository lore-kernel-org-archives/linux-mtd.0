Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M9NP-0007w0-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 15:29:36 +0100
Message-ID: <3B52FC26.840B1832@daniel.com>
Date: Mon, 16 Jul 2001 09:37:26 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Frederic Giasson <fgiasson@mediatrix.com>,
 	linux-mtd@lists.infradead.org, jffs-dev@axis.com,
 	Jean-Denis Boyer <jdboyer@mediatrix.com>
Subject: Re: JFFS2 Stability problem!
References: <F1BED55F35F4D3118C0F00E0295CFF4D995552@webmail.mediatrix.com> <21355.995292592@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:

> fgiasson@mediatrix.com said:
> >       I found a stability problem that looks like a flash space leak while
> > running intense test case with JFFS2.
>
> Definitely looks like a leak. Does the space come back after an unmount and
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
P.S. I also got some strange (debug type) messages from JFFS2 on the terminal I
was running the program at, but NOT on the serial console (why?)
I sent those to Frederic. I don't have access to those here, but maybe Frederic
can forward them to you. It may help decipher what is going on.
