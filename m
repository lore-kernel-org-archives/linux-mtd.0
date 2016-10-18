Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwai1-00089C-62
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 20:10:02 +0000
Received: by mail-oi0-x22f.google.com with SMTP id y2so6216271oie.0
 for <linux-mtd@lists.infradead.org>; Tue, 18 Oct 2016 13:09:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5d8e8bc09c75405a783990312dd1dc41@agner.ch>
References: <5d8e8bc09c75405a783990312dd1dc41@agner.ch>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 18 Oct 2016 22:09:39 +0200
Message-ID: <CAFLxGvxTgNm3H9NvOGVjA9=0yLTdnMQBW9UUFmsX7kLChCeo2A@mail.gmail.com>
Subject: Re: UBI assert failed in wl_tree_add at 168 using v4.9-rc1
To: Stefan Agner <stefan@agner.ch>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stefan,

On Tue, Oct 18, 2016 at 9:51 PM, Stefan Agner <stefan@agner.ch> wrote:
> Hi All,
>
> After flashing and 2-3 hard resets (power-cut), I happen to get a lot of
> the following stack traces:
>
> [   33.031951] UBI assert failed in wl_tree_add at 168 (pid 1)
> [   33.037763] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 4.9.0-rc1-00001-g4b1532a-dirty #568
> [   33.046071] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
> [   33.052596] Backtrace:
> [   33.055143] [<c010c3b8>] (dump_backtrace) from [<c010c5b0>]
> (show_stack+0x18/0x1c)
> [   33.062831]  r7:00000000[   33.065223]  r6:60000013
>  r5:00000000[   33.068891]  r4:c0e2352c
> [   33.071484]
> [   33.073043] [<c010c598>] (show_stack) from [<c03f7da8>]
> (dump_stack+0xb4/0xe8)
> [   33.080402] [<c03f7cf4>] (dump_stack) from [<c05b80dc>]
> (wl_tree_add+0xb8/0xd0)
> [   33.087829]  r9:c0c54860[   33.090215]  r8:cdd62e88
>  r7:ce458000[   33.093885]  r6:cddfdcd8
>  r5:cddfc82c[   33.097556]  r4:cddfdaf8
> [   33.100167] [<c05b8024>] (wl_tree_add) from [<c05b9f68>]
> (ubi_wl_init+0x218/0x6d8)
> [   33.107860]  r10:c165e66c[   33.110341]  r9:cdd5a90c
>  r8:cdd62e88[   33.114010]  r7:00000d27
>  r6:cddfdcd8[   33.117681]  r5:cdd62000
> [   33.120275]  r4:cddd8cc0[   33.122663]  r3:0000069c
> [   33.125254]
> [   33.126810] [<c05b9d50>] (ubi_wl_init) from [<c05bd2a0>]
> (ubi_attach+0x1fc/0x394)
> [   33.134415]  r10:00000001[   33.136889]  r9:cdd5a980
>  r8:cdd63000[   33.140557]  r7:cdd5a900
>  r6:cdd62000[   33.144228]  r5:00000000
> [   33.146822]  r4:cdd68500[   33.149208]
> [   33.150770] [<c05bd0a4>] (ubi_attach) from [<c05af73c>]
> (ubi_attach_mtd_dev+0x4d8/0xdd0)
> [   33.158980]  r10:00000014[   33.161457]  r9:00000800
>  r8:00000000[   33.165126]  r7:cdd63000
>  r6:cdc97400[   33.168796]  r5:cdd62000
> [   33.171391]  r4:fffff800[   33.173779]  r3:00000002
> [   33.176370]
> [   33.177931] [<c05af264>] (ubi_attach_mtd_dev) from [<c0d46f54>]
> (ubi_init+0x1cc/0x28c)
> [   33.185969]  r10:c0d00618[   33.188447]  r9:000fffff
>  r8:c0e3a9cc[   33.192116]  r7:c0d69370
>  r6:c0d69374[   33.195787]  r5:cdc97400
> [   33.198380]  r4:00000000[   33.200766]
> [   33.202331] [<c0d46d88>] (ubi_init) from [<c010194c>]
> (do_one_initcall+0x44/0x180)
> [   33.210022]  r10:c0d00618[   33.212494]  r9:00000000
>  r8:00000000[   33.216163]  r7:c0d5e854
>  r6:c0e72000[   33.219834]  r5:c0d46d88
> [   33.222428]  r4:ffffe000[   33.224814]
> [   33.226375] [<c0101908>] (do_one_initcall) from [<c0d00e58>]
> (kernel_init_freeable+0x128/0x1f0)
> [   33.235198]  r8:000000e9[   33.237583]  r7:c0d5e854
>  r6:c0e72000[   33.241252]  r5:c0e72000
>  r4:00000008[   33.244920]
> [   33.246488] [<c0d00d30>] (kernel_init_freeable) from [<c0967908>]
> (kernel_init+0x10/0x11c)
> [   33.254877]  r10:00000000[   33.257352]  r9:00000000
>  r8:00000000[   33.261021]  r7:00000000
>  r6:00000000[   33.264692]  r5:c09678f8
> [   33.267286]  r4:00000000[   33.269672]
> [   33.271238] [<c09678f8>] (kernel_init) from [<c0107e70>]
> (ret_from_fork+0x14/0x24)
> [   33.278929]  r5:c09678f8[   33.281321]  r4:00000000
> [   33.283912]
>
> The system successfully boots in the end (after printing out such traces
> for a minute or so).
>
> This is on a NXP Vybrid using the vf610-nfc driver. The driver is
> mainline since some releases now, and I haven't seen such a stack trace
> before.
>
> I do use fastmap and a 2015.04 U-Boot to read the kernel/device tree
> from a separate volume.
>
> Anybody else seen this?

Does this patch help?
http://lists.infradead.org/pipermail/linux-mtd/2016-October/069702.html

I'm assuming that the problem first appeared in v4.9-rc1, right?

-- 
Thanks,
//richard
