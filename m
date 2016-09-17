Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1blCQP-0005Ge-HF
 for linux-mtd@lists.infradead.org; Sat, 17 Sep 2016 10:00:46 +0000
Received: by mail-oi0-x243.google.com with SMTP id w11so8656895oia.0
 for <linux-mtd@lists.infradead.org>; Sat, 17 Sep 2016 03:00:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1468961462-18082-1-git-send-email-zajec5@gmail.com>
References: <1468961462-18082-1-git-send-email-zajec5@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 17 Sep 2016 12:00:22 +0200
Message-ID: <CAFLxGvwsKqTVAgXyzOkjXcBmA-joyJPioD5-svhjXPU3NRi33Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: add support for partition parsers
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 open list <linux-kernel@vger.kernel.org>
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

Rafa=C5=82,

On Tue, Jul 19, 2016 at 10:51 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com=
> wrote:
> This extends MTD subsystem by adding a support for partition parsers
> that should be used for creating subpartitions. There are some types of
> partitions that require splitting, like firmware containers.
> It's common some home routers that a single firmware image gets flashed
> to predefined partition and then we need to parse it dynamically.
>
> The reason for having such parsers is to share code. Right now we have
> e.g. TRX parsing implemented in bcm47xxpart but this could be used in
> more cases (e.g. on ramips which doesn't use bcm47xxpart or with DT).
>
> This implementation requires marking partition as requiring parsing with
> a specific parser. This can be used right away with some parsers like
> bcm47xxpart, in future we will hopefully also find a solution for doing
> it with ofpart ("fixed-partitions").
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
> One thing I'm not proud of in this patch is struct mtd_partition casting
> in order to be able to modify partition offset. It's marked as const so
> it was the only way I could think of. Any better ideas? Currently parser
> gets a single MTD and it doesn't have to deal with its offset, which I
> kind of like as it simplifies things.

I have to admit, I don't fully understand what you are trying to solve.
Why are you introducing a new concept of partition parsing in patch 2/2?
We have already one.

Are you unhappy with the way parsers are _requested_?
Currently MTD core tries cmdlinepart and ofpart, drivers can override that.
Do you need a way to request a parser via DT or cmdline?

--=20
Thanks,
//richard
