Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9EFC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 21:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jr5W3N6jEOdHPJz4znY2BLSN59C6J1SpKUt0uAVX5Vk=; b=u+E9BBbOSO4rAT
	bq2IChfN+P7U/RntApqJoJ88JjJQE5vqVlo7ine8yJUIIGgDPf22QQ7JW8iRpPa2gHHwnw/wyJSTD
	O9ZvgqYx9xLha/VT4q+LLxW8/fuwFv3CLrg0MZZstkzYPyK9o1eHsXUXA7/AeUBxvJRSyLrtLG4ff
	6FY2QcOwpObyjOQPnVoTStsk3ZoDSzUn/HXgQsxYY9bZ0fhdeBiYgI1aFOfjInJw1oRLbYvJNRe8I
	iLb7SCbEmIoqY9DkJNDIsKuhSGzVkhaYkii+fJCqstjH0WLrpR6+qedkkW+yTyhpRn6XlW6yV87gE
	LcBbOM8BRYoZ9ryN+KHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nldCx-002jOO-Tq; Mon, 02 May 2022 21:03:52 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nldCu-002jN1-1P; Mon, 02 May 2022 21:03:50 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQgtC-1nRE0N25x8-00NfoJ; Mon, 02 May 2022 23:03:45 +0200
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2f7d621d1caso161151877b3.11; 
 Mon, 02 May 2022 14:03:43 -0700 (PDT)
X-Gm-Message-State: AOAM533TzyhAKLHgLT/StsdwiagW4EbAtsmsK0gPK6VR4vfx45TJqDbh
 dz6E2TpgJxE9H4wkVzvVhfLdqnTLJme6bVfZmek=
X-Google-Smtp-Source: ABdhPJxEvI0WTai1d3ZR4KU3iW8w7Gb+IOi/NcLSYY9Kzki6UUTmpSHsKHSdyZ16RsjoU/k3UwknsKUnnDH1BVJBWs0=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr13273488ywk.209.1651525422593; Mon, 02
 May 2022 14:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
 <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
 <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
 <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
 <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net>
 <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
 <b13783aa-9225-d52a-3800-c97ad772688b@roeck-us.net>
 <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
 <CAK8P3a3jiqf_zpBsZyvAb5ZtkwDa7KkqExqDAdpY_pYqkr_NgQ@mail.gmail.com>
 <4dcdbfe2-9edf-320b-d123-3b62c8b5e28e@roeck-us.net>
 <CAK8P3a0ogn1wgPBDHkT=Fb8ufA+y8Ax1Qov2-vRXfC08QqnrQA@mail.gmail.com>
 <c001d58e-9a78-6338-a533-d0f215b3dfd1@roeck-us.net>
In-Reply-To: <c001d58e-9a78-6338-a533-d0f215b3dfd1@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 2 May 2022 23:03:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1X3YH0RqqmqgqFAaY94yreD-PfY-pvyMf+xU3nGeqvsg@mail.gmail.com>
Message-ID: <CAK8P3a1X3YH0RqqmqgqFAaY94yreD-PfY-pvyMf+xU3nGeqvsg@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>, 
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 patches@opensource.cirrus.com, 
 linux-leds@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, linux-rtc@vger.kernel.org, 
 USB list <linux-usb@vger.kernel.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
X-Provags-ID: V03:K1:O4oZsAaOi/qiRRsdDkHJcuyKlbCAVMDL7sEfZJQH2VeIT9npLq2
 fDT1FmsbP1t4T0ZxsFKdUB5A6/p2/xWgrLfFE/pZCIYOzaR2eLHEQ1n4zmUHw0osdyGXT0J
 kdnkeenGq6pXuha/ggpr1GwrwZOFrQ656uRQPmY4FlH5xaHHDyApfrTEBblgElYdhU8uskU
 f8MTB0KkzJul8zo03eHvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BPaJ3EIF6fk=:39u1Z8HBd9InB3vEUd9AMB
 c95dpfnPGV0hBgED1pEzqbnS1FLr4uglOGjbXCB87+H/fWmlFUdU0ubagrfJlJodgN/HB0Bnt
 2YfIGt7Og3bHUU8difq+GWWG/SZFecCd1LB/mRUJJi5vk38njzrCIhTMbuX22D4KVUrdBxBza
 YRxj1zDS8XlmunCC0ZTOQI6j6Ep9pzUBMb8tmQ3OGHSekFmdtblmzSrb0bMfdLZzIRmQx4SnX
 nwtHVoSZ7DM2JQDEvBpHtoFPXK8WBmn4BwYyCo2JD6VHs5gv6OTXDHnu6Rz1qJ4y+cxNz57+O
 9tbeMKYM19rg496VjQf2rL51GWCO2tbY80L9TXQ/txktgzDFiK9O1sTuKsZQVwkPBCJZ+k1HB
 qxDm11LFR8p+tNcQCoFA5qFfEACe6rBnYKSYBfwdtMY/2NJmj35ukvUBAaNhJFX6Z8W7v7cI0
 WNjzgZrcYBw4cPQQFFa5ZyZm0fSPkMFi7yyMsXWOZgioYlk5ksnTJqZ3nNxPQFRqo/ZbGjogl
 lb8QGsQBqLjmF23Xa7cjnmLJ+NFI7k/Tl+Ta5JY9/HJpfWNsuagqhP5nAKUAFI3lOutTnqEpN
 qnW1gAdoA+DjByN0E+M+8RTsAvABPhSbZZsCg+9VOHrz982wMP/bIrw1FNjRQ6bszApm9CRW1
 87foCfgPZh//4231N+7nQG/5ne0paCJ2H/iI2a4eu87IJ5dff/4mPbVJbZjTRaXLhlrZZlgSW
 1sI6aktu+IJhS6LeKSFm/hjaq5Ood+kH7pnc8fO+pybC5hQ5VYH1EfyTQ2ICbIxBv6/JSBXWp
 6hSCzLaTrYDfe19WKI4wE46tWZqUQZ/qrQzCLALX6BkHn2TyGM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_140348_427751_6B49A11D 
