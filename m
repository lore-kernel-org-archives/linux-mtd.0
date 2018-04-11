Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6HbX-0002Kj-Do
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2018 15:24:12 +0000
Received: by mail-wr0-x242.google.com with SMTP id u46so2181329wrc.11
 for <linux-mtd@lists.infradead.org>; Wed, 11 Apr 2018 08:24:00 -0700 (PDT)
Subject: Re: [PATCHv2] mtd: spi-nor: Fix Cadence QSPI page fault kernel panic
To: thor.thayer@linux.intel.com, cyrille.pitchen@wedev4u.fr,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1522073537-27386-1-git-send-email-thor.thayer@linux.intel.com>
 <0b460613-4ac2-c4d8-429e-248a4742a408@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c009725f-dbbc-d4b1-4f67-6cae7cdf6f05@gmail.com>
Date: Wed, 11 Apr 2018 17:23:57 +0200
MIME-Version: 1.0
In-Reply-To: <0b460613-4ac2-c4d8-429e-248a4742a408@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/11/2018 05:17 PM, Thor Thayer wrote:
> Hi. Any comments on this patch?

None other than

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

sorry for the delay.

btw stop top-posting please.

> On 03/26/2018 09:12 AM, thor.thayer@linux.intel.com wrote:
>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>
>> The current Cadence QSPI driver caused a kernel panic when loading
>> a Root Filesystem from QSPI. The problem was caused by reading more
>> bytes than needed because the QSPI operated on 4 bytes at a time.
>> <snip>
>> [    7.947754] spi_nor_read[1048]:from 0x037cad74, len 1 [bfe07fff]
>> [    7.956247] cqspi_read[910]:offset 0x58502516, buffer=bfe07fff
>> [    7.956247]
>> [    7.966046] Unable to handle kernel paging request at virtual
>> address bfe08002
>> [    7.973239] pgd = eebfc000
>> [    7.975931] [bfe08002] *pgd=2fffb811, *pte=00000000, *ppte=00000000
>> </snip>
>> Notice above how only 1 byte needed to be read but by reading 4 bytes
>> into the end of a mapped page, an unrecoverable page fault occurred.
>>
>> This patch uses a temporary buffer to hold the 4 bytes read and then
>> copies only the bytes required into the buffer. A min() function is
>> used to limit the length to prevent buffer overflows.
>>
>> Request testing of this patch on other platforms. This was tested
>> on the Intel Arria10 SoCFPGA DevKit.
>>
>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>

[...]


-- 
Best regards,
Marek Vasut
