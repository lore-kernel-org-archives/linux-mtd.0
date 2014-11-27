Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xu1cg-0007x7-Ur
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 16:08:52 +0000
Message-ID: <54774C71.50807@nod.at>
Date: Thu, 27 Nov 2014 17:08:17 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/6] UBI: Fastmap: Ensure that all fastmap work is done
 upon WL shutdown
References: <1416835236-25185-1-git-send-email-richard@nod.at>	
 <1416835236-25185-4-git-send-email-richard@nod.at>
 <1417102739.5858.112.camel@sauron.fi.intel.com>
In-Reply-To: <1417102739.5858.112.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
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

Am 27.11.2014 um 16:38 schrieb Artem Bityutskiy:
> On Mon, 2014-11-24 at 14:20 +0100, Richard Weinberger wrote:
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
> 
> If you are using the work infrastructure implemented in wl.c, then
> fastmap work should be no different to any other work. And we do flush
> all works in 'shutdown_work()'. The fastmap work should be flushed there
> too.
> 
> I think we discussed this already - there should be one single queue of
> works, managed by the same set of functions, all flushed in the same
> place, one-by-one...
> 
> Obviously, there is some misunderstanding. This looks like lack of
> separation and misuse of layering. I am missing explanations why I am
> wrong...

So you want me to use the UBI WL background thread for the scheduled fastmap work?
I didn't do it that way because you said more than once that fastmap is fastmap and
WL is WL. Therefore I've separated it.

Thanks,
//richard
