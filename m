Received: from [209.92.187.33] (helo=core.arrancar.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Xrum-0005lz-00
	for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2003 23:53:16 +0000
Received: from core.arrancar.com (localhost [127.0.0.1])
	by core.arrancar.com (8.12.2/8.12.2) with ESMTP id h0CNfQMt030869
	for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2003 20:41:26 -0300
Subject: Re: JFFS2 on block devices
From: Federico Ferreres <fferreres@arrancar.com>
To: spse@secret.org.uk
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <E18Xox1-0004qA-00@spoinky.renegade.org.uk>
References: <1042352498.1998.19.camel@tp>
	<13805.1042363286@passion.cambridge.redhat.com>
	<1042402929.12878.10.camel@tp>   <E18Xox1-0004qA-00@spoinky.renegade.org.uk>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 12 Jan 2003 21:19:49 -0300
Message-Id: <1042417192.289.37.camel@tp>
Mime-Version: 1.0
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

On Sun, 2003-01-12 at 17:43, spse@secret.org.uk wrote:
> I would definitely advise that you make a backup of your jffs2 file
> somewhere as Im not sure the latest code has been that well tested by
> others.

Good tip :) ... I witnessed two halts and one crash with latest CVS
snapshot (11/1) ...

One halt on the first to mount the fs, after issuing mount, I stopped
the process (with ctrl-z) and then sent it to the background (bg 1). At
that point the machine locked up.

After a reboot I mounted it, but starting it directly as bg process and
everything was fine. After that, I umounted it and remounted it to do
some testing. And finally, umounted it again, and the computer froze.

The last problem was a single mount, and on next umount i got this:

Unmounting loopback JFFS2 filsystem...
Unable to handle kernel paging request at virtual address 921c3912
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<cc90fc32>]    Not tainted
EFLAGS: 00010282
eax: 921c390e   ebx: 921c390e   ecx: cb529e20   edx: ffffff67
esi: c8a497a0   edi: 00000000   ebp: c7a35ccc   esp: c3eddef4
ds: 0018   es: 0018   ss: 0018
Process umount (pid: 187, stackpage=c3edd000)
Stack: c8a49680 c3eddf44 c7a35c68 00000000 cc914ac8 c7a35ccc c8a497a0
c0149d79
       c8a49680 c8a49680 c0149e04 c8a49680 c3eddf44 c3eddf44 c0149f40
c3eddf44
       c7a35c00 c7a35c44 cc919080 cc9190c4 cb516d68 c8a492c8 c013b27f
c7a35c00
Call Trace:    [<cc914ac8>] [<c0149d79>] [<c0149e04>] [<c0149f40>]
[<cc919080>]
  [<cc9190c4>] [<c013b27f>] [<c014bd16>] [<c013f2ac>] [<c014c46b>]
[<c01278c2>]
  [<c014c484>] [<c0106f73>]

Code: 8b 5b 04 50 e8 19 e1 ff ff 83 c4 04 85 db 75 ee 8b 46 24 85
 /etc/rc.d/rc.jffs2: line 35:   187 Segmentation fault      umount
$destdir
blkmtd: Device or resource busy
ioctl: LOOP_CLR_FD: Device or resource busy


The syslog always warns about (both CVS and kernel versions):

Jan 12 20:51:10 fede kernel: blkmtd: erase: invalid erase request
0x2000D @ 0x14
5E8463
Jan 12 20:51:10 fede kernel: blkmtd: erase: invalid erase request
0x2000D @ 0x14
5C8456

I suppose it's normal.

That's about it. Haven't experienced any problem after a sucessfull
mount (except when trying to umount on some cases).

My humble startup script look as follows:

<<< /etc/rc.d/rc.jffs2

#!/bin/bash
srcimage="/var/compressed/volume0"
destdir="/mnt/z01/"
action=$1
mode=$2

if [ "$2" == "ro" ] ; then
   $options=" -r "
fi

case "$action" in
start)
   echo "Mounting loopback JFFS2 filesystem ..."
   if ! grep -q mtdblock /etc/mtab ; then
      losetup /dev/loop0 $srcimage
      modprobe blkmtd device=/dev/loop0
      nice -n 19 mount -t jffs2 $options /dev/mtdblock/0 $destdir 
   fi
   EXITCODE=0
   ;;
stop)
   echo "Unmounting loopback JFFS2 filesystem..."
   umount $destdir 
   rmmod blkmtd
   losetup -d /dev/loop0
   EXITCODE=0
   ;;
restart|reload)
   $0 stop $2
   $0 start $2
   EXITCODE=$?
   ;;

esac



> 
> 
> >Regards,
> >
> >Federico
> 
> cheers
> si
> 
