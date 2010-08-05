Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh45D-0004LH-9n
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 17:18:20 +0000
Received: by pzk3 with SMTP id 3so2962274pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 10:18:18 -0700 (PDT)
Date: Fri, 6 Aug 2010 01:18:16 +0800
From: Chuanxiao <chuanxiao.dong@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v1 2/2]nand/denali Update get_nand_para functions
Message-ID: <20100805171816.GA6320@infernal>
References: <20100805162800.GC3160@infernal>
	<1281026095.8720.29.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1281026095.8720.29.camel@localhost>
Cc: chuanxiao.dong@intel.com, hang.yuan@intel.com,
	linux-mtd@lists.infradead.org, yunpeng.gao@intel.com, dedekind1@gmail.com
Reply-To: Chuanxiao <chuanxiao.dong@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 05, 2010 at 05:34:55PM +0100, David Woodhouse wrote:
>On Fri, 2010-08-06 at 00:28 +0800, Chuanxiao wrote:
>> @@ -1732,24 +1699,18 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
>>                 break;
>>         case NAND_CMD_READID:
>>                 reset_buf(denali);
>> -               if (denali->flash_bank < denali->total_used_banks) {
>> -                       /* write manufacturer information into nand
>> -                          buffer for NAND subsystem to fetch.
>> -                          */
>> -                       write_byte_to_buf(denali,
>> -                                       denali->dev_info.wDeviceMaker);
>> -                       write_byte_to_buf(denali,
>> -                                       denali->dev_info.wDeviceID);
>> -                       write_byte_to_buf(denali,
>> -                                       denali->dev_info.bDeviceParam0);
>> -                       write_byte_to_buf(denali,
>> -                                       denali->dev_info.bDeviceParam1);
>> -                       write_byte_to_buf(denali,
>> -                                       denali->dev_info.bDeviceParam2);
>> -               } else {
>> -                       int i;
>> -                       for (i = 0; i < 5; i++)
>> -                               write_byte_to_buf(denali, 0xff);
>> +               /*sometimes ManufactureId read from register is not right
>> +                * e.g. some of Micron MT29F32G08QAA MLC NAND chips
>> +                * So here we send READID cmd to NAND insteand
>> +                * */
>> +               addr = (uint32_t)MODE_11 | BANK(denali->flash_bank); 
>
>drivers/mtd/nand/denali.c: In function ‘denali_cmdfunc’:
>drivers/mtd/nand/denali.c:1706: error: ‘addr’ undeclared (first use in this function)
>drivers/mtd/nand/denali.c:1706: error: (Each undeclared identifier is reported only once
>drivers/mtd/nand/denali.c:1706: error: for each function it appears in.)
>drivers/mtd/nand/denali.c:1709: error: ‘i’ undeclared (first use in this function)
>drivers/mtd/nand/denali.c:1712: error: ‘id’ undeclared (first use in this function)
>make[3]: *** [drivers/mtd/nand/denali.o] Error 1
>
My mistake. Sorry... New patches were sent out.
David, I will keep on submit patches tomorrow when I come back to
office. In office, I can't use mutt client to access my gmail
account. As far as I know, intel email can send mail out
with no errors. So tomorrow I will try to send patches by intel
email. If the patches send out by intel email has problems, I will
resend patches after I come back home.
Thank you, David.
>-- 
>David Woodhouse                            Open Source Technology Centre
>David.Woodhouse@intel.com                              Intel Corporation
>
