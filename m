Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OejCJ-0006eV-CH
	for linux-mtd@lists.infradead.org; Fri, 30 Jul 2010 06:36:00 +0000
Received: by eyd10 with SMTP id 10so574999eyd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Jul 2010 23:35:58 -0700 (PDT)
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTi=7-Ur35OzqF7iJtiPzfc-Jp-ANGwa3g_Y=+ae8@mail.gmail.com>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
	<1280244340.3021.38.camel@localhost.localdomain>
	<AANLkTi=7-Ur35OzqF7iJtiPzfc-Jp-ANGwa3g_Y=+ae8@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 30 Jul 2010 09:35:55 +0300
Message-Id: <1280471755.2838.29.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-07-28 at 13:04 +0200, Arno Steffen wrote:
> Thanks Artem,
> I am using a 2.6.33 kernel, this should be new enough. It is right,
> that it is as a block device (in  /dev/ ) ?

No, _all_ UBI devices are character devices. New UBIFS can mount these
character devices, old UBIFS cannot, and requires deviceless mounting.

As documented here:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mount_ubifs

2.6.33 indeed should be able to mount /dev/ubi0_0.

But because your system is strange in a way that your UBI devices are
block devices, this does not work.

> [root@or:/]# ubiattach /dev/ubi_ctrl -m 8 -d 8
> UBI: attaching mtd8 to ubi8
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    129024 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          512 (aligned 512)
> UBI: data offset:                2048
> UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB
> handling, reserved 1, need 3
> UBI: attached mtd8 to ubi8
> UBI: MTD device name:            "extra"
> UBI: MTD device size:            41 MiB
> UBI: number of good PEBs:        331
> UBI: number of bad PEBs:         1
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     1
> UBI: available PEBs:             0
> UBI: total number of reserved PEBs: 331
> UBI: number of PEBs reserved for bad PEB handling: 1
> UBI: max/mean erase counter: 1/0
> UBI: image sequence number: 228182237
> UBI: background thread "ubi_bgt8d" started, PID 386
> UBI device number 8, total 331 LEBs (42706944 bytes, 40.7 MiB),
> available 0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)
> [root@or:/]# ll /dev/ubi*
> brw-rw----    1 root     root     253,   0 Jan  1 00:00 /dev/ubi8
> brw-rw----    1 root     root     253,   1 Jan  1 00:00 /dev/ubi8_0
> crw-rw----    1 root     root      10,  63 Jan  1 00:00 /dev/ubi_ctrl

Wrong. Everything has to be character devices.

> [root@or:/]#
> [root@or:/]# mount -t ubifs /dev/ubi8 /tmp
> mount: mounting /dev/ubi8 on /tmp failed: No such device
> [root@or:/]# mount -t ubifs /dev/ubi8_0 /tmp
> mount: mounting /dev/ubi8_0 on /tmp failed: No such device

These do not work because /dev/ubi* have to be chdev.

> [root@or:/]# mount -t ubifs ubi8_0 /tmp
> mount: mounting ubi8_0 on /tmp failed: No such device
> [root@or:/]# mount -t ubifs ubi8 /tmp
> mount: mounting ubi8 on /tmp failed: No such device

Do you have volume 0 on ubi8?

Please, send me ls /sys/class/ubi/ and ls /sys/class/ubi/ubi8/

Also, please, check /proc/devices and make sure ubi is in "Character
devices" list.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
