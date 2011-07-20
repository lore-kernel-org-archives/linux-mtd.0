Subject: Re: [PATCH v2] mtd: dataflash: add device tree probe support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shawn Guo <shawn.guo@freescale.com>
Date: Wed, 20 Jul 2011 08:52:36 +0300
In-Reply-To: <20110720055228.GC5766@S2100-06.ap.freescale.net>
References: <1310283313-32087-1-git-send-email-shawn.guo@linaro.org>
	<1310658757-17018-1-git-send-email-shawn.guo@linaro.org>
	<20110715025407.GF2927@ponder.secretlab.ca>
	<20110715044919.GB1840@S2100-06.ap.freescale.net>
	<1311136844.20738.131.camel@sauron>
	<20110720045547.GA5766@S2100-06.ap.freescale.net>
	<1311139071.20738.147.camel@sauron>
	<20110720052824.GB5766@S2100-06.ap.freescale.net>
	<1311139971.20738.154.camel@sauron>
	<20110720055228.GC5766@S2100-06.ap.freescale.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311141162.20738.159.camel@sauron>
Mime-Version: 1.0
Cc: patches@linaro.org, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	devicetree-discuss@lists.ozlabs.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-07-20 at 13:52 +0800, Shawn Guo wrote:
> The argument about this #ifdef thing was the driver could be used by
> some platforms that will never migrate to device tree.  This table
> will be just a waste of bytes for those platforms, if we do not
> protect the table by '#ifdef CONFIG_OF'.

OK, anyway, I picked your v2 already and less bytes wastage is a good
enough argument.

-- 
Best Regards,
Artem Bityutskiy
