Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZgVW-0006oZ-TE
 for linux-mtd@lists.infradead.org; Thu, 02 Oct 2014 13:33:23 +0000
Message-ID: <542D540B.5010808@nod.at>
Date: Thu, 02 Oct 2014 15:32:59 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, dedekind1@gmail.com
Subject: Re: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
References: <1412029248-22454-1-git-send-email-richard@nod.at>
 <1412029248-22454-4-git-send-email-richard@nod.at>
 <542D5314.3050701@codeaurora.org>
In-Reply-To: <542D5314.3050701@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.10.2014 15:28, schrieb Tanya Brokhman:
> Hi Richard
> 
> On 9/30/2014 1:20 AM, Richard Weinberger wrote:
>> Fastmap can miss a PEB if it is in the protection queue
>> and not jet in the used tree.
>> Treat every protected PEB as used.
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>>   drivers/mtd/ubi/fastmap.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
>> index 2b0d8d6..2853a69 100644
>> --- a/drivers/mtd/ubi/fastmap.c
>> +++ b/drivers/mtd/ubi/fastmap.c
>> @@ -1195,6 +1195,19 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>>           fm_pos += sizeof(*fec);
>>           ubi_assert(fm_pos <= ubi->fm_size);
>>       }
>> +
>> +    for (i = 0; i < UBI_PROT_QUEUE_LEN; i++) {
>> +        list_for_each_entry(wl_e, &ubi->pq[i], u.list) {
> 
> why not list_for_each_entry_safe?

Because we don't delete elements from this list while iterating over it.

>> +            fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
>> +
>> +            fec->pnum = cpu_to_be32(wl_e->pnum);
>> +            fec->ec = cpu_to_be32(wl_e->ec);
>> +
>> +            used_peb_count++;
>> +            fm_pos += sizeof(*fec);
>> +            ubi_assert(fm_pos <= ubi->fm_size);
> 
> Is fm_size ok with this addition or does it needs updating as well?

It is okay. The fastmap size calculation reserves enough space for all possible
PEBs.

Thanks,
//richard
