Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eGj0C-0000xM-6H
 for linux-mtd@lists.infradead.org; Mon, 20 Nov 2017 10:08:34 +0000
Received: by mail-qt0-x244.google.com with SMTP id r37so6033220qtj.12
 for <linux-mtd@lists.infradead.org>; Mon, 20 Nov 2017 02:08:10 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <TY1PR06MB0895157B208F8281B635340EC0220@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1505118928-3987-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1508853032-25229-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <658ceb2b-5d2b-9349-f140-27858459e5a8@wedev4u.fr>
 <CAMuHMdWZ=71XvVyzsiPyiAz+0RsCZjmWqqvOKs=bDdSQMpLmnA@mail.gmail.com>
 <TY1PR06MB0895157B208F8281B635340EC0220@TY1PR06MB0895.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Nov 2017 11:08:09 +0100
Message-ID: <CAMuHMdV0o0TYv0kgSdToW2S7q6xWDWjc3HV9KU7dKHdnRGU5gg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mtd: Add sst25vf016b to the list of
 supported chip names
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Biju Das <biju.das@bp.renesas.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabrizio,

On Mon, Nov 20, 2017 at 10:43 AM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>> On Fri, Nov 17, 2017 at 6:36 PM, Cyrille Pitchen
>> <cyrille.pitchen@wedev4u.fr> wrote:
>> BTW, "sst" (for Silicon Storage Technology) should be added to
>> Documentation/devicetree/bindings/vendor-prefixes.txt, too, to avoid another
>> warning:
>>
>> WARNING: DT compatible string vendor "sst" appears un-documented --
>> check ./Documentation/devicetree/bindings/vendor-prefixes.txt
>> #79: FILE: arch/arm/boot/dts/r8a7743-iwg20m.dtsi:79:
>> + compatible = "sst,sst25vf016b", "jedec,spi-nor";
>
> we did submit a patch to fix this ("of: add vendor prefix for Silicon Storage Technology Inc."):
> https://patchwork.kernel.org/patch/9946889/
>
> a while ago

And it is queued in dt-rh/for-next (I thought I had that tree included, but
apparently I hadn't. Fixed ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
