Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm2pq-0003To-UY
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 15:49:27 +0000
Message-ID: <545A46F0.7030805@nod.at>
Date: Wed, 05 Nov 2014 16:49:04 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 06/35] UBI: Fastmap: Ensure that all fastmap work is done
 upon WL shutdown
References: <1414586758-9972-1-git-send-email-richard@nod.at>	
 <1414586758-9972-7-git-send-email-richard@nod.at>
 <1415202307.958.125.camel@sauron.fi.intel.com>
In-Reply-To: <1415202307.958.125.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.11.2014 um 16:45 schrieb Artem Bityutskiy:
> On Wed, 2014-10-29 at 13:45 +0100, Richard Weinberger wrote:
>> ...otherwise the deferred work might run after datastructures
>> got freed and corrupt memory.
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>>  drivers/mtd/ubi/wl.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
>> index bd2e8d5..a06e31e 100644
>> --- a/drivers/mtd/ubi/wl.c
>> +++ b/drivers/mtd/ubi/wl.c
>> @@ -2047,6 +2047,9 @@ static void protection_queue_destroy(struct ubi_device *ubi)
>>  void ubi_wl_close(struct ubi_device *ubi)
>>  {
>>  	dbg_wl("close the WL sub-system");
>> +#ifdef CONFIG_MTD_UBI_FASTMAP
>> +	flush_work(&ubi->fm_work);
>> +#endif
> 
> I see in patch 35 you introduced the init function. Could you please
> introduce fastmap init/close functions earlier, and add this line to the
> fastmap close function instead of adding yet another ifdef to wl.c.

If you want I can rebase.
I did all fixes first and then the cleanups.

Thanks,
//richard
