Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2TYO-00052m-Oq
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 20:54:01 +0000
Message-ID: <502EAF11.3050207@openwrt.org>
Date: Fri, 17 Aug 2012 22:52:33 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/2] MTD: check for valid pdata inside plat_nand
References: <1342940398-2162-1-git-send-email-blogic@openwrt.org>
 <1345212215.27859.91.camel@sauron.fi.intel.com>
In-Reply-To: <1345212215.27859.91.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17/08/12 16:03, Artem Bityutskiy wrote:
> On Sun, 2012-07-22 at 08:59 +0200, John Crispin wrote:
>> If plat_nand loads and the platform_data is not properly set it will segfault.
>>
>> Signed-off-by: John Crispin <blogic@openwrt.org>
>> Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> Cc: linux-mtd@lists.infradead.org
>> ---
>> I am seeing this when plat_nand is referenced inside my DT file but
>> CONFIG_MTD_NAND_XWAY is not selected, resulting in platform_data not being
>> populated with valid data.
> Aiaiai complains like this for this patch-set:
>
> --------------------------------------------------------------------------------
>
> Successfully built configuration "mips-lantiq_defconfig,mips,mips-linux-", results:
>
> --- before_patching.log
> +++ after_patching.log
> @@ @@
> +drivers/mtd/nand/xway_nand.c:145:9: warning: cast removes address space of expression [sparse]
> +drivers/mtd/nand/xway_nand.c:163:25: warning: duplicate const  [sparse]
> +drivers/mtd/nand/xway_nand.c:184:12: warning: symbol 'xway_register_nand' was not declared. Should it be static? [sparse]
> +drivers/mtd/nand/xway_nand.c:184:12: warning: no previous prototype for 'xway_register_nand' [-Wmissing-prototypes]
>
> -------------------------------------------------------------------------------
Hi,

shame on me ... we are currently setting up a build bot to run *all*
mips patches through aiaiai so this wont happen in future  ...

i will fix the patch and resend it ...

John
