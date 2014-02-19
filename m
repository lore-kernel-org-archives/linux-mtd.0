Received: from mail-qg0-f45.google.com ([209.85.192.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGC7s-00048h-3m
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2014 18:44:09 +0000
Received: by mail-qg0-f45.google.com with SMTP id j5so1465561qga.4
 for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2014 10:43:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA83D17@DBDE04.ent.ti.com>
References: <CAAEAJfD4ddT0Av3ia-+hEf0aXKcyUK4j69YF-t=qTCLkum4a8A@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA83D17@DBDE04.ent.ti.com>
Date: Wed, 19 Feb 2014 15:43:42 -0300
Message-ID: <CAAEAJfD1Wh2qvf2mwikeBu=4h_TaHwrWGzpZNchXWV=1CDP3EA@mail.gmail.com>
Subject: Re: Question about AM335x SoC supported NAND flash
From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Stefan Roese <sr@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Daniel Mack <zonque@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pekon,

On 19 February 2014 14:55, Gupta, Pekon <pekon@ti.com> wrote:
[..]
>>
>>Accessing it from U-Boot and Linux works just fine, apparently in ECC BCH=
8 mode.
>>
>>However, we cannot get the SoC to boot from NAND. We've double-checked
>>the hardware
>>and the SYSBOOT, but still no luck with it.
>>
> It's a 4K pagesize device with OOBsize=3D128, so ROM code expects BCH16 E=
CC scheme
> to boot SPL. Though I have locally tested BCH16 support for both u-boot a=
nd kernel,
> And even booted end-to-end using BCH16 on beaglebone with 4K page NAND ca=
pe,
> But that's all locally..
> Many prior dependent patches are still awaiting acceptance in mainline li=
st.
>

Ah... so that would explain our complete failure.

Could you send me some draft patches or event just the entire driver
or at least point me to some git repo?

This issue is currently blocking us from shipping the board to my office
so we can continue with the rest of the broad bring-up.

Huge thanks for your answer! I almost went crazy with this :-)
--=20
Ezequiel Garc=EDa, VanguardiaSur
www.vanguardiasur.com.ar
