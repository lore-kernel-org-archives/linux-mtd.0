Message-ID: <4FEB25E8.5060706@antcom.de>
Date: Wed, 27 Jun 2012 17:25:28 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Subject: Re: [PATCH v7] MTD: LPC32xx SLC NAND driver
References: <1339064536-20553-1-git-send-email-stigge@antcom.de>
 <1340794007.29342.50.camel@sauron.fi.intel.com> <4FEAF90B.5030809@antcom.de>
 <CAAAP30HemOV9svhVghLTWfZe95=P3CT-H7UsQ=xY6rC8=AfBsA@mail.gmail.com>
In-Reply-To: <CAAAP30HemOV9svhVghLTWfZe95=P3CT-H7UsQ=xY6rC8=AfBsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: srinivas.bakki@nxp.com, lars@metafoo.de, linux@arm.linux.org.uk,
 linux-doc@vger.kernel.org, leiwen@marvell.com,
 devicetree-discuss@lists.ozlabs.org, dedekind1@gmail.com,
 linux-kernel@vger.kernel.org, kevin.wells@nxp.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, hechtb@googlemail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On 06/27/2012 02:26 PM, Alexandre Pereira da Silva wrote:
> I think it's best in case of *_raw to use nand base default functions,
> like in the MLC patch.

Problem here (specific for this SLC controller) is that it expects us to
access the data register via 16bit access while the actual data is only
8bit wide.

This can't be done with the default nand functions, neither with the
8bit nor 16bit variant.

Roland

PS: Nevertheless, I will post our SLC driver update series against the
l2-mtd branch.
