Received: from mail-bk0-x229.google.com ([2a00:1450:4008:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhhUr-0008HH-DQ
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 14:37:02 +0000
Received: by mail-bk0-f41.google.com with SMTP id jc10so4977639bkc.28
 for <linux-mtd@lists.infradead.org>; Wed, 29 May 2013 07:36:39 -0700 (PDT)
Sender: Christian Riesch <christian.riesch@gmail.com>
Message-ID: <51A61274.70607@omicron.at>
Date: Wed, 29 May 2013 16:36:36 +0200
From: Christian Riesch <christian.riesch@omicron.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 1/4] mtd: cfi_cmdset_0002: Add support for reading OTP
References: <1367003430-24584-1-git-send-email-christian.riesch@omicron.at>
 <38c84e40-1171-4040-bc8b-ec51a0485819@mary.at.omicron.at>
 <1369811482.5446.216.camel@sauron.fi.intel.com> <51A5FA84.8030906@omicron.at>
 <1369835589.24286.31.camel@sauron.fi.intel.com>
In-Reply-To: <1369835589.24286.31.camel@sauron.fi.intel.com>
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

On 2013-05-29 15:53, Artem Bityutskiy wrote:
> On Wed, 2013-05-29 at 14:54 +0200, Christian Riesch wrote:
>> Artem,
>> Thank you very much for your comments!
>>
>> On 2013-05-29 09:11, Artem Bityutskiy wrote:
>>> On Fri, 2013-04-26 at 21:10 +0200, Christian Riesch wrote:
>>>> +static int cfi_amdstd_get_fact_prot_info(struct mtd_info *mtd,
>>>> +                                          struct otp_info *buf,
>>>> size_t len)
>>>> +{
>>>> +       size_t retlen;
>>>> +       int ret;
>>>> +
>>>> +       ret = cfi_amdstd_otp_walk(mtd, 0, len, &retlen, (u_char *)buf,
>>>> NULL, 0);
>>>> +       return ret ? : retlen;
>>>> +}
>>>
>>> Hmm, I thought we would return 0 in case of success and a negative error
>>> code in case of error. Returning retlen looks wrong.
>>>
>>
>> I don't think so. Somehow the caller of this function should be told how
>> many bytes have been written into buf, there is no other way to return
>> the data length than the return value. Anyway, I just stole this code
>> from cfi_cmdset_0001.c (function cfi_intelext_get_fact_prot_info), it is
>> done in the same way there.
>
> But retlen is where you return the amount of bytes you actually wrote.
> The return code is either 0 or a negative error code number. This is
> what we do in mtd_write() and I'd expect the OTP functions to be
> consistent.

Unlike mtd_write, mtd->_get_fact_prot_info (which is a pointer to 
cfi_amdstd_get_fact_prot_info here) does not have a retlen parameter. Do 
you suggest to change this?

Regards, Christian
