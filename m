Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xx023-00043w-Cf
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 21:03:20 +0000
Message-ID: <54821D80.50703@nod.at>
Date: Fri, 05 Dec 2014 22:02:56 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, dedekind1@gmail.com
Subject: Re: [PATCH 5/6] UBI: Split __wl_get_peb()
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <1416835236-25185-6-git-send-email-richard@nod.at>
 <5481EE65.1090705@codeaurora.org>
In-Reply-To: <5481EE65.1090705@codeaurora.org>
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

Tanya,

Am 05.12.2014 um 18:41 schrieb Tanya Brokhman:
> On 11/24/2014 3:20 PM, Richard Weinberger wrote:
>> Make it two functions, wl_get_wle() and wl_get_peb().
>> wl_get_peb() works exactly like __wl_get_peb() but wl_get_wle()
>> does not call produce_free_peb().
>> While refilling the fastmap user pool we cannot release ubi->wl_lock
>> as produce_free_peb() does.
>> Hence the fastmap logic uses now wl_get_wle().
> 
> hmmm... confused... I don't see fastmap code changed

It will be used in ubi_refill_pools() later.
Patch 6/6 does this.
I'll fix the commit message.

>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>>   drivers/mtd/ubi/wl.c | 61 ++++++++++++++++++++++++++++++++--------------------
>>   1 file changed, 38 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
>> index 7730b97..f028b68 100644
>> --- a/drivers/mtd/ubi/wl.c
>> +++ b/drivers/mtd/ubi/wl.c
>> @@ -499,13 +499,46 @@ out:
>>   #endif
>>
>>   /**
>> - * __wl_get_peb - get a physical eraseblock.
>> + * wl_get_wle - get a mean wl entry to be used by wl_get_peb() or
>> + * refill_wl_user_pool().
>> + * @ubi: UBI device description object
>> + *
>> + * This function returns a a wear leveling entry in case of success and
> 
> If you upload a new version, you have a double "a" here: "returns a a wear leveling"

Thx!

>> + * NULL in case of failure.
>> + */
>> +static struct ubi_wl_entry *wl_get_wle(struct ubi_device *ubi)
>> +{
>> +    struct ubi_wl_entry *e;
>> +
>> +    e = find_mean_wl_entry(ubi, &ubi->free);
>> +    if (!e) {
>> +        ubi_err(ubi, "no free eraseblocks");
>> +        return NULL;
>> +    }
>> +
>> +    self_check_in_wl_tree(ubi, e, &ubi->free);
>> +
>> +    /*
>> +     * Move the physical eraseblock to the protection queue where it will
>> +     * be protected from being moved for some time.
>> +     */
> 
> I don't think this comment is valid anymore....

Correct, will update!

Thanks,
//richard
