Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPoqx-0003Fk-Ra
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 11:40:21 +0000
Received: by mail-oi0-x22d.google.com with SMTP id c189so15726496oia.2
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2017 04:39:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AE0F02A50174E945B94BE6AC0B7199D81A593D0E@GOEMAIL-Server2.goerlitz.int>
References: <AE0F02A50174E945B94BE6AC0B7199D81A593D0E@GOEMAIL-Server2.goerlitz.int>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 27 Jun 2017 13:39:57 +0200
Message-ID: <CAFLxGvwa9psUt-Xy2R5Whwc+oF46USdMDekKqGWPEavb4d4DCg@mail.gmail.com>
Subject: Re: UBI bitrot checking and scrubbing
To: Stelling Carsten <Carsten.Stelling@goerlitz.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Carsten,

On Tue, Jun 27, 2017 at 12:59 PM, Stelling Carsten
<Carsten.Stelling@goerlitz.com> wrote:
> Hi,
>
> I found Richard=E2=80=99s patches http://lists.infradead.org/pipermail/li=
nux-mtd/2015-April/058677.html or
> http://lists.infradead.org/pipermail/linux-mtd/2015-November/063122.html,=
 but can't identify any
> of the code in newer kernel versions (e.g. 4.9 or 4.11).
> I wonder, if ubihealthd http://lists.infradead.org/pipermail/linux-mtd/20=
15-November/063128.html
> was never released with mtd-utils (actually 1.5.2). Possibly, I have miss=
ed some information on
> this topic.
> Is there actually a comparable mechanism in UBI, I haven=E2=80=99t found =
yet?
> Like wear levelling, reading and scrubbing (if necessary) *all* PEB=E2=80=
=99s from time to time is an
> essential task to ensure durability of information. Especially, for PEB=
=E2=80=99s which are not accessed
> frequently. With Fastmap enabled, one can't rely on cyclic reboots, becau=
se not all UBI
> VID/EC headers are read at boot time.
> Regarding bitrot checking, a lot of effort was made by several contributo=
rs, but I can't find
> their work in mainline kernel driver code. Have I overlooked something?
> Any hints or suggestions are greatly appreciated.

Since the MLC topic kind of faded away I had no chance to work on the
bitrot stuff.
But you are right we should revive ubihealthd and the needed kernel
interface because for Fastmap
this is a topic.

Would you volunteer to forward port the patches?

--=20
Thanks,
//richard
