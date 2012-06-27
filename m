Message-ID: <4FEB2619.8020000@antcom.de>
Date: Wed, 27 Jun 2012 17:26:17 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v7] MTD: LPC32xx SLC NAND driver
References: <1339064536-20553-1-git-send-email-stigge@antcom.de>
 <1340794007.29342.50.camel@sauron.fi.intel.com> <4FEAF90B.5030809@antcom.de>
 <1340800392.1799.17.camel@sauron.fi.intel.com>
In-Reply-To: <1340800392.1799.17.camel@sauron.fi.intel.com>
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

On 06/27/2012 02:33 PM, Artem Bityutskiy wrote:
> On Wed, 2012-06-27 at 14:14 +0200, Roland Stigge wrote:
>> Thanks for the note! I'm sending an incremental patch. There was 
>> actually only one place in the two functions that could fail
>> (return code of lpc32xx_xfer()).
> 
> Could you please check the MCL patch as well and re-send it against
> the l2 tree?
> 
> I've squashed your change into the driver and pushed out, thanks!

Yes, thanks!

Will post an updated MLC against l2-mtd later today.

Roland
