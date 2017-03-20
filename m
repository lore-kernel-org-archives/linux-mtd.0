Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cppJd-000098-BW
 for linux-mtd@lists.infradead.org; Mon, 20 Mar 2017 04:53:10 +0000
Received: by mail-lf0-x241.google.com with SMTP id y193so9134218lfd.1
 for <linux-mtd@lists.infradead.org>; Sun, 19 Mar 2017 21:52:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170317141121.49a5115d@bbrezillon>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-3-git-send-email-peterpandong@micron.com>
 <20170317141121.49a5115d@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Mon, 20 Mar 2017 12:52:47 +0800
Message-ID: <CAAyFORLLzxnTZ0OCsvdKS+hG6=bquO965NFcC0b58aTzj=JteA@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] mtd: nand: add oob iterator in nand_for_each_page
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Arnaud Mouiche <arnaud.mouiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Fri, Mar 17, 2017 at 9:11 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Thu, 16 Mar 2017 14:47:31 +0800
> Peter Pan <peterpandong@micron.com> wrote:
>
>> Iterate nand pages by both page and oob operation.
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  include/linux/mtd/nand.h | 28 +++++++++++++++++++++++++---
>>  1 file changed, 25 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index 4a812e6..822547e 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -87,6 +87,9 @@ struct nand_page_iter {
>>       loff_t offs;
>>       int page;
>>       int pageoffs;
>> +     int ooboffs;
>> +     int oobsize;
>> +     size_t oobleft;
>
> Maybe we should also add dataleft so that you don't have to pass start
> and len when you call nand_page_iter_end().

Yes, it's better. Fix this in v4

Thanks,
Peter Pan
