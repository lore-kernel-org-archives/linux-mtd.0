Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PKXAq-0004P9-2i
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2010 14:15:21 +0000
Message-ID: <4CEA7AF0.6000804@bvs-tech.com>
Date: Mon, 22 Nov 2010 15:15:12 +0100
From: Alexis RODET <alexis.rodet@bvs-tech.com>
MIME-Version: 1.0
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] Renaming 'struct flash_platform_data' into 'struct
	spi_flash_platform_data' in include/linux/spi/flash.h
References: <20101117160514.GA5308@n2100.arm.linux.org.uk>	
	<4CE6B27D.2000909@bvs-tech.com> <20101121044720.GA6088@tarshish>	
	<4CEA3EAE.4080700@bvs-tech.com> <1290434369.2529.38.camel@helium>
In-Reply-To: <1290434369.2529.38.camel@helium>
Content-Type: multipart/mixed; boundary="------------030904090908030809030508"
Cc: spi-devel-general@lists.sourceforge.net, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------030904090908030809030508
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi David,

Le 22/11/2010 14:59, David Brownell a écrit :
> On Mon, 2010-11-22 at 10:58 +0100, Alexis RODET wrote:
>> Hello,
>>
>>  there is a problem with the double
>> definition of 'struct flash_platform_data' that are incompatible:
>>
>> in arch/arm/include/asm/mach/flash.h:
>> in include/linux/spi/flash.h:
>> Both headers are included in a number of machines or driver.
> And this patch doesn't touch machine or driver code, so it's incomplete.
Look at the patch in previous mail attachment and you'll see it does.

39 files changed, 41 insertions(+), 41 deletions(-)

Sorry I didn't put it in message core because I already posted it on
linux-mtd@lists.infradead.org.
I don't know the good usage.

> ISTR the last time this issue was raised, a similar incomplete patch was
> proposed.
>
> How about a patch that does the full rename??
What do you mean ?
Renaming 'struct flash_platform_data' from
arch/arm/include/asm/mach/flash.h also ?
Or moving arch/arm/include/asm/mach/flash.h in common includes ?

Alexis

--------------030904090908030809030508
Content-Type: text/x-vcard; charset=utf-8;
 name="alexis_rodet.vcf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="alexis_rodet.vcf"

YmVnaW46dmNhcmQNCmZuOkFsZXhpcyBST0RFVA0KbjpST0RFVDtBbGV4aXMNCm9yZzpCcmFp
biBWaXNpb24gU3lzdGVtcw0KYWRyOjs7MzIgcnVlIGR1IEphdmVsb3Q7UEFSSVM7Ozc1MDEz
O0ZSQU5DRQ0KZW1haWw7aW50ZXJuZXQ6YWxleGlzLnJvZGV0QGJ2cy10ZWNoLmNvbQ0KdGl0
bGU6SGFyZHdhcmUgRW5naW5lZXINCnRlbDt3b3JrOiszMyA5IDUzIDkyIDE0IDQxDQp0ZWw7
ZmF4OiszMyA5IDU4IDkyIDE0IDQxDQp4LW1vemlsbGEtaHRtbDpGQUxTRQ0KdXJsOmh0dHA6
Ly93d3cuYnZzLXRlY2guY29tDQp2ZXJzaW9uOjIuMQ0KZW5kOnZjYXJkDQoNCg==
--------------030904090908030809030508--
