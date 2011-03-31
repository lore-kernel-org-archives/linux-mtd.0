Message-ID: <4D9452C1.4020200@freescale.com>
Date: Thu, 31 Mar 2011 18:09:05 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 5/7] add GPMI support for imx28
References: <1300240521-4344-1-git-send-email-b32955@freescale.com>	
	<1300240521-4344-6-git-send-email-b32955@freescale.com>
	<1301564849.2828.26.camel@localhost>
In-Reply-To: <1301564849.2828.26.camel@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux@arm.linux.org.uk, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi:
> On Wed, 2011-03-16 at 09:55 +0800, Huang Shijie wrote:
>> +#define BF_BCH_CTRL_RSVD5(v)  \
>> +               (((v)<<  23)&  BM_BCH_CTRL_RSVD5)
> Many lines where you used "\" fit 80 lines. Just do not use tabs between
> name and value (which is ugly, imo), use a space and then it fits 80
> lines. This neater than splitting things on 2 lines.
>
Please check the latest version of the driver.
The code has been remove in new version.

Best Regards
Huang Shijie
