Date: Tue, 25 Nov 2014 17:23:01 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Message-ID: <1919968390.242626.1416957781902.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <547505E7.7000502@vanguardiasur.com.ar>
References: <1854666513.5578.1415473916534.JavaMail.zimbra@xes-inc.com>
 <5474E1DB.1090207@vanguardiasur.com.ar>
 <412246484.206926.1416953948359.JavaMail.zimbra@xes-inc.com>
 <547505E7.7000502@vanguardiasur.com.ar>
Subject: Re: [PATCH v2] mtd: fsl_upm: Support NAND ECC DTS properties
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Jordan Friendshuh <jfriendshuh@xes-inc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Original Message -----
> From: "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>
> Sent: Tuesday, November 25, 2014 4:42:47 PM
> 
> On 11/25/2014 07:19 PM, Aaron Sierra wrote:
> >> From: "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>
> >> Sent: Tuesday, November 25, 2014 2:08:59 PM
> >>
> >> On 11/08/2014 04:11 PM, Aaron Sierra wrote:
> >> [..]
> >>> +
> >>> +	/* We know mode is either NAND_ECC_SOFT or NAND_ECC_SOFT_BCH */
> >>> +	if (strength < 0 && mode == NAND_ECC_SOFT_BCH) {
> >>> +		dev_err(fun->dev,
> >>> +			"ECC BCH mode requires nand-ecc-strength property");
> >>> +		ret = -EINVAL;
> >>> +		goto err;
> >>> +	} else if (strength == 0) {
> >>> +		dev_err(fun->dev, "ECC strength of 0 bits is unsupported");
> >>> +		ret = -EINVAL;
> >>> +		goto err;
> >>> +	} else if (strength == 1 && mode == NAND_ECC_SOFT_BCH) {
> >>> +		dev_err(fun->dev, "ECC BCH mode requires > 1-bit strength");
> >>> +		ret = -EINVAL;
> >>> +		goto err;
> >>> +	} else if (strength > 1 && mode == NAND_ECC_SOFT) {
> >>> +		dev_warn(fun->dev,
> >>> +			"Forcing ECC BCH due to %d-bit strength\n", strength);
> >>> +		mode = NAND_ECC_SOFT_BCH;
> >>> +	}
> >>> +	fun->chip.ecc.mode = mode;
> >>> +	fun->chip.ecc.strength = strength;
> >>> +
> >>
> 

[ snip ]

> I'd say you should require an ECC step size in your binding, instead of
> assuming the 512-byte that gets set if the ecc.size is 0.

Yes, I agree that the fsl_upm driver should require that nand-ecc-step-size
and nand-ecc-strength both be defined with "soft_bch".

> BTW, how does this patch deal with old devicetree files?

The fsl_upm driver previously only supported 1-bit "soft" ECC, so _this_
patch expects that existing device trees don't define nand-ecc-strength
or nand-ecc-mode. In that case "soft" ECC will be detected and used.

However, if for some reason an existing device tree defines
nand-ecc-strength, then the snippet that you provided above shows that
the ECC mode would be overridden (forcing "soft_bch" for ECC strength
values greater than 1).

-Aaron
