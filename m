Received: from vs19.mail.saunalahti.fi ([62.142.117.200])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCQIh-0006fF-HD
 for linux-mtd@lists.infradead.org; Mon, 13 Jun 2016 11:45:05 +0000
Received: from vams (localhost [127.0.0.1])
 by vs19.mail.saunalahti.fi (Postfix) with SMTP id 1FAEB2009F
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jun 2016 14:44:41 +0300 (EEST)
Received: from gw02.mail.saunalahti.fi (gw02.mail.saunalahti.fi
 [195.197.172.116])
 by vs19.mail.saunalahti.fi (Postfix) with ESMTP id EBBD82009F
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jun 2016 14:44:40 +0300 (EEST)
Received: from [192.168.8.100] (85-76-131-176-nat.elisa-mobile.fi
 [85.76.131.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by gw02.mail.saunalahti.fi (Postfix) with ESMTPSA id A8CEB400EE
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jun 2016 14:44:39 +0300 (EEST)
Subject: Re: [PATCH v2] MTD: lantiq: handle NO_XIP on cfi0001 flash
References: <1465245341-16026-1-git-send-email-hauke@hauke-m.de>
 <CAOiHx=kit1Fz2hTmyxStzCfGDDpc4vcx06E2JVmwve8tTWo7Gg@mail.gmail.com>
 <910195ee-2b46-bb69-472c-15c6321e9e5d@hauke-m.de>
 <CAOiHx=mbRCU_Wh+vaT+RZcjJWTvBautp9eAJT_Gv7JyfVfQ8Yw@mail.gmail.com>
 <008252fa-88a8-1187-e898-cd233180d9ab@phrozen.org>
 <DUB122-W4035B8D72611A0E5C4EF228C530@phx.gbl>
To: linux-mtd@lists.infradead.org
From: Matti Laakso <malaakso@elisanet.fi>
Message-ID: <575E9CA6.7010109@elisanet.fi>
Date: Mon, 13 Jun 2016 14:44:38 +0300
MIME-Version: 1.0
In-Reply-To: <DUB122-W4035B8D72611A0E5C4EF228C530@phx.gbl>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Subject: Re: [PATCH v2] MTD: lantiq: handle NO_XIP on cfi0001 flash
> > To: jogo@openwrt.org; hauke@hauke-m.de
> > CC: linux-mtd@lists.infradead.org; dwmw2@infradead.org; 
> malaakso@elisanet.fi
> > From: john@phrozen.org
> > Date: Tue, 7 Jun 2016 07:15:42 +0200
> >
> >
> >
> > On 06/06/2016 23:54, Jonas Gorski wrote:
> > > On 6 June 2016 at 23:38, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> > >> On 06/06/2016 11:10 PM, Jonas Gorski wrote:
> > >>> Hi,
> > >>>
> > >>> On 6 June 2016 at 22:35, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> > >>>> From: John Crispin <john@phrozen.org>
> > >>>>
> > >>>> This uses the same device tree attribute as physmap_of.c
> > >>>>
> > >>>> Signed-off-by: John Crispin <john@phrozen.org>
> > >>>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> > >>>> ---
> > >>>> drivers/mtd/maps/lantiq-flash.c | 6 +++++-
> > >>>> 1 file changed, 5 insertions(+), 1 deletion(-)
> > >>>>
> > >>>> diff --git a/drivers/mtd/maps/lantiq-flash.c 
> b/drivers/mtd/maps/lantiq-flash.c
> > >>>> index c8febb3..88fc6d9 100644
> > >>>> --- a/drivers/mtd/maps/lantiq-flash.c
> > >>>> +++ b/drivers/mtd/maps/lantiq-flash.c
> > >>>> @@ -137,7 +137,11 @@ ltq_mtd_probe(struct platform_device *pdev)
> > >>>> if (!ltq_mtd->map)
> > >>>> return -ENOMEM;
> > >>>>
> > >>>> - ltq_mtd->map->phys = ltq_mtd->res->start;
> > >>>> + if (of_find_property(pdev->dev.of_node, 
> "no-unaligned-direct-access",
> > >>>> + NULL))
> > >>>> + ltq_mtd->map->phys = NO_XIP;
> > >>>
> > >>> This does not what you think it does; i.e. preventing unaligned io
> > >>> memory accesses. All it's used for is in two drivers
> > >>> (cfi_cmdset_0001.c, lpddr_cmds.c) as a check whether to populate
> > >>> _point/_unpoint. But it does not prevent the map_read/map_write
> > >>> accessors from doing memcpy_{from,to}_io() with unaligned addresses,
> > >>> which at least on MIPS results in unaligned accesses with LWL/LWR.
> > >>> Which is what I assume you want to prevent.
> > >>
> > >> Hi Jonas,
> > >>
> > >> I want to upstream the patch from OpenWrt:
> > >> https://dev.openwrt.org/changeset/35992
> > >>
> > >> I want to deactivate the execute-in-place (XIP) which this 
> property does.
> > >
> > > I understand that, but I wanted to point out that setting NO_XIP does
> > > neither prevent XIP*, nor does it prevent unaligned direct accesses.
> > > Which are also IMHO two different concepts.
> > >
> > > NO_XIP is checked at exactly one place, by mtd_is_linear()[1] (and
> > > only if CONFIG_MTD_COMPLEX_MAPPINGS is enabled). And mtd_is_linear()
> > > is only used by the two mentioned drivers, nothing more. Unless I'm
> > > overlooking something, this patch has no obvservebal effect, as the
> > > mtd code doesn't actually do anything meaningful with NO_XIP.
> > >
> >
> > this patch makes the chip use the fixup_use_point() code. adding matti
> > to the loop, this patch was originally written by him if i am not 
> mistaken
> >
> > John

Hi,

I did indeed write this patch. To give some background, this is needed 
only in one device that I know of, a Lantiq Danube -based router with an 
Intel command set flash. All other devices based on this SoC use AMD 
command set flash, and don't need this workaround, unless 
cfi_cmdset_0002.c some day starts populating _point/_unpoint. JFFS2 code 
uses _point and then accesses flash directly during scan, and this 
triggers a data bus error due to some additional alignment requirements 
in the EBU (bus which the flash is connected to).

To be honest I'm not at all familiar with the exact alignment 
requirements of Xway EBU, and I had a hunch that this probably isn't the 
correct way to fix things when I wrote this patch.

Best regards,
Matti Laakso
