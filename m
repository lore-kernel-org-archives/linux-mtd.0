Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMX8k-0000Ru-Pg
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2012 04:46:28 +0000
Received: by mail-vc0-f177.google.com with SMTP id p16so3170490vcq.36
 for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2012 21:46:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5073FE55.2000402@snapgear.com>
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <50739A2A.9070405@snapgear.com> <20121009084418.GH18531@pengutronix.de>
 <5073FE55.2000402@snapgear.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 12 Oct 2012 00:46:04 -0400
Message-ID: <CAMjpGUe_aTEjGF9q1uraU_ikCif0J-+bSTLkr-X6jEYqjMHOtQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] mtd/uclinux: support ROM and allow passing the base
 address
To: Greg Ungerer <gerg@snapgear.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Greg Ungerer <gerg@uclinux.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 9, 2012 at 6:37 AM, Greg Ungerer <gerg@snapgear.com> wrote:
> On 10/09/2012 06:44 PM, Uwe Kleine-K=C3=B6nig wrote:
>> On Tue, Oct 09, 2012 at 01:29:46PM +1000, Greg Ungerer wrote:
>>> On 09/10/12 01:25, Uwe Kleine-K=C3=83=C2=B7nig wrote:
>>>> This allows to put the filesystem at a defined address in ROM allowing
>>>> to save more precious RAM.
>>>>
>>>> I think it's save to default to ROM because the intention of using the
>>>> uclinux map is to use a romfs and so mtd-ram doesn't give you anything
>>>> that mtd-rom doesn't.
>>>>
>>>> Signed-off-by: Uwe Kleine-K=C3=A2=E2=80=9D=C5=93=C3=83=E2=82=ACnig <u.=
kleine-koenig@pengutronix.de>
>>>
>>> Looks good to me, so:
>>>
>>> Acked-by: Greg Ungerer <gerg@uclinux.org>
>>>
>>> Couple of things to be aware of. Artem currently has a couple of
>>> patches against this file (looks like at least 1 of them is currently
>>> in linux-next). It will probably conflict with your changes, should
>>> be easy enough to fix up.
>>
>> If you tell me a branch to test, I can do so.
>
> Sure. All three patches I sent to the linux-mtd list are here:
>
> The following changes since commit 979570e02981d4a8fc20b3cc8fd651856c98ee=
9d:
>   Linus Torvalds (1):
>         Linux 3.6-rc7
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cfmmu
>
> Greg Ungerer (3):
>       mtd: fix wrong usage of ioremap_nocache() in uclinux.c map driver
>       mtd: allow uclinux map driver to be used on any ColdFire CPU platfo=
rm
>       mtd: clean up uclinux.c map driver
>
>  drivers/mtd/maps/Kconfig   |    2 +-
>  drivers/mtd/maps/uclinux.c |   42
> +++++++++++++++++++-----------------------
>  2 files changed, 20 insertions(+), 24 deletions(-)
>
>
> As far as I can see Artem has pushed the first 2 into for linux-next,
> but not the third. I am hoping he hops in here and lets us know what
> his intentions are with the third...

so to be clear, Uwe's patch hasn't been picked up by anyone yet so we
can get it fixed first ?
-mike
