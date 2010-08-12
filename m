Subject: Re: [PATCH v2 2/6]nand/denali: Add bad block management for MRST
From: David Woodhouse <dwmw2@infradead.org>
To: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
In-Reply-To: <20100812105117.GB11634@intel.com>
References: <20100812105117.GB11634@intel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Aug 2010 12:14:28 +0100
Message-ID: <1281611668.12475.67.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Jason Roberts <jason.e.roberts@intel.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-08-12 at 18:51 +0800, Chuanxiao.Dong wrote:
> 
> +choice
> +       prompt "Compile for"
> +       depends on MTD_NAND_DENALI
> +       default MRST_NAND_CONTROLLER
> +
> +config MRST_NAND_CONTROLLER
> +       bool "MRST NAND controller"
> +       help
> +
> +config CE4100_NAND_CONTROLLER
> +       bool "CE4100 NAND controller"
> +       help
> +
> +endchoice 


Hm, I don't like this much -- we ought to be able to compile a generic
kernel which will support *both* MRST and CE4100. 

(Actually, we *can* -- you don't use these options anywhere (yet?)
except as a gateway to letting us set the BBT_BLOCKNUM value.

It may also be worth switching CE4100 to use the same BBT scheme as
you're using in MRST -- don't all the same arguments apply there?

I'm guessing that you didn't change CE4100 just because you want to
retain on-medium compatibility? Let's ask Jason -- I suspect it would be
OK to change...

I'm also somewhat dubious about the way we abandon the BBT when we're
going to use Spectra -- and especially the use of the scratch register.
Can't we put that information into PCI config space if we really must
have it? I'll look over that in more detail...


-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
