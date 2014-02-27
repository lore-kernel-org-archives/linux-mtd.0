Received: from szxga02-in.huawei.com ([119.145.14.65])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIwRv-0005IW-Dx
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2014 08:36:14 +0000
Message-ID: <530EF850.4030202@huawei.com>
Date: Thu, 27 Feb 2014 16:33:20 +0800
From: Wang Nan <wangnan0@huawei.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [patch 1/4] jffs2: unlock f->sem on error in jffs2_new_inode()
References: <20140212204454.8FA415A40F6@corp2gmr1-2.hot.corp.google.com>
 <20140226020331.GB4194@ld-irv-0074> <530E8C91.4060703@huawei.com>
 <20140227065540.GC13420@norris-Latitude-E6410>
In-Reply-To: <20140227065540.GC13420@norris-Latitude-E6410>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: artem.bityutskiy@linux.intel.com, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, andy.wangguoli@huawei.com,
 genghui 00204690 <hui.geng@huawei.com>, akpm@linux-foundation.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/2/27 14:55, Brian Norris wrote:
> + linux-mtd
> 
> Hi Wang,
> 
> On Thu, Feb 27, 2014 at 08:53:37AM +0800, Wang Nan wrote:
>> On 2014/2/26 10:03, Brian Norris wrote:
>>> On Wed, Feb 12, 2014 at 12:44:54PM -0800, Andrew Morton wrote:
>>>> From: Wang Guoli <andy.wangguoli@huawei.com>
>>>> Subject: jffs2: unlock f->sem on error in jffs2_new_inode()
>>>>
>>>> If jffs2_new_inode() succeeds, it returns with f->sem held, and the caller
>>>> is responsible for releasing the lock.  If it fails, it still returns with
>>>> the lock held, but the caller won't release the lock, which will lead to
>>>> deadlock.
>>>
>>> Have you actually seen a deadlock for this? AFAICT, the error cases for
>>> jffs2_new_inode() all occur before anyone else actually has a reference
>>> to the inode, so I don't expect that we should see the deadlock.
>>>
>>
>> We found this bug by reading code. There's no deadlock have been actually seen.
> 
> Hmm, then I think maybe we should drop the stable tag. I'm not sure it's
> a practical issue, and it also has unrelated indentation changes. That
> means it breaks two of the rules in
> Documentation/stable_kernel_rules.txt. I'm dropping the stable tag
> unless someone shouts.
> 

Thank you for your review, but it is still an obvious bug, isn't it?

We will work for test case, and will let you know if we successfully
trigger deadlock.

>>>> Fix it by releasing the lock in jffs2_new_inode() on error.
>>>>
>>>> Signed-off-by: Wang Guoli <andy.wangguoli@huawei.com>
>>>> Signed-off-by: Wang Nan <wangnan0@huawei.com>
>>>> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>>> Cc: David Woodhouse <dwmw2@infradead.org>
>>>> Cc: Wang Guoli <andy.wangguoli@huawei.com>
>>>> Cc: Brian Norris <computersforpeace@gmail.com>
>>>> Cc: <stable@vger.kernel.org> # 2.6.34+
>>>> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>>>> ---
>>>>
>>>>  fs/jffs2/fs.c |    9 ++++++---
>>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff -puN fs/jffs2/fs.c~jffs2-unlock-f-sem-on-error-in-jffs2_new_inode fs/jffs2/fs.c
>>>> --- a/fs/jffs2/fs.c~jffs2-unlock-f-sem-on-error-in-jffs2_new_inode
>>>> +++ a/fs/jffs2/fs.c
>>>> @@ -457,12 +457,14 @@ struct inode *jffs2_new_inode (struct in
>>>>  	   The umask is only applied if there's no default ACL */
>>>>  	ret = jffs2_init_acl_pre(dir_i, inode, &mode);
>>>>  	if (ret) {
>>>> -	    make_bad_inode(inode);
>>>> -	    iput(inode);
>>>> -	    return ERR_PTR(ret);
>>>> +		mutex_unlock(&f->sem);
>>>> +		make_bad_inode(inode);
>>>> +		iput(inode);
>>>> +		return ERR_PTR(ret);
>>>>  	}
>>>>  	ret = jffs2_do_new_inode (c, f, mode, ri);
>>>>  	if (ret) {
>>>> +		mutex_unlock(&f->sem);
>>>>  		make_bad_inode(inode);
>>>>  		iput(inode);
>>>>  		return ERR_PTR(ret);
>>>> @@ -479,6 +481,7 @@ struct inode *jffs2_new_inode (struct in
>>>>  	inode->i_size = 0;
>>>>  
>>>>  	if (insert_inode_locked(inode) < 0) {
>>>> +		mutex_unlock(&f->sem);
>>>>  		make_bad_inode(inode);
>>>>  		iput(inode);
>>>>  		return ERR_PTR(-EINVAL);
> 
> Brian
> 
