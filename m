Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG2Bt-00077l-Sa
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2014 08:07:39 +0000
Message-ID: <53046578.9080905@huawei.com>
Date: Wed, 19 Feb 2014 16:04:08 +0800
From: Li Zefan <lizefan@huawei.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [patch 2/4] jffs2: fix unbalanced locking
References: <20140212204455.B3FD75A40F6@corp2gmr1-2.hot.corp.google.com>
 <20140213064847.GF3500@norris-Latitude-E6410> <52FC81E4.2020301@huawei.com>
 <20140214070122.GG3500@norris-Latitude-E6410>
In-Reply-To: <20140214070122.GG3500@norris-Latitude-E6410>
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

>>> BTW, the right way to handle lock balancing is to handle the unlocking
>>> at the same level where you do the locking. So I guess you're looking
>>> for the following patch instead, which is really not very useful because
>>> (as Li noted) the lock is freed immediately afterward anyway:
>>>
>>
>> Yeah, I do believe it's better to do locking/unlocking in the same level.
>> How about this:
>>
>> [PATCH v2] jffs2: fix unbalanced locking
> [...]
>> diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
>> index 386303d..6f22234 100644
>> --- a/fs/jffs2/readinode.c
>> +++ b/fs/jffs2/readinode.c
> [...]
>> @@ -1317,8 +1308,13 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
>>  	}
>>  	if (f->inocache->state == INO_STATE_READING)
>>  		jffs2_set_inocache_state(c, f->inocache, INO_STATE_PRESENT);
>> -
>> -	return 0;
>> +out:
>> +	if (ret) {
>> +		mutex_unlock(&f->sem);
>> +		jffs2_do_clear_inode(c, f);
>> +		mutex_lock(&f->sem);
> 
> This still is not consistent, and this access pattern (unlock / call
> function which uses lock / lock) seems like a hack. How about we just
> make the callers all do the same cleanup instead? Notice the 'error'
> label in jffs2_iget(), which performs the jffs2_do_clear_inode() itself
> already -- seemingly redundant. At least your patch doesn't add double
> unlocks this time...
> 
>> +	}
>> +	return ret;
>>  }
>>  
>>  /* Scan the list of all nodes present for this ino, build map of versions, etc. */
> [...]
> 
> How about we just push all the mutex_unlock(&f->sem) and
> jffs2_do_clear_inode() to the callers which hold the mutex? The
> following patch is totally untested:
> 

Yeah, this is better.

> (BTW Li, have you actually tested any of your patches? I'm going to need
> some Tested-by's before I merge any of this.)
> 

"jffs2: avoid soft-lockup in jffs2_reserve_space_gc()" and an older version of
"jffs2: unlock f->sem on error in jffs2_new_inode()" were tested on 2.6.34
kernel.

We're moving to 3.10, and those jffs2 patches will be tested on 3.10, but
currently we don't have test environment, and it might take month for
the test environment to be available...
