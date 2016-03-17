Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agXSE-0001kV-JN
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2016 12:55:10 +0000
Received: by mail-lf0-x22d.google.com with SMTP id h198so41711522lfh.0
 for <linux-mtd@lists.infradead.org>; Thu, 17 Mar 2016 05:54:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1603171240030.29358@lnxricardw1.se.axis.com>
References: <CABatt_y2rOZAvuamVoOxWSzkkGXNFFGvSQ5di4gb4EBFGYV7oQ@mail.gmail.com>
 <CAFLxGvwwQgKNT6=cL_hc05ZODtWyonA8MWyRWQJN_pXVf9SZOQ@mail.gmail.com>
 <CABatt_w_hXqUA45-MzU3_DRox0P9CwraTCY_TYPthdA3O0N-eQ@mail.gmail.com>
 <56EA7148.7050008@nod.at>
 <CABatt_xRMWwByY2nE8cpcjOL2jgt4yMhH9Gm4cWkxG_uhO7T5A@mail.gmail.com>
 <56EA943C.4000505@nod.at>
 <alpine.DEB.2.02.1603171240030.29358@lnxricardw1.se.axis.com>
Date: Thu, 17 Mar 2016 12:54:43 +0000
Message-ID: <CABatt_zxp-6s++zLeWfijdTT4fevgTPk97sue-3GGj_6wGgF0w@mail.gmail.com>
Subject: Re: UBIFS question
From: Martin Townsend <mtownsend1973@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

Hi Ricard, Richard

On Thu, Mar 17, 2016 at 11:43 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
>> > We expect the flash devices to start failing quicker than normally
>> > expected due to the environment in which they will be operating in, so
>> > sudden NAND blocks turning bad will eventually happen and what we
>> > would like to do is try and capture this as soon as possible.
>> > The boards are not accessible as they will be located in very remote
>> > locations so detecting these failures before the system locks up would
>> > be an advantage so we can report home with the information and fail
>> > over to the other filesystem (providing that hasn't also been
>> > corrupted).
>>
>> Dealing with sudden bad NAND blocks is almost impossible.
>> Unless you have a copy of each block.
>> NAND is not expected to gain bad blocks without an indication like
>> correctable bitflips.

I'm not interested in dealing with sudden bad NAND blocks, I accept
this will more than likely happen at some point but what I am
interested in is early detection.  Once the system has booted most
files will be cached to memory and the product that the flash devices
are in is designed to run for many months without being power cycled
so what I'm looking to do is monitor the health of the flash devices.
Ideally I would like to know FEC counts but I doubt I will get this
information :) But checking LEBs, pages etc for bad checksums would be
great.

>
> Yes, although the NAND flash documentation sometimes reads like blocks ca=
n
> suddenly 'go bad' for no special reason, in practice it is due to
> excessive erase/write cycles, i.e. its a wear problem.
>
> However, I don't know, if you are operating the flash in an environment
> where there is cosmic radiation that can actually damage the chip for
> instance, then of course any part of the chip could fail randomly with a
> fairly high probability. But NAND bad block management is not designed to
> take care of that case, which is why bad block detection is only done
> during block erasure (i.e. when a block fails to erase).
>
I'm not sure how much I can say I'm afraid as I'm under NDA but assume
that it is going to be operating in an environment where it's
receiving more cosmic radiation than expected. So I could look at the
bad block detection code to get some ideas?  I don't necessary want to
mark blocks as bad I just want to detect them so I have an idea that
the flash is failing.

Many Thanks,
Martin.

> /Ricard
> --
> Ricard Wolf Wanderl=C3=B6f                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
