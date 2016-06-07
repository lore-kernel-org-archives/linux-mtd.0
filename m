Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bA9N4-0004Cp-A2
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 05:16:11 +0000
Subject: Re: [PATCH v2] MTD: lantiq: handle NO_XIP on cfi0001 flash
To: Jonas Gorski <jogo@openwrt.org>, Hauke Mehrtens <hauke@hauke-m.de>
References: <1465245341-16026-1-git-send-email-hauke@hauke-m.de>
 <CAOiHx=kit1Fz2hTmyxStzCfGDDpc4vcx06E2JVmwve8tTWo7Gg@mail.gmail.com>
 <910195ee-2b46-bb69-472c-15c6321e9e5d@hauke-m.de>
 <CAOiHx=mbRCU_Wh+vaT+RZcjJWTvBautp9eAJT_Gv7JyfVfQ8Yw@mail.gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Matti Laakso <malaakso@elisanet.fi>
From: John Crispin <john@phrozen.org>
Message-ID: <008252fa-88a8-1187-e898-cd233180d9ab@phrozen.org>
Date: Tue, 7 Jun 2016 07:15:42 +0200
MIME-Version: 1.0
In-Reply-To: <CAOiHx=mbRCU_Wh+vaT+RZcjJWTvBautp9eAJT_Gv7JyfVfQ8Yw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 06/06/2016 23:54, Jonas Gorski wrote:
> On 6 June 2016 at 23:38, Hauke Mehrtens <hauke@hauke-m.de> wrote:
>> On 06/06/2016 11:10 PM, Jonas Gorski wrote:
>>> Hi,
>>>
>>> On 6 June 2016 at 22:35, Hauke Mehrtens <hauke@hauke-m.de> wrote:
>>>> From: John Crispin <john@phrozen.org>
>>>>
>>>> This uses the same device tree attribute as physmap_of.c
>>>>
>>>> Signed-off-by: John Crispin <john@phrozen.org>
>>>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>>>> ---
>>>>  drivers/mtd/maps/lantiq-flash.c | 6 +++++-
>>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
>>>> index c8febb3..88fc6d9 100644
>>>> --- a/drivers/mtd/maps/lantiq-flash.c
>>>> +++ b/drivers/mtd/maps/lantiq-flash.c
>>>> @@ -137,7 +137,11 @@ ltq_mtd_probe(struct platform_device *pdev)
>>>>         if (!ltq_mtd->map)
>>>>                 return -ENOMEM;
>>>>
>>>> -       ltq_mtd->map->phys = ltq_mtd->res->start;
>>>> +       if (of_find_property(pdev->dev.of_node, "no-unaligned-direct-access",
>>>> +                            NULL))
>>>> +               ltq_mtd->map->phys = NO_XIP;
>>>
>>> This does not what you think it does; i.e. preventing unaligned io
>>> memory accesses. All it's used for is in two drivers
>>> (cfi_cmdset_0001.c, lpddr_cmds.c) as a check whether to populate
>>> _point/_unpoint. But it does not prevent the map_read/map_write
>>> accessors from doing memcpy_{from,to}_io() with unaligned addresses,
>>> which at least on MIPS results in unaligned accesses with LWL/LWR.
>>> Which is what I assume you want to prevent.
>>
>> Hi Jonas,
>>
>> I want to upstream the patch from OpenWrt:
>> https://dev.openwrt.org/changeset/35992
>>
>> I want to deactivate the execute-in-place (XIP) which this property does.
> 
> I understand that, but I wanted to point out that setting NO_XIP does
> neither prevent XIP*, nor does it prevent unaligned direct accesses.
> Which are also IMHO two different concepts.
> 
> NO_XIP is checked at exactly one place, by mtd_is_linear()[1] (and
> only if CONFIG_MTD_COMPLEX_MAPPINGS is enabled). And mtd_is_linear()
> is only used by the two mentioned drivers, nothing more. Unless I'm
> overlooking something, this patch has no obvservebal effect, as the
> mtd code doesn't actually do anything meaningful with NO_XIP.
> 

this patch makes the chip use the fixup_use_point() code. adding matti
to the loop, this patch was originally written by him if i am not mistaken

	John
