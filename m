Received: from nasmtp01.atmel.com ([192.199.1.245]
 helo=DVREDG01.corp.atmel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJH7r-00052L-HX
 for linux-mtd@lists.infradead.org; Mon, 18 Aug 2014 07:13:07 +0000
Message-ID: <53F1A6C6.5010002@atmel.com>
Date: Mon, 18 Aug 2014 15:09:58 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH][resend] mtd: atmel_nand: make PMECC lookup table and
 offset property optional
References: <1407490110-16735-1-git-send-email-josh.wu@atmel.com>
 <20140814224625.GF18411@ld-irv-0074>
In-Reply-To: <20140814224625.GF18411@ld-irv-0074>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, galak@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Brian

On 8/15/2014 6:46 AM, Brian Norris wrote:
> On Fri, Aug 08, 2014 at 05:28:30PM +0800, Josh Wu wrote:
>> If there is no PMECC lookup table stored in ROM, or lookup table offset is
>> not specified, PMECC driver should build it in DDR by itself.
>>
>> That make the PMECC driver work for some board which doesn't has PMECC
>> lookup table in ROM.
>>
>> Signed-off-by: Josh Wu <josh.wu@atmel.com>
>> Cc: devicetree@vger.kernel.org
> drivers/mtd/nand/atmel_nand.c:1204:11: warning: no previous prototype for 'create_lookup_table' [-Wmissing-prototypes]
>
> You probably should make create_lookup_table() static.

Thank you to catch that.
I'll send a v2 version for make the function static.

>
> Brian
Best Regards,
Josh Wu
