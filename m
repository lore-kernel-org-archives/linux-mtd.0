Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIdIQ-0004JW-Nt
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 12:09:08 +0000
Message-ID: <530DD83D.5090507@huawei.com>
Date: Wed, 26 Feb 2014 20:04:13 +0800
From: Li Zefan <lizefan@huawei.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [patch 3/4] jffs2: avoid soft-lockup in jffs2_reserve_space_gc()
References: <20140212204456.E010B5A40F6@corp2gmr1-2.hot.corp.google.com>
 <20140226021709.GD4194@ld-irv-0074>
In-Reply-To: <20140226021709.GD4194@ld-irv-0074>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, artem.bityutskiy@linux.intel.com,
 akpm@linux-foundation.org, dwmw2@infradead.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>  fs/jffs2/nodemgmt.c |   13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff -puN fs/jffs2/nodemgmt.c~jffs2-avoid-soft-lockup-in-jffs2_reserve_space_gc fs/jffs2/nodemgmt.c
>> --- a/fs/jffs2/nodemgmt.c~jffs2-avoid-soft-lockup-in-jffs2_reserve_space_gc
>> +++ a/fs/jffs2/nodemgmt.c
>> @@ -211,20 +211,25 @@ out:
>>  int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize,
>>  			   uint32_t *len, uint32_t sumsize)
>>  {
>> -	int ret = -EAGAIN;
>> +	int ret;
>>  	minsize = PAD(minsize);
>>  
>>  	jffs2_dbg(1, "%s(): Requested 0x%x bytes\n", __func__, minsize);
>>  
>> -	spin_lock(&c->erase_completion_lock);
>> -	while(ret == -EAGAIN) {
>> +	while (true) {
>> +		spin_lock(&c->erase_completion_lock);
>>  		ret = jffs2_do_reserve_space(c, minsize, len, sumsize);
>>  		if (ret) {
>>  			jffs2_dbg(1, "%s(): looping, ret is %d\n",
>>  				  __func__, ret);
>>  		}
>> +		spin_unlock(&c->erase_completion_lock);
>> +
>> +		if (ret == -EAGAIN)
>> +			cond_resched();
> 
> Just curious: would this be a place to use cond_resched_lock(), and keep
> the lock outside the loop?
> 

Yeah, cond_resched_lock() can be used too, but doesn't make much difference.
This patch adds 5 LOC, and using cond_resched_lock() will also add 5 LOC.

As you've already merged it, I think it isn't worth borthing to make this change.

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 0331072..36e9538 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -223,6 +223,11 @@ int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t mi
nsize,
                        jffs2_dbg(1, "%s(): looping, ret is %d\n",
                                  __func__, ret);
                }
+
+               if (ret == -EAGAIN)
+                       cond_resched_lock(&c->erease_completion_lock);
+               else
+                       break;
        }
        spin_unlock(&c->erase_completion_lock);


>> +		else
>> +			break;
>>  	}
>> -	spin_unlock(&c->erase_completion_lock);
>>  	if (!ret)
>>  		ret = jffs2_prealloc_raw_node_refs(c, c->nextblock, 1);
>>  
> 
> Anyway, pushed to l2-mtd.git.
> 

Thanks!
