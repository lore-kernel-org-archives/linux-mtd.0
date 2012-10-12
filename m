Received: from dnvwsmailout1.mcafee.com ([161.69.31.173])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMYEr-0005Gh-PR
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2012 05:56:50 +0000
Message-ID: <5077B167.40009@snapgear.com>
Date: Fri, 12 Oct 2012 15:57:59 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] [RFC] mtd/uclinux: support ROM and allow passing the
 base address
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <50739A2A.9070405@snapgear.com> <20121009084418.GH18531@pengutronix.de>
 <5073FE55.2000402@snapgear.com>
 <CAMjpGUe_aTEjGF9q1uraU_ikCif0J-+bSTLkr-X6jEYqjMHOtQ@mail.gmail.com>
In-Reply-To: <CAMjpGUe_aTEjGF9q1uraU_ikCif0J-+bSTLkr-X6jEYqjMHOtQ@mail.gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Greg Ungerer <gerg@uclinux.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de,
 =?windows-1252?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/10/12 14:46, Mike Frysinger wrote:
> On Tue, Oct 9, 2012 at 6:37 AM, Greg Ungerer <gerg@snapgear.com> wrote:
>> On 10/09/2012 06:44 PM, Uwe Kleine-K=C3=B7nig wrote:
>>> On Tue, Oct 09, 2012 at 01:29:46PM +1000, Greg Ungerer wrote:
>>>> On 09/10/12 01:25, Uwe Kleine-K=E2=94=9C=C3=80nig wrote:
>>>>> This allows to put the filesystem at a defined address in ROM allowin=
g
>>>>> to save more precious RAM.
>>>>>
>>>>> I think it's save to default to ROM because the intention of using th=
e
>>>>> uclinux map is to use a romfs and so mtd-ram doesn't give you anythin=
g
>>>>> that mtd-rom doesn't.
>>>>>
>>>>> Signed-off-by: Uwe Kleine-K=C3=94=C3=B6=C2=A3=E2=94=9C=C3=87nig <u.kl=
eine-koenig@pengutronix.de>
>>>>
>>>> Looks good to me, so:
>>>>
>>>> Acked-by: Greg Ungerer <gerg@uclinux.org>
>>>>
>>>> Couple of things to be aware of. Artem currently has a couple of
>>>> patches against this file (looks like at least 1 of them is currently
>>>> in linux-next). It will probably conflict with your changes, should
>>>> be easy enough to fix up.
>>>
>>> If you tell me a branch to test, I can do so.
>>
>> Sure. All three patches I sent to the linux-mtd list are here:
>>
>> The following changes since commit 979570e02981d4a8fc20b3cc8fd651856c98e=
e9d:
>>    Linus Torvalds (1):
>>          Linux 3.6-rc7
>>
>> are available in the git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cfmm=
u
>>
>> Greg Ungerer (3):
>>        mtd: fix wrong usage of ioremap_nocache() in uclinux.c map driver
>>        mtd: allow uclinux map driver to be used on any ColdFire CPU plat=
form
>>        mtd: clean up uclinux.c map driver
>>
>>   drivers/mtd/maps/Kconfig   |    2 +-
>>   drivers/mtd/maps/uclinux.c |   42
>> +++++++++++++++++++-----------------------
>>   2 files changed, 20 insertions(+), 24 deletions(-)
>>
>>
>> As far as I can see Artem has pushed the first 2 into for linux-next,
>> but not the third. I am hoping he hops in here and lets us know what
>> his intentions are with the third...
>
> so to be clear, Uwe's patch hasn't been picked up by anyone yet so we
> can get it fixed first ?

I haven't picked it up. I assumed Artem would, but I have not seen
any response from him on this yet.

I thought you where going to put a comment in there,
http://mailman.uclinux.org/pipermail/uclinux-dev/2012-May/051873.html

In any case, Uwe, that thread states what the issue is when it came
up a few months back.

Regards
Greg



--=20
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
