Subject: Re: [PATCH 1/2] MTD: atmel_nand: Update Kconfig to support PMECC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hong Xu <hong.xu@atmel.com>
Date: Mon, 12 Dec 2011 22:58:19 +0200
In-Reply-To: <1323327219-17895-1-git-send-email-hong.xu@atmel.com>
References: <1323327219-17895-1-git-send-email-hong.xu@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323723514.2297.8.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-12-08 at 14:53 +0800, Hong Xu wrote:
> +config MTD_NAND_ATMEL_PMECC_HW
> +	bool "Programmable Hardware ECC (BCH code)"
> +	depends on ARCH_AT91SAM9X5 || ARCH_AT91SAM9N12
> +	help
> +	  Use Programmable Hardware ECC (PMECC) controller.
> +
> +	  The PMECC Controller is a programmable binary BCH (Bose, Chaudhuri
> +	  and Hocquenghem) encoder/decoder. This controller can be used to
> +	  generate redundancy information for both SLC and MLC NAND Flash
> +	  devices.
> +
> +	  NB : hardware and software ECC schemes are incompatible.
> +	  If you switch from one to another, you'll have to erase your
> +	  mtd partition.

Does it have to be a config option, can we avoid adding config options
uless we really have to?
