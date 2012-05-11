Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSqUI-0007R8-II
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 14:06:31 +0000
Message-ID: <4FAD1C6D.5080701@openwrt.org>
Date: Fri, 11 May 2012 16:04:29 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 12/14] MTD: MIPS: lantiq: implement OF support
References: <1336133919-26525-1-git-send-email-blogic@openwrt.org>	
 <1336133919-26525-12-git-send-email-blogic@openwrt.org>
 <1336745193.2625.81.camel@sauron.fi.intel.com>
In-Reply-To: <1336745193.2625.81.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/05/12 16:06, Artem Bityutskiy wrote:
> On Fri, 2012-05-04 at 14:18 +0200, John Crispin wrote:
>> Adds bindings for OF and make use of module_platform_driver for lantiq
>> based socs.
>>
>> Signed-off-by: John Crispin <blogic@openwrt.org>
>> Cc: linux-mtd@lists.infradead.org
>> ---
>> This patch is part of a series moving the mips/lantiq target to OF and clkdev
>> support. The patch, once Acked, should go upstream via Ralf's MIPS tree.
> Looks ok, but could you please send me the entire series anyway, may be
> privately. I want to feed it to aiaiai and check before acking this
> patch. Also, please, make sure you add dependency on OF in Kconfig.

Hi Artem,

The lantiq platform selects USE_OF

config USE_OF
        bool "Flattened Device Tree support"
        select OF
        select OF_EARLY_FLATTREE
        select IRQ_DOMAIN
        help
          Include support for flattened device tree machine descriptions.

Do i still need an explicit dependency on OF in this case ?

Thanks,
John
