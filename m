Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TB6dg-0002vp-Oj
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2012 16:15:09 +0000
Received: by pbbrq8 with SMTP id rq8so2877971pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2012 09:15:07 -0700 (PDT)
Message-ID: <504E1203.6090509@gmail.com>
Date: Mon, 10 Sep 2012 21:44:59 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: fix the compile error which miss label
 "err_ecc_ioremap".
References: <1346824842-18875-1-git-send-email-josh.wu@atmel.com>
 <5047286C.4060705@atmel.com>
In-Reply-To: <5047286C.4060705@atmel.com>
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

Hello,

On 9/5/2012 3:54 PM, Josh Wu wrote:
> Hi, all
>
> This patch is for latest l2-mtd.git tree. It fixes the compile error
> after JC's commit: b654a9a4

Please mention the above in the commit's description than keeping it empty.

> On 9/5/2012 2:00 PM, Josh Wu wrote:
>> Signed-off-by: Josh Wu <josh.wu@atmel.com>
>> ---
>> drivers/mtd/nand/atmel_nand.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
<snip>

Regards,
Vikram
