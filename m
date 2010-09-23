Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OynVc-0005Tq-EX
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 15:14:53 +0000
Received: by pxi4 with SMTP id 4so590724pxi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 08:14:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6E1A182A06054C5A99BD3C0D3202C24F@THOR>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR>
	<AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com>
	<74A5BE60138147F696E151AACD52EDEE@THOR>
	<AANLkTintkdKGpkUGMkgGbVK6Pb3cttspwnuPQR=DJxnm@mail.gmail.com>
	<D3A375B91F5944B38630B07214914DF8@THOR>
	<AANLkTinotjfB26VPmF7_vx8M1kX5cYMzygFMk8X6exww@mail.gmail.com>
	<341EADF720C14B4F86C63204D9C60723@THOR>
	<AANLkTikXbKZLFOCBDkrwgVPJEYTwF88xBtYFnwaTQH+5@mail.gmail.com>
	<6E1A182A06054C5A99BD3C0D3202C24F@THOR>
Date: Thu, 23 Sep 2010 17:14:44 +0200
Message-ID: <AANLkTikWUOOWCjQyuMyqR+eUgP8hLHcoN=vHpagkaoOQ@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
From: Yegor Yefremov <yegorslists@googlemail.com>
To: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fl=C3=A1vio,

> I think I might found something:
>
> In cfi_probe.c, starting at line 222, there are these lines:
>
> cfi_send_gen_cmd(0xaa, addr_unlock1, base, map, cfi, cfi->device_type,
> NULL);
> cfi_send_gen_cmd(0x55, addr_unlock2, base, map, cfi, cfi->device_type,
> NULL);
> cfi_send_gen_cmd(0x90, addr_unlock1, base, map, cfi, cfi->device_type,
> NULL);
>
> Which seems the correct way to CFI query the chip, but the last line is
> 0x90.
> Datasheet states that 0x90 is Software ID and CFI Query Entry is 0x98
>
> Could that be the problem?

I'm not sure it is. Because if you compare both SST39VF6401B and
SST39VF3201, they both have the same sequences for Software ID and CFI
Query Entry. The SST39VF3201 will be detected without JEDEC probe in
2.6.35, so only by cfi_probe() means.

Try to apply this patch http://patchwork.ozlabs.org/patch/50906/, that
was mentioned by Guillaume.

Regards,
Yegor
