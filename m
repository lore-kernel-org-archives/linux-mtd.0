Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9hG7-0000hJ-Om
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 21:38:20 +0000
Message-ID: <54B04A34.7030008@nod.at>
Date: Fri, 09 Jan 2015 22:37:56 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, dedekind1@gmail.com
Subject: Re: [PATCH 3/6] UBI: Fastmap: Ensure that all fastmap work is done
 upon WL shutdown
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <1416835236-25185-4-git-send-email-richard@nod.at>
 <54B048E4.3080102@vanguardiasur.com.ar>
In-Reply-To: <54B048E4.3080102@vanguardiasur.com.ar>
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

Am 09.01.2015 um 22:32 schrieb Ezequiel Garcia:
> On 11/24/2014 10:20 AM, Richard Weinberger wrote:
>> ...otherwise the deferred work might run after datastructures
>> got freed and corrupt memory.
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>>  drivers/mtd/ubi/wl.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
>> index 7f135df..cb2e571 100644
>> --- a/drivers/mtd/ubi/wl.c
>> +++ b/drivers/mtd/ubi/wl.c
>> @@ -2041,6 +2041,9 @@ static void protection_queue_destroy(struct ubi_device *ubi)
>>  void ubi_wl_close(struct ubi_device *ubi)
>>  {
>>  	dbg_wl("close the WL sub-system");
>> +#ifdef CONFIG_MTD_UBI_FASTMAP
>> +	flush_work(&ubi->fm_work);
>> +#endif
>>  	shutdown_work(ubi);
>>  	protection_queue_destroy(ubi);
>>  	tree_destroy(&ubi->used);
>>
> 
> IMHO, it's best to avoid nasty ifdefs like this (there are lots of ways
> of getting it cleaner). But I guess it's not a big deal.

I agree that's why I've cleaned up the vast majority of all ifdefs in a later cleanup
commit. My original plan was to have first pure bug fixes and then cleanups to make
backporting of my patches easy.

Thanks,
//richard
