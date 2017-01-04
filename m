From: Hartley Sweeten <HartleyS@visionengravers.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>
CC: "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "matt@codeblueprint.co.uk"
 <matt@codeblueprint.co.uk>, "will.deacon@arm.com" <will.deacon@arm.com>,
 "stefan@agner.ch" <stefan@agner.ch>, "chris.brandt@renesas.com"
 <chris.brandt@renesas.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "cyrille.pitchen@atmel.com"
 <cyrille.pitchen@atmel.com>, "panand@redhat.com" <panand@redhat.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>, "richard@nod.at" <richard@nod.at>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "ben@decadent.org.uk"
 <ben@decadent.org.uk>, "vladimir.murzin@arm.com" <vladimir.murzin@arm.com>,
 "keescook@chromium.org" <keescook@chromium.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "labbott@fedoraproject.org" <labbott@fedoraproject.org>,
 "jonathan.austin@arm.com" <jonathan.austin@arm.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "js07.lee@samsung.com" <js07.lee@samsung.com>
Subject: RE: [PATCH v5 2/4] ARM: Define KERNEL_START and KERNEL_END
Date: Wed, 4 Jan 2017 15:58:12 +0000
Message-ID: <SN1PR0101MB15656D0B421E37BC4813F560D0610@SN1PR0101MB1565.prod.exchangelabs.com>
References: <edc8eaa2-5414-506c-1dad-f2404ef19c81@gmail.com>
 <20170104011417.1496-1-f.fainelli@gmail.com>
 <20170104011417.1496-3-f.fainelli@gmail.com>
In-Reply-To: <20170104011417.1496-3-f.fainelli@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, January 03, 2017 6:14 PM, Florian Fainelli wrote:
>
> In preparation for adding CONFIG_DEBUG_VIRTUAL support, define a set of
> common constants: KERNEL_START and KERNEL_END which abstract
> CONFIG_XIP_KERNEL vs. !CONFIG_XIP_KERNEL. Update the code where
> relevant.
>
> Acked-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/arm/include/asm/memory.h | 7 +++++++
>  arch/arm/mm/init.c            | 7 ++-----
>  arch/arm/mm/mmu.c             | 6 +-----
>  3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.=
h
> index 76cbd9c674df..bee7511c5098 100644
> --- a/arch/arm/include/asm/memory.h
> +++ b/arch/arm/include/asm/memory.h
> @@ -111,6 +111,13 @@
> =20
>  #endif /* !CONFIG_MMU */
> =20
> +#ifdef CONFIG_XIP_KERNEL
> +#define KERNEL_START		_sdata
> +#else
> +#define KERNEL_START		_stext
> +#endif
> +#define KERNEL_END		_end
> +
>  /*
>   * We fix the TCM memories max 32 KiB ITCM resp DTCM at these
>   * locations
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 370581aeb871..c87d0d5b65f2 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -230,11 +230,8 @@ phys_addr_t __init arm_memblock_steal(phys_addr_t si=
ze, phys_addr_t align)
>  void __init arm_memblock_init(const struct machine_desc *mdesc)
>  {
>  	/* Register the kernel text, kernel data and initrd with memblock. */
> -#ifdef CONFIG_XIP_KERNEL
> -	memblock_reserve(__pa(_sdata), _end - _sdata);
> -#else
> -	memblock_reserve(__pa(_stext), _end - _stext);
> -#endif
> +	memblock_reserve(__pa(KERNEL_START), _end - KERNEL_START);

Shouldn't the '_end' above be 'KERNEL_END'?

Hartley
