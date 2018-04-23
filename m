Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAUeU-0006kt-53
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 06:08:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 23 Apr 2018 11:38:27 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 6/9] mtd: nand: qcom: support for checking read errors for
 last codeword
In-Reply-To: <20180422181530.63f39278@xps13>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-7-git-send-email-absahu@codeaurora.org>
 <20180410120542.24ea9ddb@xps13>
 <d9f06fe59fa76d2dbf97cb0b5de75bc7@codeaurora.org>
 <20180422181530.63f39278@xps13>
Message-ID: <10ef5f58aceed5bb5069dad6c1b1b0e3@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-04-22 21:45, Miquel Raynal wrote:
> Hi Abhishek,
> 
> On Thu, 12 Apr 2018 12:47:42 +0530, Abhishek Sahu
> <absahu@codeaurora.org> wrote:
> 
>> On 2018-04-10 15:35, Miquel Raynal wrote:
>> > Hi Abhishek,
>> > > On Wed,  4 Apr 2018 18:12:22 +0530, Abhishek Sahu
>> > <absahu@codeaurora.org> wrote:
>> > >> Add boolean function argument in parse_read_errors to identify
>> >> whether the read error has been called for complete page read or
>> >> only last codeword read. This will help in subsequent patches to
>> >> detect ECC errors in case of last codeword read.
>> > > Can you explain when this happen: "last codeword read"? I don't see the
>> > use case.
>> 
>>   Hi Miquel,
>> 
>>   This is happening inside qcom_nandc_write_oob where the last subpage
>>   data is being copied first.
> 
> I still don't understand the use case.
> 
> What to you mean last 'subpage copied first'?
> 

  Hi Miquel,

  According to current implementation

  QCOM NAND layout protect 16 bytes of available oob with ECC also.
  When ecc->write_oob (qcom_nandc_write_oob) is being called
  then it can't update just OOB bytes.

  It needs to first read the last subpage which includes old
  OOB bytes. Then it updates the old OOB bytes with new one
  and then again write the data back.

  You can refer function comment of qcom_nandc_write_oob
  for the same.

  But, to me, it looks like this read is unnecessary since
  all the other bytes will be 0xff only. Require your help
  in confirming the same and then I will remove that read
  last subpage implementation.

  Thanks,
  Abhishek

>> 
>>     host->use_ecc = true;
>> 
>>     clear_bam_transaction(nandc);
>>     ret = copy_last_cw(host, page);
>>     if (ret)
>>         return ret;
>> 
>>   you can refer function comment of qcom_nandc_write_oob  for more
>>   detail.
>> 
>>   Thanks,
>>   Abhishek
