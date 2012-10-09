Received: from dalsmrelay2.nai.com ([205.227.136.216])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLXLf-0006FY-Gi
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2012 10:47:41 +0000
Message-ID: <5073FE55.2000402@snapgear.com>
Date: Tue, 9 Oct 2012 20:37:09 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: =?windows-1252?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] [RFC] mtd/uclinux: support ROM and allow passing the
 base address
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <50739A2A.9070405@snapgear.com> <20121009084418.GH18531@pengutronix.de>
In-Reply-To: <20121009084418.GH18531@pengutronix.de>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Uwe,

On 10/09/2012 06:44 PM, Uwe Kleine-K=F6nig wrote:
> On Tue, Oct 09, 2012 at 01:29:46PM +1000, Greg Ungerer wrote:
>> On 09/10/12 01:25, Uwe Kleine-K=C3=B7nig wrote:
>>> This allows to put the filesystem at a defined address in ROM allowing
>>> to save more precious RAM.
>>>
>>> I think it's save to default to ROM because the intention of using the
>>> uclinux map is to use a romfs and so mtd-ram doesn't give you anything
>>> that mtd-rom doesn't.
>>>
>>> Signed-off-by: Uwe Kleine-K=E2=94=9C=C3=80nig <u.kleine-koenig@pengutro=
nix.de>
>>
>> Looks good to me, so:
>>
>> Acked-by: Greg Ungerer <gerg@uclinux.org>
>>
>> Couple of things to be aware of. Artem currently has a couple of
>> patches against this file (looks like at least 1 of them is currently
>> in linux-next). It will probably conflict with your changes, should
>> be easy enough to fix up.
> If you tell me a branch to test, I can do so.

Sure. All three patches I sent to the linux-mtd list are here:

The following changes since commit 979570e02981d4a8fc20b3cc8fd651856c98ee9d=
:
   Linus Torvalds (1):
         Linux 3.6-rc7

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cfmmu

Greg Ungerer (3):
       mtd: fix wrong usage of ioremap_nocache() in uclinux.c map driver
       mtd: allow uclinux map driver to be used on any ColdFire CPU platfor=
m
       mtd: clean up uclinux.c map driver

  drivers/mtd/maps/Kconfig   |    2 +-
  drivers/mtd/maps/uclinux.c |   42=20
+++++++++++++++++++-----------------------
  2 files changed, 20 insertions(+), 24 deletions(-)


As far as I can see Artem has pushed the first 2 into for linux-next,
but not the third. I am hoping he hops in here and lets us know what
his intentions are with the third...

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
