Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TBKYy-0007eC-Hd
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 07:07:15 +0000
Message-ID: <504EE312.5020705@atmel.com>
Date: Tue, 11 Sep 2012 15:06:58 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: [PATCH] mtd: atmel_nand: fix the compile error which miss label
 "err_ecc_ioremap".
References: <1346824842-18875-1-git-send-email-josh.wu@atmel.com>
 <5047286C.4060705@atmel.com> <504E1203.6090509@gmail.com>
In-Reply-To: <504E1203.6090509@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Vikram

On 9/11/2012 12:14 AM, Vikram Narayanan wrote:
> Hello,
>
> On 9/5/2012 3:54 PM, Josh Wu wrote:
>> Hi, all
>>
>> This patch is for latest l2-mtd.git tree. It fixes the compile error
>> after JC's commit: b654a9a4
>
> Please mention the above in the commit's description than keeping it 
> empty.

The commit is: b654a9a46fc2100b318050483f8c5b5d0f187303 (mtd: atmel 
nand: fix gpio missing request)
I will send the v2 patch which adds such information my commit message.

>
>> On 9/5/2012 2:00 PM, Josh Wu wrote:
>>> Signed-off-by: Josh Wu <josh.wu@atmel.com>
>>> ---
>>> drivers/mtd/nand/atmel_nand.c | 3 ++-
>>> 1 file changed, 2 insertions(+), 1 deletion(-)
> <snip>
>
> Regards,
> Vikram
>

Best Regards,
Josh Wu
