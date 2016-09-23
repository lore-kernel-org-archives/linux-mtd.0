Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bnFKp-00053n-HQ
 for linux-mtd@lists.infradead.org; Fri, 23 Sep 2016 01:31:28 +0000
Received: by mail-wm0-x233.google.com with SMTP id w84so3423145wmg.1
 for <linux-mtd@lists.infradead.org>; Thu, 22 Sep 2016 18:31:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1474539180-5863-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1474539180-5863-1-git-send-email-boris.brezillon@free-electrons.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 22 Sep 2016 22:31:05 -0300
Message-ID: <CAAEAJfDHch0DuoFRix7kzy0D7pe9aERJcCG2MtWo0wO6o0-b4g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] mtd: nand: Abstract away the NAND interface type
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Peter Pan <peterpansjtu@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
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

On 22 September 2016 at 07:12, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi,
>
> This series is aiming at providing a generic NAND layer to share code
> between different NAND based devices.
>
> We currently have 3 different interfaces to interact with NANDs:
> - Raw NANDs
> - OneNANDs
> - SPI NANDs
>
> Apart from the way these NAND devices are accessed they have a lot
> in common, like the way the memory is organized, or their constraints.
> This is usually a good sign that some work should be done to factorize
> the code.
>
> This work has been started by Peter who wanted to re-use the BBT
> code for its SPI-NAND driver. But I think we can push it further
> other stuff (the software ECC implementation, or the way offsets are
> converted to block/page number).
>
> Before I continue in this direction, I'd like to get some feedback
> from Peter and those who reviewed his initial submission (Brian,
> Ezequiel) [1], or anyone who is interested in this topic.
>

The general idea looks sane to me. It looks like a very decent
step forward towards the infrastructure required for SPI NAND
devices.

If there's consensus about it, then let's do some tests on a bunch
of platforms and merge it.

Thanks,
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
