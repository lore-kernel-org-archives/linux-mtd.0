Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXCxP-00071X-4K
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 20:49:32 +0000
Received: by mail-wm0-x243.google.com with SMTP id 15so1067002wmm.3
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2017 13:49:10 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: vf610_nfc: add NULL check on of_match_device()
 return value
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "Gustavo A. R. Silva" <garsilva@embeddedor.com>
References: <20170707065926.GA25776@embeddedgus>
 <20170717224619.1615e13f@bbrezillon>
Cc: Stefan Agner <stefan@agner.ch>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <198201f8-ad5f-99d5-b357-9634185ca9e3@gmail.com>
Date: Mon, 17 Jul 2017 22:49:06 +0200
MIME-Version: 1.0
In-Reply-To: <20170717224619.1615e13f@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/17/2017 10:46 PM, Boris Brezillon wrote:
> Le Fri, 7 Jul 2017 01:59:26 -0500,
> "Gustavo A. R. Silva" <garsilva@embeddedor.com> a écrit :
> 
>> Check return value from call to of_match_device()
>> in order to prevent a NULL pointer dereference.
>>
>> In case of NULL print error message and return -ENODEV
>>
>> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
>> ---
>>  drivers/mtd/nand/vf610_nfc.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
>> index 744ab10..ca0ab96 100644
>> --- a/drivers/mtd/nand/vf610_nfc.c
>> +++ b/drivers/mtd/nand/vf610_nfc.c
>> @@ -674,6 +674,11 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	of_id = of_match_device(vf610_nfc_dt_ids, &pdev->dev);
>> +	if (!of_id) {
>> +		dev_err(&pdev->dev, "Failed to match device!\n");
>> +		return -ENODEV;
>> +	}
>> +
> 
> While this check is functionally correct, this case cannot happen,
> because this is DT-only driver, and without a valid match in
> vf610_nfc_dt_ids the dev wouldn't have been probed in the first place.
> 
> I'll let Stefan decide whether he wants it or not, but I see no real
> reason for this extra check. 

So how did you trigger the issue in the first place ?

-- 
Best regards,
Marek Vasut
