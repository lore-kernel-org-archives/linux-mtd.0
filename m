Message-ID: <4EE6A6DF.4@atmel.com>
Date: Tue, 13 Dec 2011 09:14:07 +0800
From: Hong Xu <hong.xu@atmel.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/2] MTD: atmel_nand: Update Kconfig to support PMECC
References: <1323327219-17895-1-git-send-email-hong.xu@atmel.com>
 <1323723514.2297.8.camel@koala>
In-Reply-To: <1323723514.2297.8.camel@koala>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
 linux-arm-kernel@lists.infradead.org
Reply-To: hong.xu@atmel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

On 12/13/2011 04:58 AM, Artem Bityutskiy wrote:
> On Thu, 2011-12-08 at 14:53 +0800, Hong Xu wrote:
>  > +config MTD_NAND_ATMEL_PMECC_HW
>  > + bool "Programmable Hardware ECC (BCH code)"
>  > + depends on ARCH_AT91SAM9X5 || ARCH_AT91SAM9N12
>  > + help
>  > + Use Programmable Hardware ECC (PMECC) controller.
>  > +
>  > + The PMECC Controller is a programmable binary BCH (Bose, Chaudhuri
>  > + and Hocquenghem) encoder/decoder. This controller can be used to
>  > + generate redundancy information for both SLC and MLC NAND Flash
>  > + devices.
>  > +
>  > + NB : hardware and software ECC schemes are incompatible.
>  > + If you switch from one to another, you'll have to erase your
>  > + mtd partition.
>
> Does it have to be a config option, can we avoid adding config options
> uless we really have to?

Agree. The original MTD_NAND_ATMEL_ECC_HW can be reused. In driver, if 
the SoC has PMECC, it'll be used.

Thanks.

BR,
Eric
