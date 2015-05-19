Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YucrT-0006PB-V3
 for linux-mtd@lists.infradead.org; Tue, 19 May 2015 08:26:53 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 2F581283C03
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2015 10:25:07 +0200 (CEST)
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
 [209.85.192.41])
 by arrakis.dune.hu (Postfix) with ESMTPSA id 4FAA9284830
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2015 10:25:00 +0200 (CEST)
Received: by qget53 with SMTP id t53so3438186qge.3
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2015 01:26:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150518224910.GU11598@ld-irv-0074>
References: <1431884112-28236-1-git-send-email-hauke@hauke-m.de>
 <20150518224910.GU11598@ld-irv-0074>
From: Jonas Gorski <jogo@openwrt.org>
Date: Tue, 19 May 2015 10:25:58 +0200
Message-ID: <CAOiHx=k9SuwEYZ10P8kmHF25P2O2r6+9gaBTSQ6kXFxfDnzL=w@mail.gmail.com>
Subject: Re: [PATCH] mtd: part: add generic parsing of linux,part-probe
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 rjui@broadcom.com, MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, May 19, 2015 at 12:49 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Sun, May 17, 2015 at 07:35:12PM +0200, Hauke Mehrtens wrote:
>> This moves the linux,part-probe device tree parsing code from
>> physmap_of.c to mtdpart.c. Now all drivers can use this feature by just
>> providing a reference to they device tree node in struct
>
> s/they/their/
> or
> s/they/the/
> ?
>
>> mtd_part_parser_data.
>>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> ---
>>  drivers/mtd/maps/physmap_of.c | 40 +---------------------------------------
(snip)
>>  drivers/mtd/mtdpart.c         | 38 ++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 39 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
>> index cafdb88..b3059d6 100644
>> --- a/drivers/mtd/mtdpart.c
>> +++ b/drivers/mtd/mtdpart.c
>> @@ -29,6 +29,7 @@
>>  #include <linux/kmod.h>
>>  #include <linux/mtd/mtd.h>
>>  #include <linux/mtd/partitions.h>
>> +#include <linux/of.h>
>>  #include <linux/err.h>
>>  #include <linux/kconfig.h>
>>
>> @@ -718,6 +719,35 @@ void deregister_mtd_parser(struct mtd_part_parser *p)
>>  }
>>  EXPORT_SYMBOL_GPL(deregister_mtd_parser);
>>
>> +static const char * const *of_get_probes(struct device_node *dp)
>
> Maybe a quick comment at the top to note that if non-NULL, its return
> value must be kfree()'d by the caller? Could be helpful if we want to
> move the code elsewhere. (I'm almost tempted to suggest moving this to
> drivers/of/of_mtd.c, in fact.)
>
>> +{
>> +     const char *cp;
>> +     int cplen;
>> +     unsigned int l;
>> +     unsigned int count;
>> +     const char **res;
>> +
>> +     cp = of_get_property(dp, "linux,part-probe", &cplen);
>
> I see this is not property is not documented in the first place. If
> we're going to make it generically useful, we definitely need to
> document it, including what the supported partition probe names are.
>
> I'm also kind of ambivalent on this point, but I might as well ask: does
> the 'linux,...' naming make sense? We're not really supposed to be
> putting pure software information in the device tree, let alone info
> that's specific to Linux. I see how the partition parser could be (and
> should be, really) considered OS-agnostic, though, and might deserve a
> spot in the DT, at least if it's not safe to run arbitrary partition
> parsers on all MTDs.

As long as we use the direct parser names, we should keep the linux prefix.

Actually a common issue is that many firmware partition tags aren't
capable of describing the full flash layout, so partition parsers have
to "cheat" and make a lot of assumptions, e.g. the location and the
size of the bootloader. So wo would need to have a mix of static
partitions (bootloader, bootloader config, calibration data) and
dynamic ones (kernel, rootfs, overlay). So ideally we would pass the
static partitions as device tree nodes, and let the partition parsers
then be applied to partitions instead of the full mtd device. This
would also work as a safeguard against mis-guessing important
partitions like calibration data which aren't recoverable in case they
get overwritten.

So my first Idea would be having something like this:

mtdevice@foo {
        ...
        bootloader: partition@0 {
                reg = <0 0x10000>;
                device_type = "flash-partition";
                read-only;
        };

        firmware: partition@10000 {
                reg = <0x1000 0x7e0000>;
                device_type = "flash-partition";
                compatible = "brcm,trx";
        };

        calibration: partition@7f0000 {
                reg = < >;
                device_type = "flash-partition";
                read-only;
        };
};

Then the ofpart parsing could be integrated into the core, and
partition parsers get run according to their compatibles on the
individual partitions.

Of course this also might be total overengineering and completely the
wrong place for devicetree as it's essentially configuration data, but
since the now described partitions are now more or less "static", IMHO
this would be a-okay.

>> @@ -754,6 +784,13 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>>  {
>>       struct mtd_part_parser *parser;
>>       int ret = 0;
>> +     const char *const *types_of = NULL;
>> +
>> +     if (data && data->of_node) {
>> +             types_of = of_get_probes(data->of_node);
>> +             if (types_of != NULL)
>> +                     types = types_of;
>> +     }
>
> I'm not sure I really like the semantics here. This means that the
> device tree can override all Linux defaults. So we can't, for instance,
> have the cmdline parser override all other selections (e.g., for
> debugging), or make sure that 'ofpart' is available for all MTDs.

Letting the device tree override cmdline parsers is actually a valid
use case for OpenWrt, where the bootloader passes a
different/incompatible partition layout through mtdparts than what is
actually used by the firmware on flash.

If we want to make it overrideable for debug purposes adding a
commandline parameter like
mtdparser="<mtdname>:<parser1[,parser2,...]>" might be a better
option.

>>
>>       if (!types)
>>               types = default_mtd_part_types;
>
> In fact, I don't really like this existing hunk either ^^^. It has the
> same effect, of killing things like cmdlinepart, which should be
> available on all MTDs.

default_mtd_part_types contains cmdline part, so it should be
available unless they pass their own parsers.


Regards
Jonas
