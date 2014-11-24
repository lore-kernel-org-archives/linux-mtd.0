Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XspXH-0006Xy-Vh
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 09:02:20 +0000
Received: by mail-wi0-f172.google.com with SMTP id n3so4853112wiv.17
 for <linux-mtd@lists.infradead.org>; Mon, 24 Nov 2014 01:01:57 -0800 (PST)
Received: from [192.168.0.2]
 (host15-234-dynamic.54-79-r.retail.telecomitalia.it. [79.54.234.15])
 by mx.google.com with ESMTPSA id cr6sm20049042wjb.44.2014.11.24.01.01.56
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Mon, 24 Nov 2014 01:01:56 -0800 (PST)
Message-ID: <5472F403.50702@gmail.com>
Date: Mon, 24 Nov 2014 10:01:55 +0100
From: Angelo Dureghello <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBI 1MiB size partition
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

i read UBI faq and surfed the net, but can't find still a clear answer
to this:


I have a 1MiB partition on a nand flash o would like to format as UBI.
I already have the rootfs atrtached as UBI0 / UBI0_0, so i am going
to attach this partition as UBI1.

But with the available ubi commands i am not able. Is this a limitiation
due to the small partition size ?

[root@barix ~]# flash_erase /dev/mtd5 0 8
Erasing 128 Kibyte @ e0000 -- 100 % complete

[root@barix ~]# ubiattach -m 5
UBI: attaching mtd5 to ubi1
UBI: scanning is finished
UBI: empty MTD device detected
UBI warning: print_rsvd_warning: cannot reserve enough PEBs for bad PEB 
handling, reserved 4, need 20
UBI: attached mtd5 (name "config", size 1 MiB) to ubi1
UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
UBI: good PEBs: 8, bad PEBs: 0, corrupted PEBs: 0
UBI: user volume: 0, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence 
number: 193419012
UBI: available PEBs: 0, total reserved PEBs: 8, PEBs reserved for bad 
PEB handling: 4
UBI: background thread "ubi_bgt1d" started, PID 2686
UBI device number 1, total 8 LEBs (1015808 bytes, 992.0 KiB), available 
0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
[root@barix ~]#

[root@barix ~]# ubimkvol /dev/ubi1 -N config -m
ubimkvol: error!: UBI device does not have free logical eraseblocks

As you see, i can't create a volume so i cannot mount.
 From the tools help, seems i cannot set bad PEB handling count.

Every help is very appreciated.
Thanks
angelo
