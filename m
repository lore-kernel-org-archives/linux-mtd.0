Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Qr3V-0001o4-Gq
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 17:05:34 +0100
Received: from 127.0.0.1 (lserver.ddiworldwide.com [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id 143836D00BD
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jun 2003 12:01:38 -0400 (EDT)
Received: from plinux (plinux.ddiworldwide.com [192.168.1.128])
	by lserver.ddiworldwide.com (Postfix) with ESMTP id 0271D6D00BC
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jun 2003 16:01:38 +0000 (UTC)
From: Frank R Callaghan <f.callaghan@ieee.org>
To: linux-mtd@lists.infradead.org
Date: Fri, 13 Jun 2003 11:53:42 -0400
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
In-Reply-To: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
MIME-Version: 1.0
Message-Id: <200306131153.42657.f.callaghan@ieee.org>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: Please Help, problem mounting jffs2
Reply-To: f.callaghan@ieee.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Sid, but I don't think I'm getting that far :(

# mount -t jffs2 /dev/mtdblock0 /var/fixed_flash &
# mtdblock_open
ok

# ps ax
  PID TTY     Uid        Size State Command
    1         root        468   S   init
    2         root          0   S   [keventd]
    3         root          0   S   [ksoftirqd_CPU0]
    4         root          0   S   [kswapd]
    5         root          0   S   [bdflush]
    6         root          0   D   [kupdated]
    7         root          0   S   [mtdblockd]
   11         root          0   S   [kjournald]
   35         root        376   S   /sbin/udhcpc -n -s=20
/etc/udhcpd/default.scri
   41         nobody      472   S   /sbin/boa
   46         root        492   S   /sbin/bftpd -d
   50         root          0   S   [rpciod]
   54         root          0   S   [kjournald]
   81         root       1528   R   /myapp/hiresprinthead
   83         root        656   R   /myapp/hires_controler
   85 ttyS1   root        488   S   -sh
   87 ttyS1   root        468   D   mount -t jffs2 /dev/mtdblock0=20
/var/fixed_fl
   88 ttyS1   root        468   R   mount -t jffs2 /dev/mtdblock0=20
/var/fixed_fl
   92 ttyS1   root        460   R   ps ax



On Friday 13 June 2003 11:47 am, Sid Gluckman wrote:
> I am kind of a newbie to the jffs2 thing but are you sure that it is ju=
st
> "sitting" there?  I found that when a jffs2 system is mounted for the f=
irst
> time with something in the filesystem it goes through some kind of
> cataloging function where I'm guessing it is characterizing the device =
for
> bad flash bytes?  Anyways, if you do a 'df' in another shell while it i=
s
> sitting there you will see that the device is mounted and that the used
> space first slowly cycles to fully used then slowly back down to the
> correct used space.  I'm sure someone else could enlighten us both as t=
o
> what it is actually doing during this time.  Once it completes this cyc=
le
> everything is fine and it doesn't do it on subsequent mounts.  Dependin=
g on
> the flash size this could take quite a while.
>
> Hope this helps.
>
> Sid
>
> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org
> [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Frank R
> Callaghan
> Sent: Friday, June 13, 2003 8:52 AM
> To: linux-mtd@lists.infradead.org
> Subject: Please Help, problem mounting jffs2
>
>
> Hi All,
>
> I have a problem with mounting my new mtd/jffs2 system
> after lots of experiment I have found the after doing
> 'eraseall /dev/mtd0' I can 'mount -t jffs2 /dev/mtdblock0 /mnt/flash'
> with no problem :) but if I umount it and try to re-mount it
> will sit there forever !
> If I cp a jffs2.img to the device the mount will also lockup
> If I erase -> mount I can create files df with no problems,
>
> It seem like the mount does not like mounting with anything
> in the filesystem !
>
> What infomation should I gather to find out whats gonig on here ?
>
> Any help greatly appreciated,
>
> TIA,
>         Frank.
>
>
>
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
