Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMCo2-0002Zt-2p
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 12:58:40 +0000
Date: Tue, 5 Dec 2017 13:58:04 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Peter Pan =?UTF-8?B?5r2Y5qCL?= (peterpandong)" <peterpandong@micron.com>
Cc: Peter Pan <peterpansjtu@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v6 00/15] A SPI NAND framework under generic NAND framework
Message-ID: <20171205135804.478902dc@bbrezillon>
In-Reply-To: <A0FE66EC-7E17-43BE-9B66-896F112B92A0@micron.com>
References: <20170529225931.226da943@bbrezillon>
 <90bcb366-c494-2dee-3bb7-d16b77e347c6@exceet.de>
 <20171204150514.1f17671d@bbrezillon>
 <A0FE66EC-7E17-43BE-9B66-896F112B92A0@micron.com>
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

Hi Peter,

Can you please try to fix your mailer so that we can distinguish what
is quoted from what you add?

On Tue, 5 Dec 2017 01:35:05 +0000
Peter Pan =E6=BD=98=E6=A0=8B (peterpandong) <peterpandong@micron.com> wrote:

>=20
> I=E2=80=99m still waiting for your git branch for spi NAND. Is this the b=
ranch
> I=E2=80=99m waiting for?

Yes, it's the branch I promised to share with you, but I didn't
communicate on it since it's not yet in a clean state (still have to
add kerneldoc headers, test everything, provide proper commit
message, fix authorship, ...).

> I just took a quick look at
> it and I found you put more common code into new Nand core. This is
> cool. I thought we will do this job after spi NAND being merged.

Well, I don't think there's more code than before, it's just that I
reworked the logic so that it could be more useful to other NAND
sub-layers.

> Anyway, do you want both spi and raw NAND code to be rebased on new
> NAND core or we just put spi NAND in?

That's another decision I took in this rework: I want to keep existing
raw/parallel NAND framework unchanged, because it's a real pain to
validate that everything works as expected when you do such invasive
changes as the bbt rework we had done in earlier versions of this
series.

> Anything I can help to speed the
> spi NAND merge up?

Testing and reviewing, as usual. I'd really like to get the preparation
patches (all patches touching mtd core code) in 4.16. For the rest, it
really depends how much time you and other contributors (including me)
can spend testing/reviewing/fixing/documenting the code.

I am totally aware that I'm the one blocking the progress on this
framework because of my constant hesitations on what the generic NAND
layer should look like, but I'm a bit more confident now that we
isolated the raw NAND code from the generic NAND changes (less risks of
breaking existing NAND users).

Regards,

Boris
