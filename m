Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmEqy-0001L7-Hu
 for linux-mtd@lists.infradead.org; Sun, 05 Aug 2018 08:57:34 +0000
Date: Sun, 5 Aug 2018 10:57:17 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Raphael Pereira <raphaelpereira@gmail.com>
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Subject: Re: Suport for gf_len 14 in gpmi-nand for i.MX23 using Software BCH
 ECC
Message-ID: <20180805105717.4aab931b@bbrezillon>
In-Reply-To: <CAAN9NvcPHsUDcJY82DhX8SR1hXTzgY4N7ijp9XQAgBE66LUM_g@mail.gmail.com>
References: <CAAN9NvdvscL1MOKTXuH=Esf0NjC__QVH745n-h3R_hFfeqT9jw@mail.gmail.com>
 <20180804115555.667b3fb8@xps13>
 <CAAN9Nvcuz_KydZW0GHPHdz0j27rS=9onMxZ_3zpG-ELCTc7jKg@mail.gmail.com>
 <20180804193307.0ca82318@xps13>
 <CAAN9NvcPHsUDcJY82DhX8SR1hXTzgY4N7ijp9XQAgBE66LUM_g@mail.gmail.com>
MIME-Version: 1.0
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

Hi Raphael,

On Sat, 4 Aug 2018 21:39:13 -0300
Raphael Pereira <raphaelpereira@gmail.com> wrote:

> Hi Miqu=C3=A8l,
>=20
> This old thread mentions the exact same part I am trying to use and it
> seems to work on i.MX6 SOLO, which supports 40bit ECC strengh, so I
> think the MLC issue is not the case, although I could not find the
> solution used as it seems it is not explicit in the thread:
>=20
> http://lists.infradead.org/pipermail/linux-mtd/2015-April/058901.html

Trust me, getting the proper ECC config in place is just a tiny part of
the problem. I'm not saying supporting MLC NANDs is impossible, but it
requires spending a non-negligible amount of time to make it work
reliably (see [1] and [2] if you need more details).

Regards,

Boris

[1]https://events.static.linuxfound.org/sites/events/files/slides/brezillon=
-mlc-nand_0.pdf
[2]https://elinux.org/images/5/54/Weinberger.pdf
