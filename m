Received: from mail-bk0-x22d.google.com ([2a00:1450:4008:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhgIV-0005xv-Nj
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 13:20:12 +0000
Received: by mail-bk0-f45.google.com with SMTP id je9so4290275bkc.18
 for <linux-mtd@lists.infradead.org>; Wed, 29 May 2013 06:19:49 -0700 (PDT)
Sender: Christian Riesch <christian.riesch@gmail.com>
Message-ID: <51A60071.2060005@omicron.at>
Date: Wed, 29 May 2013 15:19:45 +0200
From: Christian Riesch <christian.riesch@omicron.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: mtdchar: Exit write loop when hitting end of OTP
 memory
References: <29483dd6-387c-4b28-b689-88795e0bbbde@mary.at.omicron.at>
 <1369811298.5446.215.camel@sauron.fi.intel.com>
In-Reply-To: <1369811298.5446.215.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,
Thank you again for your comments.

On 2013-05-29 09:08, Artem Bityutskiy wrote:
> On Fri, 2013-04-26 at 19:56 +0200, Christian Riesch wrote:
>> If a write to one time programmable memory (OTP) hits the end
>> of this memory area, no more data can be written and count does not
>> decrease anymore. We are trapped in the loop forever.
>>
>> Therefore drop the remaining data if retlen != len.
>>
>> Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
>> ---
>>   drivers/mtd/mtdchar.c |    4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
>> index e0e59bf..70c18c2 100644
>> --- a/drivers/mtd/mtdchar.c
>> +++ b/drivers/mtd/mtdchar.c
>> @@ -321,6 +321,10 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
>>   		case MTD_FILE_MODE_OTP_USER:
>>   			ret = mtd_write_user_prot_reg(mtd, *ppos, len,
>>   						      &retlen, kbuf);
>> +
>> +			/* if we hit the end of otp memory, drop the rest */
>> +			if (retlen != len)
>> +				count -= len - retlen;
>>   			break;
>
> I think the problem is that 'mtd_write_user_prot_reg()' should return an
> error if you try to write more data than it is available. At least this
> is the behavior of 'mtd_write()'.
>

The OTP code for the AMD command set in my recent patchset is modeled 
after the existing code in drivers/mtd/chips/cfi_cmdset_0001.c. 
Therefore it has a ...walk() function that walks from chip to chip and 
tries to write as much data as possible into the OTP memories of these 
chips. Until the last iteration of this loop it does not know how much 
OTP memory is available. Therefore, a check for insufficient OTP memory 
and returning an error before writing any data is not possible.

Of course I could change my code to obtain the available OTP memory 
before writing any data. But then the code in cfi_cmdset_0001.c would 
still suffer from this issue.

What do you think?

Best regards, Christian
