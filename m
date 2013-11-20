Received: from eu1sys200aog111.obsmtp.com ([207.126.144.131])
 by merlin.infradead.org with smtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vj4qb-0002Og-Fk
 for linux-mtd@lists.infradead.org; Wed, 20 Nov 2013 10:17:26 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1F3BE8
 for <linux-mtd@lists.infradead.org>; Wed, 20 Nov 2013 10:16:28 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F4884CDE
 for <linux-mtd@lists.infradead.org>; Wed, 20 Nov 2013 10:03:33 +0000 (GMT)
Message-ID: <528C8C1B.7090902@st.com>
Date: Wed, 20 Nov 2013 10:16:59 +0000
From: Angus Clark <angus.clark@st.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
References: <1384937569-23893-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1384937569-23893-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Angus CLARK <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang Shijie,

On 11/20/2013 08:52 AM, Huang Shijie wrote:
> This chip supports the quad read.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/devices/m25p80.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 7dc2c14..720899b 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -941,6 +941,7 @@ static const struct spi_device_id m25p_ids[] = {
>  	 */
>  	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
>  	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
> +	{ "s25fl128s",	INFO(0x012018, 0x4d01,  64 * 1024, 256, M25P80_QUAD_READ) },
>  	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
>  	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, M25P80_QUAD_READ) },
>  	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },

I would suggest using the name "s25fl128s1" to indicate the 64KiB sector variant
[1].  However, I would also point out that there is already an entry in the
table that matches the jedec_id/ext_id:

	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },

As far as I can tell, the m25p80.c driver is not sensitive to the differences
between the 'P' and the 'S' generations; both support M25P80_QUAD_READ, so the
flag could be added to the s25fl129p1 entry if required.

If it was deemed necessary to differentiate between the 'P' and 'S', then the
jedec_probe() code would need to be updated to consider the 6th READID byte
(0x80 for 'S').

Cheers,

Angus

[1] The name should really be "s25fl128s0" where the appended '0' represents the
"model number" 0 for uniform 64KiB sectors.  However, all the other Spansion
entries get this the wrong way round so perhaps it's best to stick with the
existing scheme.
