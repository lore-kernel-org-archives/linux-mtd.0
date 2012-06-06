Message-ID: <4FCF1C78.5000309@antcom.de>
Date: Wed, 06 Jun 2012 11:01:44 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v5] MTD: LPC32xx SLC NAND driver
References: <1338837901-24075-1-git-send-email-stigge@antcom.de>
 <1338972168.6875.7.camel@sauron.fi.intel.com>
In-Reply-To: <1338972168.6875.7.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: srinivas.bakki@nxp.com, lars@metafoo.de, linux@arm.linux.org.uk,
 linux-doc@vger.kernel.org, leiwen@marvell.com,
 devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, b32955@freescale.com, linux-mtd@lists.infradead.org,
 hechtb@googlemail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/06/2012 10:42 AM, Artem Bityutskiy wrote:
> On Mon, 2012-06-04 at 21:25 +0200, Roland Stigge wrote:
>> +config MTD_NAND_SLC_LPC32XX +	bool "NXP LPC32xx SLC Controller"
> 
> Why bool and not tristate here? Why you force this to be
> compiled-in and make it impossible to be a kernel module like other
> drivers are?

Right - the solution for both issues you mention (compiling as module
and linker error) is replacing above "bool" with "tristate".

Will post an updated patch.

Thanks,

Roland
