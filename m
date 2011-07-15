Sender: Grant Likely <glikely@secretlab.ca>
Date: Thu, 14 Jul 2011 20:54:05 -0600
From: Grant Likely <grant.likely@secretlab.ca>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH v2] mtd: dataflash: add device tree probe support
Message-ID: <20110715025405.GE2927@ponder.secretlab.ca>
References: <1310283313-32087-1-git-send-email-shawn.guo@linaro.org>
	<1310658757-17018-1-git-send-email-shawn.guo@linaro.org>
	<20110714175013.GA17845@belfalas.ww600.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20110714175013.GA17845@belfalas.ww600.siemens.net>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, patches@linaro.org,
	devicetree-discuss@lists.ozlabs.org,
	linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 14, 2011 at 09:52:02PM +0400, Dmitry Eremin-Solenikov wrote:
> On Thu, Jul 14, 2011 at 11:52:37PM +0800, Shawn Guo wrote:
> > It adds device tree probe support for mtd_dataflash driver.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > Cc: Grant Likely <grant.likely@secretlab.ca>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > ---
> > Changes since v1:
> >  * Add "atmel,at45xxx" into the match table
> >  * Add binding document
> 
> I´m sorry for being unclean on this. Device family is just at45,
> so I´d suggest the following compatibility list:
> "atmel,at45d789000", "atmel,at45"
> 
> You might want to add "atmel,dataflash" or "mtd,dataflash", but I see
> no point in that.

Dmitry is right.  at45xxx is not a good compatible value.

> 
> -- 
> With best wishes
> Dmitry
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
