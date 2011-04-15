Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAebt-0005H3-0e
	for linux-mtd@lists.infradead.org; Fri, 15 Apr 2011 08:42:37 +0000
Date: Fri, 15 Apr 2011 10:42:30 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 1/2] ARM: mxs: add GPMI support for imx23/imx28
Message-ID: <20110415084230.GN31990@pengutronix.de>
References: <1302854508-13652-1-git-send-email-b32955@freescale.com>
	<20110415080621.GL31990@pengutronix.de>
	<4DA7FE37.7030808@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4DA7FE37.7030808@freescale.com>
Cc: s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 15, 2011 at 04:13:43PM +0800, Huang Shijie wrote:
> >On Fri, Apr 15, 2011 at 04:01:47PM +0800, Huang Shijie wrote:
> >>+#define GPMI_NFC_DRIVER_NAME	"gpmi-nfc"
> >>+#define GPMI_NFC_DRIVER_MX23	"imx23-gpmi-nfc"
> >>+#define GPMI_NFC_DRIVER_MX28	"imx28-gpmi-nfc"
> >>+#define GPMI_NFC_DRIVER_MX50	"imx50-gpmi-nfc"
> >Is it sensible to keep these when they are only used in a single .c
> >file?
> >
> I also use these in gpmi driver for distinguish platform id.
> Do i have to remove these lines , and use the hardcode?
Ah, I missed the usage in the header. *shrug*, I don't care much, but
I'd use hardcoding.

BTW, as the driver name is gpmi-nfc this should be used for the various
names introduced in this patch set. (i.e. mx28_add_gpmi_nfc,
MXS_HAS_PLATFORM_GPMI_NFC etc.)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
