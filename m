Message-ID: <4DA806F0.6080706@freescale.com>
Date: Fri, 15 Apr 2011 16:50:56 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] ARM: mxs: add GPMI support for imx23/imx28
References: <1302854508-13652-1-git-send-email-b32955@freescale.com>
	<20110415080621.GL31990@pengutronix.de>
	<4DA7FE37.7030808@freescale.com>
	<20110415084230.GN31990@pengutronix.de>
In-Reply-To: <20110415084230.GN31990@pengutronix.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
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

hi,
> On Fri, Apr 15, 2011 at 04:13:43PM +0800, Huang Shijie wrote:
>>> On Fri, Apr 15, 2011 at 04:01:47PM +0800, Huang Shijie wrote:
>>>> +#define GPMI_NFC_DRIVER_NAME	"gpmi-nfc"
>>>> +#define GPMI_NFC_DRIVER_MX23	"imx23-gpmi-nfc"
>>>> +#define GPMI_NFC_DRIVER_MX28	"imx28-gpmi-nfc"
>>>> +#define GPMI_NFC_DRIVER_MX50	"imx50-gpmi-nfc"
>>> Is it sensible to keep these when they are only used in a single .c
>>> file?
>>>
>> I also use these in gpmi driver for distinguish platform id.
>> Do i have to remove these lines , and use the hardcode?
> Ah, I missed the usage in the header. *shrug*, I don't care much, but
> I'd use hardcoding.
>
ok. I will change it in the next version.

> BTW, as the driver name is gpmi-nfc this should be used for the various
> names introduced in this patch set. (i.e. mx28_add_gpmi_nfc,
> MXS_HAS_PLATFORM_GPMI_NFC etc.)
thanks.

Best Regards
Huang Shijie
> Best regards
> Uwe
>
