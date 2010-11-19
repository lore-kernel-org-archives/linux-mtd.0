Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PJORu-0002tz-AZ
	for linux-mtd@lists.infradead.org; Fri, 19 Nov 2010 10:44:12 +0000
Received: by qwb8 with SMTP id 8so31672qwb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Nov 2010 02:44:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20101118180137.GG9264@atomide.com>
References: <1290090130-20835-1-git-send-email-s-ghorai@ti.com>
	<20101118180137.GG9264@atomide.com>
Date: Fri, 19 Nov 2010 12:44:07 +0200
Message-ID: <AANLkTik8rX+wYWQ8VmRGb6cxZrUHQmoPm5mGOvk=Z80j@mail.gmail.com>
Subject: Re: [PATCH] omap: nand: remove hardware ECC as default
From: Grazvydas Ignotas <notasas@gmail.com>
To: Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Charles Manning <manningc2@actrix.gen.nz>, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org, Sukumar Ghorai <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 18, 2010 at 8:01 PM, Tony Lindgren <tony@atomide.com> wrote:
> * Sukumar Ghorai <s-ghorai@ti.com> [101118 06:12]:
>> CONFIG_MTD_NAND_OMAP_HWECC defined wronly in patch submitted during 2.6.=
36
>> that using the hardware ECC by default

wrongly

>>
>> Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>
>> ---
>> =A0drivers/mtd/nand/omap2.c | =A0 =A01 -
>> =A01 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>> index cd41c58..15682ec 100644
>> --- a/drivers/mtd/nand/omap2.c
>> +++ b/drivers/mtd/nand/omap2.c
>> @@ -7,7 +7,6 @@
>> =A0 * it under the terms of the GNU General Public License version 2 as
>> =A0 * published by the Free Software Foundation.
>> =A0 */
>> -#define CONFIG_MTD_NAND_OMAP_HWECC
>>
>> =A0#include <linux/platform_device.h>
>> =A0#include <linux/dma-mapping.h>
>
> This looks like a fix for the -rc cycle. Can you please update
> the description a bit to specify which commit broke it and
> what the error is now?

Well it broke NAND for beagle and pandora at least, as those have been
using sw ecc, all IO simply results in ECC errors with that define.
