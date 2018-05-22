Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL85B-00024d-NC
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 14:16:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 22 May 2018 19:45:57 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2 10/14] mtd: rawnand: qcom: fix return value for raw
 page read
In-Reply-To: <20180522140416.252fb398@xps13>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
 <1525350041-22995-11-git-send-email-absahu@codeaurora.org>
 <20180522140416.252fb398@xps13>
Message-ID: <75ef7936bd1da87f54cac867103a83d6@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-05-22 17:34, Miquel Raynal wrote:
> Hi Abhishek,
> 
> On Thu,  3 May 2018 17:50:37 +0530, Abhishek Sahu
> <absahu@codeaurora.org> wrote:
> 
>> Currently zero is being returned for all raw page read so
>> fix the same.
> 
> What about "Fix value returned by ->read_page_raw() to be the
> actual operation status, instead of always 0."?
> 

  Sure Miquel. It looks better.
  I will change this.

  Thanks,
  Abhishek

>> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>> * Changes from v1:
>> 
>>  NEW CHANGE
>> 
>>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c 
>> b/drivers/mtd/nand/raw/qcom_nandc.c
>> index f85d8ab..17b7f3af 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -1900,7 +1900,7 @@ static int qcom_nandc_read_page_raw(struct 
>> mtd_info *mtd,
>> 
>>  	free_descs(nandc);
>> 
>> -	return 0;
>> +	return ret;
>>  }
>> 
>>  /* implements ecc->read_oob() */
> 
> Thanks,
> Miquèl
