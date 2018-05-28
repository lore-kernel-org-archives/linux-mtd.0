Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNBSk-0005OM-LA
 for linux-mtd@lists.infradead.org; Mon, 28 May 2018 06:17:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 28 May 2018 11:46:47 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Andy Gross
 <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 13/16] mtd: rawnand: qcom: minor code reorganization
 for bad block check
In-Reply-To: <20180526104900.139dd19b@xps13>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-14-git-send-email-absahu@codeaurora.org>
 <20180526104900.139dd19b@xps13>
Message-ID: <d48035002fc00f142edc8ed80309f8a7@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-05-26 14:28, Miquel Raynal wrote:
> Hi Abhishek,
> 
> 
>> @@ -2141,12 +2127,10 @@ static int qcom_nandc_block_bad(struct 
>> mtd_info *mtd, loff_t ofs)
>>  		goto err;
>>  	}
>> 
>> -	bbpos = mtd->writesize - host->cw_size * (ecc->steps - 1);
>> -
>> -	bad = nandc->data_buffer[bbpos] != 0xff;
>> +	bad = bbm_bytes_buf[0] != 0xff;
> 
> BTW, as there are host->bbm_size bytes that can inform on the block
> state, don't we need to check all of them?
> 

  We are checking all of them.
  host->bbm_size will be either 1 (for NAND_BUSWIDTH_8) or
  2 (for NAND_BUSWIDTH_16).

  
https://elixir.bootlin.com/linux/v4.17-rc7/source/drivers/mtd/nand/raw/qcom_nandc.c#L2347

  Thanks,
  Abhishek

>> 
>>  	if (chip->options & NAND_BUSWIDTH_16)
>> -		bad = bad || (nandc->data_buffer[bbpos + 1] != 0xff);
>> +		bad = bad || (bbm_bytes_buf[1] != 0xff);
>>  err:
>>  	return bad;
>>  }
> 
> Thanks,
> Miquèl
