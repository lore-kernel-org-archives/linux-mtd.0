Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xtzm5-0007sI-FK
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 14:10:26 +0000
Received: by mail-vc0-f177.google.com with SMTP id ij19so2212473vcb.36
 for <linux-mtd@lists.infradead.org>; Thu, 27 Nov 2014 06:10:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <150521CB44B50A4A98049E9C7BAFB0F30D9A823E@DETENEXMB01.delta.corp>
References: <150521CB44B50A4A98049E9C7BAFB0F30D9A823E@DETENEXMB01.delta.corp>
Date: Thu, 27 Nov 2014 15:10:03 +0100
Message-ID: <CAFLxGvzuz7FyDoOsVtHg20XDkaT4N=_oOeMTSRsXr9bZtCW8uQ@mail.gmail.com>
Subject: Re: UBIFS corruption after power cut
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Anton Habegger <Anton.Habegger@delta-es.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 27, 2014 at 1:48 PM, Anton Habegger
<Anton.Habegger@delta-es.com> wrote:
> Hello
>
> We got an unrecoverable UBI file system after power cut. It happens only =
ones and it is not reproducible yet.
> U-Boot is able to load a file from this file system, but the recovering p=
art on linux fails.
> The corruption occurs on a powerpc device (mpc5125) with kernel 2.6.34.

IIRC mainline 2.6.34 has no drivers for the mpc5125.
The board support drivers from Freescale I've seen are in a bad shape.
So I'd first investigate into that.
Does your board pass both UBI and MTD tests?

> I tried to overcome this issue with the more recent back port repository =
from http://git.infradead.org/users/dedekind/ubifs-v2.6.34.git and I also e=
mulated an MTD device with mtdram module on kernel 3.13 (Ubuntu 14.4). Unfo=
rtunately both versions aren't able to recover the image.
>
> I see following scenarios:
> - An UBI image created with 2.6.34 can became corrupted with power cuts d=
ue to open bugs at this time. This image will be never recoverable. Is this=
 possible?

If UBI did a boo boo the image is corrupted.
Maybe manual recover is possible.

> - There is a misconfiguration somewhere
> - There is a bug in the 3.13

Why a bug in 3.13?

> - Anything else..

Most UBI issues I've seen are related to MTD driver issues.

--=20
Thanks,
//richard
