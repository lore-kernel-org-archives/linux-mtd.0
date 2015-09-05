Received: from mail-la0-f42.google.com ([209.85.215.42])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYJoE-0001aW-0I
 for linux-mtd@lists.infradead.org; Sat, 05 Sep 2015 20:11:35 +0000
Received: by lanb10 with SMTP id b10so31016161lan.3
 for <linux-mtd@lists.infradead.org>; Sat, 05 Sep 2015 13:11:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87twr8ws6k.fsf@belgarion.home>
References: <1440441674-12103-1-git-send-email-robert.jarzmik@free.fr>
 <20150905183445.GB6978@laptop.cereza>
 <87twr8ws6k.fsf@belgarion.home>
Date: Sat, 5 Sep 2015 17:11:11 -0300
Message-ID: <CAAEAJfAz+WRjc1dPjbZ5hEjGoE-FZkUA=bexzUsGpaP2TMNo0A@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: switch to dmaengine
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5 September 2015 at 17:02, Robert Jarzmik <robert.jarzmik@free.fr> wrote=
:
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>
>> Robert,
>>
>> Just a couple of minor comments.
>>> +    dma_unmap_sg(info->dma_chan->device->dev,
>>> +                 &info->sg, 1, info->dma_dir);
>>
>> Unneeded line breaking.
> Indeed, for v2.
>
>>> +            r =3D platform_get_resource(pdev, IORESOURCE_DMA, 1);
>>> +            if (r =3D=3D NULL) {
>>> +                    dev_err(&pdev->dev,
>>> +                            "no resource defined for cmd DMA\n");
>>> +                    ret =3D -ENXIO;
>>> +                    goto fail_disable_clk;
>>> +            }
>>> +            info->drcmr_cmd =3D r->start;
>>
>> AFAICS, you only do data DMA, so this command resource can go away.
>> If you want to keep it for now and remove it as a follow up patch,
>> that's fine.
> Yeah, keep it in this patch, and change in a future patch (ie. keep curre=
nt
> behavior).
>
>> Other than this minor stuff:
>>
>> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Thanks, I'll add that in v2.
>
>> Tested on Armada 370 to make sure it doesn't cause any regressions.
> Good. Was it on top of linux-next or linux master ?
>

linux-next
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
