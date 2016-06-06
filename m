Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bA2F9-0006Np-SX
 for linux-mtd@lists.infradead.org; Mon, 06 Jun 2016 21:39:32 +0000
Subject: Re: [PATCH v2] MTD: lantiq: handle NO_XIP on cfi0001 flash
To: Jonas Gorski <jogo@openwrt.org>
References: <1465245341-16026-1-git-send-email-hauke@hauke-m.de>
 <CAOiHx=kit1Fz2hTmyxStzCfGDDpc4vcx06E2JVmwve8tTWo7Gg@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 John Crispin <john@phrozen.org>
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <910195ee-2b46-bb69-472c-15c6321e9e5d@hauke-m.de>
Date: Mon, 6 Jun 2016 23:38:38 +0200
MIME-Version: 1.0
In-Reply-To: <CAOiHx=kit1Fz2hTmyxStzCfGDDpc4vcx06E2JVmwve8tTWo7Gg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/06/2016 11:10 PM, Jonas Gorski wrote:
> Hi,
> 
> On 6 June 2016 at 22:35, Hauke Mehrtens <hauke@hauke-m.de> wrote:
>> From: John Crispin <john@phrozen.org>
>>
>> This uses the same device tree attribute as physmap_of.c
>>
>> Signed-off-by: John Crispin <john@phrozen.org>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> ---
>>  drivers/mtd/maps/lantiq-flash.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
>> index c8febb3..88fc6d9 100644
>> --- a/drivers/mtd/maps/lantiq-flash.c
>> +++ b/drivers/mtd/maps/lantiq-flash.c
>> @@ -137,7 +137,11 @@ ltq_mtd_probe(struct platform_device *pdev)
>>         if (!ltq_mtd->map)
>>                 return -ENOMEM;
>>
>> -       ltq_mtd->map->phys = ltq_mtd->res->start;
>> +       if (of_find_property(pdev->dev.of_node, "no-unaligned-direct-access",
>> +                            NULL))
>> +               ltq_mtd->map->phys = NO_XIP;
> 
> This does not what you think it does; i.e. preventing unaligned io
> memory accesses. All it's used for is in two drivers
> (cfi_cmdset_0001.c, lpddr_cmds.c) as a check whether to populate
> _point/_unpoint. But it does not prevent the map_read/map_write
> accessors from doing memcpy_{from,to}_io() with unaligned addresses,
> which at least on MIPS results in unaligned accesses with LWL/LWR.
> Which is what I assume you want to prevent.

Hi Jonas,

I want to upstream the patch from OpenWrt:
https://dev.openwrt.org/changeset/35992

I want to deactivate the execute-in-place (XIP) which this property does.

Hauke
