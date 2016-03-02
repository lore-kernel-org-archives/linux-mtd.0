Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab935-0004vn-Qd
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 15:50:53 +0000
From: "Franklin S Cooper Jr." <fcooper@ti.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>,
 <daniel.thompson@linaro.org>, <xiaolei.li@mediatek.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH] mtd: nand: tests: fix regression introduced in
 mtd_nandectest
References: <1456866240-26119-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160301221755.093f5223@bbrezillon>
Message-ID: <56D70BBB.1020004@ti.com>
Date: Wed, 2 Mar 2016 09:50:19 -0600
MIME-Version: 1.0
In-Reply-To: <20160301221755.093f5223@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 03/01/2016 03:17 PM, Boris Brezillon wrote:
> Hi Jorge,
>
> On Tue,  1 Mar 2016 16:04:00 -0500
> Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:
>
>> Offending Commit: 6e94119 "mtd: nand: return consistent error codes in
>> ecc.correct() implementations"
>>
>> The new error code was not being handled properly in double bit error
>> detection.
>>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> Thanks,
>
> Boris

We just encountered this problem and this patch fixed it.
Tested-by: Franklin S Cooper Jr <fcooper@ti.com>
>> ---
>>  drivers/mtd/tests/mtd_nandecctest.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
>> index 7931615..88b6c81 100644
>> --- a/drivers/mtd/tests/mtd_nandecctest.c
>> +++ b/drivers/mtd/tests/mtd_nandecctest.c
>> @@ -187,7 +187,7 @@ static int double_bit_error_detect(void *error_data, void *error_ecc,
>>  	__nand_calculate_ecc(error_data, size, calc_ecc);
>>  	ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size);
>>  
>> -	return (ret == -1) ? 0 : -EINVAL;
>> +	return (ret == -EBADMSG) ? 0 : -EINVAL;
>>  }
>>  
>>  static const struct nand_ecc_test nand_ecc_test[] = {
>
>
