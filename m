Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDTtH-00079O-9U
 for linux-mtd@lists.infradead.org; Thu, 16 Jun 2016 09:47:11 +0000
Received: by mail-oi0-x22a.google.com with SMTP id w5so60660707oib.2
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jun 2016 02:46:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1811946.TqycnYvpkR@pfaehler-pc>
References: <1811946.TqycnYvpkR@pfaehler-pc>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 16 Jun 2016 11:46:49 +0200
Message-ID: <CAFLxGvzxEkRfGzxsxS3_xYupPvAXNO6X9AMi=6SQzXYqBLqiqQ@mail.gmail.com>
Subject: Re: UBI: recover_peb and power cut safety
To: =?UTF-8?B?SsO2cmcgUGbDpGhsZXI=?= <pfaehler@isse.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

J=C3=B6rg,

On Thu, Jun 16, 2016 at 10:37 AM, J=C3=B6rg Pf=C3=A4hler <pfaehler@isse.de>=
 wrote:
> Hi,
>
> I would greatly appreciate some clarification with respect to power cut s=
afety
> during writing of an erase block in UBI, specifically power cut safety of
> recover_peb.
>
> During a normal write operation (ubi_eba_write_leb in mtd/ubi/eba.c) UBI =
tries
> to move the contents of the block (and the new contents) to a new locatio=
n via
> recover_peb, if the write fails. However, recover_peb does not seem to us=
e the
> capability to exchange the (logical) block atomically (as
> ubi_eba_atomic_leb_change in mtd/ubi/eba.c does). Specifically, it does n=
ot
> seem to write the amount of data and its checksum to the VID header. Thus=
, if
> the system crashes in the middle of recover_peb before the old/broken blo=
ck
> could be erased, we are left with a newer version of the block (the seque=
nce
> number in the header is increased by recover_peb), but without having mov=
ed
> all the contents of the old block. This would obviously lead to data loss=
.
> Thus, It seems to me that recover_peb (and therefore ubi_eba_write_leb) i=
s not
> power cut safe or is there some other mechanism distinct from the one use=
d by
> ubi_eba_atomic_leb_change to achieve this? If not I would suggest using
> ubi_eba_atomic_leb_change in ubi_eba_write_leb instead of recover_peb.

Hmm, you are right, if ubi_eba_write() is facing -EIO from the MTD driver w=
e can
lose the whole erase block upon power cut.
So you found a bug. :-)

Artem, can you tell more on this?
I'd guess that recover_peb() is older than ubi_eba_atomic_leb_change() and
therefore it was not used.
And nobody noticed so far since the condition is hard to hit.

That said, switching to ubi_eba_atomic_leb_change() seems like a good
plan to me.
J=C3=B6rg, please send a patch and explain how you tested it.

--=20
Thanks,
//richard