X-CRM114-Status: GOOD (  16.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, May 2, 2022 at 10:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/2/22 12:21, Arnd Bergmann wrote:
> >
>
> To boot from initrd:
>
> qemu-system-arm -M z2 -kernel \
>       arch/arm/boot/zImage -no-reboot -initrd \
>       rootfs-armv5.cpio --append \
>       "panic=-1 slub_debug=FZPUA rdinit=/sbin/init console=ttyS0" -nographic \
>       -monitor null -serial stdio
>
> where rootfs-armv5.cpio is from my repository at github.com.
>
> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/rootfs-armv5.cpio.gz
>

Ok, that works here with any configuration, I don't see a regression.
Could this be a problem with the size increase? The machine only has
32MB of RAM, so it's possible that the multiplatform-enabled kernel
with DT support etc pushes it over the edge, especially with an initramfs.

My configuration is clearly a bit different from yours, so I tried giving it
a larger initramfs file, which randomly crashes elsewhere for me:

[    0.648659] pxa2xx-uart.0: ttyS0 at MMIO 0x40100000 (irq = 38,
base_baud = 928571) is a UART1
[    0.697984] kworker/u2:0 invoked oom-killer:
gfp_mask=0x100cca(GFP_HIGHUSER_MOVABLE), order=0, oom_score_adj=0
[    0.698278] CPU: 0 PID: 7 Comm: kworker/u2:0 Not tainted
5.18.0-rc1-00109-gee927ad51300-dirty #52
[    0.698382] Hardware name: Zipit Z2
[    0.698520] Workqueue: events_unbound async_run_entry_fn
[    0.699063]  unwind_backtrace from show_stack+0x18/0x1c
[    0.699148]  show_stack from dump_header+0x68/0x254
[    0.699186]  dump_header from out_of_memory+0x474/0x4f0
[    0.699208]  out_of_memory from __alloc_pages+0xa0c/0xb84
[    0.699227]  __alloc_pages from shmem_getpage_gfp.constprop.0+0x270/0x9e0
[    0.699247]  shmem_getpage_gfp.constprop.0 from
generic_perform_write+0xd8/0x210
[    0.699268]  generic_perform_write from __generic_file_write_iter+0x130/0x198
[    0.699286]  __generic_file_write_iter from generic_file_write_iter+0x64/0xd0
[    0.699302]  generic_file_write_iter from __kernel_write+0x114/0x2b0
[    0.699321]  __kernel_write from kernel_write+0x68/0x194
[    0.699337]  kernel_write from xwrite+0x3c/0x78
[    0.699363]  xwrite from do_copy+0xc0/0x11c
[    0.699381]  do_copy from write_buffer+0x2c/0x44
[    0.699397]  write_buffer from flush_buffer+0x3c/0xa0
[    0.699413]  flush_buffer from __gunzip+0x2a4/0x364
[    0.699434]  __gunzip from gunzip+0x2c/0x34
[    0.699449]  gunzip from unpack_to_rootfs+0x19c/0x304
[    0.699465]  unpack_to_rootfs from do_populate_rootfs+0x6c/0x1dc
[    0.699483]  do_populate_rootfs from async_run_entry_fn+0x44/0x1a0
[    0.699502]  async_run_entry_fn from process_one_work+0x1e8/0x544
[    0.699520]  process_one_work from worker_thread+0x34/0x578
[    0.699579]  worker_thread from kthread+0xdc/0x114
[    0.699599]  kthread from ret_from_fork+0x14/0x2c
[    0.699651] Exception stack(0xc2821fb0 to 0xc2821ff8)
[    0.699711] 1fa0:                                     00000000
00000000 00000000 00000000
[    0.699731] 1fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    0.699744] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    0.699801] Mem-Info:
[    0.699889] active_anon:90 inactive_anon:674 isolated_anon:0
[    0.699889]  active_file:0 inactive_file:0 isolated_file:0
[    0.699889]  unevictable:0 dirty:0 writeback:0
[    0.699889]  slab_reclaimable:0 slab_unreclaimable:1691
[    0.699889]  mapped:0 shmem:771 pagetables:0 bounce:0
[    0.699889]  kernel_misc_reclaimable:0
[    0.699889]  free:207 free_pcp:37 free_cma:0
[    0.699986] Node 0 active_anon:360kB inactive_anon:2696kB
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:3084kB
writeback_tmp:0kB kernel_stack:192kB pagetables:0kB all_unreclaimable?
yes
[    0.700116] Normal free:828kB boost:1024kB min:1464kB low:1572kB
high:1680kB reserved_highatomic:0KB active_anon:360kB
inactive_anon:2696kB active_file:0kB inactive_file:0kB unevictable:0kB
writepending:0kB present:32768kB managed:12232kB mlocked:0kB
bounce:0kB free_pcp:148kB local_pcp:148kB free_cma:0kB
[    0.700177] lowmem_reserve[]: 0 0
[    0.700247] Normal: 3*4kB (UM) 2*8kB (UM) 2*16kB (M) 0*32kB 0*64kB
0*128kB 1*256kB (M) 1*512kB (M) 0*1024kB = 828kB

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
