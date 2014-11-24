Received: from mail-vc0-x22e.google.com ([2607:f8b0:400c:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsqZp-0008Cc-4M
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 10:09:01 +0000
Received: by mail-vc0-f174.google.com with SMTP id id10so989465vcb.19
 for <linux-mtd@lists.infradead.org>; Mon, 24 Nov 2014 02:08:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5472F403.50702@gmail.com>
References: <5472F403.50702@gmail.com>
Date: Mon, 24 Nov 2014 11:08:36 +0100
Message-ID: <CAFLxGvzqmPwEgyD3kcEhmeGp_+kYKiKqvGMQW=+1PxzJ5+YwmA@mail.gmail.com>
Subject: Re: UBI 1MiB size partition
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Angelo Dureghello <angelo70@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 24, 2014 at 10:01 AM, Angelo Dureghello <angelo70@gmail.com> wrote:
> Dear all,
>
> i read UBI faq and surfed the net, but can't find still a clear answer
> to this:
>
>
> I have a 1MiB partition on a nand flash o would like to format as UBI.
> I already have the rootfs atrtached as UBI0 / UBI0_0, so i am going
> to attach this partition as UBI1.
>
> But with the available ubi commands i am not able. Is this a limitiation
> due to the small partition size ?
>
> [root@barix ~]# flash_erase /dev/mtd5 0 8
> Erasing 128 Kibyte @ e0000 -- 100 % complete
>
> [root@barix ~]# ubiattach -m 5
> UBI: attaching mtd5 to ubi1
> UBI: scanning is finished
> UBI: empty MTD device detected
> UBI warning: print_rsvd_warning: cannot reserve enough PEBs for bad PEB
> handling, reserved 4, need 20
> UBI: attached mtd5 (name "config", size 1 MiB) to ubi1
> UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> UBI: good PEBs: 8, bad PEBs: 0, corrupted PEBs: 0
> UBI: user volume: 0, internal volumes: 1, max. volumes count: 128
> UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number:
> 193419012
> UBI: available PEBs: 0, total reserved PEBs: 8, PEBs reserved for bad PEB
> handling: 4
> UBI: background thread "ubi_bgt1d" started, PID 2686
> UBI device number 1, total 8 LEBs (1015808 bytes, 992.0 KiB), available 0
> LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
> [root@barix ~]#
>
> [root@barix ~]# ubimkvol /dev/ubi1 -N config -m
> ubimkvol: error!: UBI device does not have free logical eraseblocks
>
> As you see, i can't create a volume so i cannot mount.
> From the tools help, seems i cannot set bad PEB handling count.

The number depends on CONFIG_MTD_UBI_BEB_LIMIT.
What is your use case for UBI on such a small MTD partition?

-- 
Thanks,
//richard
