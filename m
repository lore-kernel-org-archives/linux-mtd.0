Received: from smtp14.mail.ru ([94.100.176.91])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbgiN-0007Jg-5W
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 22:25:04 +0000
Received: from [94.242.50.174] (port=61758 helo=[192.168.0.91])
	by smtp14.mail.ru with asmtp id 1QbgiI-00084C-00
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 02:24:58 +0400
Message-ID: <4E0A5531.7020304@mail.ru>
Date: Wed, 29 Jun 2011 02:26:57 +0400
From: Nikolai Zhubr <zhubr@mail.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 oops
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello people,

I'm getting an oops in (or related to) JFFS2 filesystem in stock kernel 
2.6.36.4 on ARM with a real MTD memory and I've found that it also 
happens on x86_64 opensuse 11.3 kernel 2.6.34-12-desktop with mtdram 
simulator if 256K erase-block size is specified.

The oops is fully reproducible and happens immediately on mount attempt. 
I think, the data was not even subject to sudden power failure or any 
such event. Just upon normal reboot it failed to mount.
Some logs are attached below.

The image (300Kb) causing this oops can be found here:
http://n-a-zhubr.narod.ru/openwrt/jffs2oops.img.gz
(hopefully the link works for all, otherwise I can email it personally 
to whoever is interested)
The size of erase block is set to 256K because my device of interest 
does have it this way.

Please CC me, I'm not subscribed.
Thank you.
Nikolai ZHUBR
===================================================================
JFFS2 error: (233) jffs2_link_node_ref: Adding new ref c59eaeec at 
(0x00000000-0x00000034) not immediately after previous 
(0x00000000-0x00000000)
kernel BUG at fs/jffs2/nodelist.c:644!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c59ec000
[00000000] *pgd=059e8031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
last sysfs file: /sys/kernel/uevent_seqnum
Modules linked in:
CPU: 0    Not tainted  (2.6.36.4 #50)
===================================================================
2.6.34-12-desktop:
kernel:[ 1192.811506] ------------[ cut here ]------------
kernel:[ 1192.811512] invalid opcode: 0000 [#1] PREEMPT SMP
kernel:[ 1192.811515] last sysfs file: /sys/devices/virtual/bdi/31:0/uevent
kernel:[ 1192.811628] Stack:
kernel:[ 1192.811640] Call Trace:
kernel:[ 1192.811805] Code: 8b b6 b0 02 00 00 41 83 e0 fc 46 8d 0c 01 48 
89 d9 83 e2 fc 01 d0 89 14 24 48 c7 c2 50 4f aa a0 89 44 24 08 31 c0 e8 
9e d7 a0 e0 <0f> 0b 0f 0b 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 48 83 
ec 08
