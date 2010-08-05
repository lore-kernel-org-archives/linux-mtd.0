Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh0QG-0003LD-T9
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 13:23:49 +0000
Received: by wyf19 with SMTP id 19so3472061wyf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 06:23:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTikZb=R=8BObvTN6uGaZGAmvvUZd4oYKvkCJih7H@mail.gmail.com>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
	<1280244340.3021.38.camel@localhost.localdomain>
	<AANLkTi=7-Ur35OzqF7iJtiPzfc-Jp-ANGwa3g_Y=+ae8@mail.gmail.com>
	<1280471755.2838.29.camel@localhost.localdomain>
	<AANLkTikZb=R=8BObvTN6uGaZGAmvvUZd4oYKvkCJih7H@mail.gmail.com>
Date: Thu, 5 Aug 2010 09:23:46 -0400
Message-ID: <AANLkTi=4FzeMQAgOFg8gQ9Z6gjXjSg36QSOvEryA72zs@mail.gmail.com>
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: twebb <taliaferro62@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> cat /proc/devices give me back, that =A0(252 ubi8) is a character device.
> But looking above, in /dev it is listed as block device !?!
>
> For me creating entries are not transparent, this happend with
> ubiattach. No idea how to force ubiattach to write ubi8 in the
> devicelist as character device.
> Best regards
> Arno
>

I see similar oddities on my 2.6.29 kernel with UBI.  ls shows ubi
devices as blocks, but /proc/devices shows then as char devices.

[/]#
[/]# ls -l /dev/ubi*
brw-rw----    1 root     root     250,   0 Aug  5 12:53 /dev/ubi0
brw-rw----    1 root     root     250,   1 Aug  5 12:53 /dev/ubi0_0
brw-rw----    1 root     root     250,   2 Aug  5 12:53 /dev/ubi0_1
brw-rw----    1 root     root     250,   3 Aug  5 12:53 /dev/ubi0_2
brw-rw----    1 root     root     250,   4 Aug  5 12:53 /dev/ubi0_3
crw-rw----    1 root     root      10,  62 Aug  5 12:53 /dev/ubi_ctrl
[/]#
[/]# cat /proc/devices
Character devices:
  1 mem
  4 /dev/vc/0
  4 tty
  4 ttyS
  5 /dev/tty
  5 /dev/console
  5 /dev/ptmx
  7 vcs
 10 misc
 13 input
 14 sound
 29 fb
 81 video4linux
 90 mtd
108 ppp
116 alsa
128 ptm
136 pts
180 usb
188 ttyUSB
189 usb_device
216 rfcomm
250 ubi0
251 usb_endpoint
252 usbmon
253 ttyHS
254 rtc

Block devices:
  1 ramdisk
259 blkext
  7 loop
  8 sd
 31 mtdblock
 65 sd
 66 sd
 67 sd
 68 sd
 69 sd
 70 sd
 71 sd
128 sd
129 sd
130 sd
131 sd
132 sd
133 sd
134 sd
135 sd
179 mmc
[/]#
