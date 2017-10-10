Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1w1X-000126-Do
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 15:00:53 +0000
Received: by mail-qt0-x22a.google.com with SMTP id p1so14730354qtg.2
 for <linux-mtd@lists.infradead.org>; Tue, 10 Oct 2017 08:00:26 -0700 (PDT)
MIME-Version: 1.0
Sender: romain.izard@mobile-devices.fr
In-Reply-To: <20171010161659.4117677c@bbrezillon>
References: <20171006155108.6581-1-romain.izard.pro@gmail.com>
 <20171010161659.4117677c@bbrezillon>
From: Romain Izard <romain.izard.pro@gmail.com>
Date: Tue, 10 Oct 2017 17:00:05 +0200
Message-ID: <CAGkQfmPTC60A3W0YNJKU61NweSxmfC0xaR7BoT6CG6t7BEEDrw@mail.gmail.com>
Subject: Re: [PATCH] crypto: atmel-aes - properly set IV after {en,de}crypt
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 David Gstir <david@sigma-star.at>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-crypto@vger.kernel.org,
 Nicolas Feignon <nicolas.feignon@mobile-devices.fr>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-10-10 16:16 GMT+02:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> Hi Romain,
>
> May I ask why you're sending this patch to the MTD ML?
>
This is related to an issue reported by Nicolas Feignon with UBIFS and
fscrypt, which was reported on both mtd and fscrypt mailing lists.

The file names are encrypted with cts(cbc(aes)), and this patch tried to
fix a SAMA5D2 issue where the file names are not correctly encrypted
when hardware acceleration is enabled.

> While I'm here, can you have a look at this patch [1] and add you
> Reviewed-by/Tested-by?
>
> [1]http://patchwork.ozlabs.org/patch/821959/

I'll try it.

-- 
Romain Izard
