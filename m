Return-Path: <SRS0=ZPU8=LN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44F2C2B9F4
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Jun 2021 06:46:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BA8760FEE
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Jun 2021 06:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BA8760FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/idoZoEWw5BBCcQqn7vJTLvDtML2PNQmDYfwDvghO4=; b=D8D7Dp783Ily+C
	HjHJB1EUuJaxIMdXCXtD1c71dNnVUfzQsof+IA4bmsV7kuVhmdCdGxrvgfVKFMTgXPDGk1s48zstL
	eTSjnmC4INyen9lSTuo5gNd/3ngPDo4ZsK1HtSdlsZDWBJk4VkBgJB1yFk1zCwCx371yFkkXqMlGF
	ZDbyaox3z2vEUyK8KvYW+BNpdTv+PiS/5z+D7ZTXoCXNQfE44e+Ddt86kdFJzz0B6/ZJ/Kk0dlMyA
	dbfo7ZDCeQunfQRh/1EM44ZYZHG1Ov28oxUxFzn6h0G49aAAaSPDNetBGjd+xe/nqfyLD7IznZ5h0
	5gYMBll0HQy5vQ5AKkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luUjQ-00GWUa-TI; Sat, 19 Jun 2021 06:45:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luUjM-00GWSs-AJ
 for linux-mtd@lists.infradead.org; Sat, 19 Jun 2021 06:45:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13F32611CC;
 Sat, 19 Jun 2021 06:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624085123;
 bh=gZApFMXHDsp6CryFssz+iSa+yhSULSfzKkNakx0NpTc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=18OavBaXa0wDz7TianJR07Bd8ET0qABW0QQcdwp8P87KhuPc3X+7D1wUUFQAMPhkb
 CCfwbhCF4Ct8wS2wa4iW9xUDARiUOGVMNE4sNaquifeF7rOxPcORcKH+elRPG9JtPC
 MHqN+Y9x8dHp08p4rGfp24iizbd/ElOmlZjgyKYE=
Date: Sat, 19 Jun 2021 08:44:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: hch@infradead.org, axboe@kernel.dk, desmondcheongzx@gmail.com,
 linux-block@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at,
 Shuah Khan <skhan@linuxfoundation.org>,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com, vigneshr@ti.com
Subject: Re: [PATCH v2] block: genhd: don't call probe function with
 major_names_lock held
Message-ID: <YM2STfTN5AupWlSa@kroah.com>
References: <f790f8fb-5758-ea4e-a527-0ee4af82dd44@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f790f8fb-5758-ea4e-a527-0ee4af82dd44@i-love.sakura.ne.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_234524_466434_2A875FDF 
X-CRM114-Status: GOOD (  36.00  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Jun 19, 2021 at 10:05:44AM +0900, Tetsuo Handa wrote:
> syzbot is reporting circular locking problem at blk_request_module() [1],
> for blk_request_module() is calling probe function with major_names_lock
> held while major_names_lock is held during module's __init and __exit
> functions.
> 
>                                          loop_exit() {
>                                            mutex_lock(&loop_ctl_mutex);
>   blk_request_module() {
>     mutex_lock(&major_names_lock);
>     loop_probe() {
>       mutex_lock(&loop_ctl_mutex); // Blocked by loop_exit()
>       mutex_unlock(&loop_ctl_mutex);
>     }
>     mutex_unlock(&major_names_lock);
>                                            unregister_blkdev() {
>                                              mutex_lock(&major_names_lock); // Blocked by blk_request_module()
>                                              mutex_unlock(&major_names_lock);
>                                            }
>                                            mutex_unlock(&loop_ctl_mutex);
>   }
>                                          }
> 
> Based on an assumption that a probe callback passed to __register_blkdev()
> belongs to a module which calls __register_blkdev(), drop major_names_lock
> before calling probe function by holding a reference to that module which
> contains that probe function. If there is a module where this assumption
> does not hold, such module can call ____register_blkdev() directly.
> 
>   blk_request_module() {
>     mutex_lock(&major_names_lock);
>     // Block loop_exit()
>     mutex_unlock(&major_names_lock);
>     loop_probe() {
>       mutex_lock(&loop_ctl_mutex);
>       mutex_unlock(&loop_ctl_mutex);
>     }
>     // Unblock loop_exit()
>   }
>                                          loop_exit() {
>                                            mutex_lock(&loop_ctl_mutex);
>                                            unregister_blkdev() {
>                                              mutex_lock(&major_names_lock);
>                                              mutex_unlock(&major_names_lock);
>                                            }
>                                            mutex_unlock(&loop_ctl_mutex);
>                                          }
> 
> Note that regardless of this patch, it is up to probe function to
> serialize module's __init function and probe function in that module
> by using e.g. a mutex. This patch simply makes sure that module's __exit
> function won't be called when probe function is about to be called.

module init functions ARE serialized.

> 
> While Desmond Cheong Zhi Xi already proposed a patch for breaking ABCD
> circular dependency [2], I consider that this patch is still needed for
> safely breaking AB-BA dependency upon module unloading. (Note that syzbot
> does not test module unloading code because the syzbot kernels are built
> with almost all modules built-in. We need manual inspection.)
> 
> By doing kmalloc(GFP_KERNEL) in ____register_blkdev() before holding
> major_names_lock, we could convert major_names_lock from a mutex to
> a spinlock. But that is beyond the scope of this patch.
> 
> Link: https://syzkaller.appspot.com/bug?id=7bd106c28e846d1023d4ca915718b1a0905444cb [1]
> Link: https://lkml.kernel.org/r/20210617160904.570111-1-desmondcheongzx@gmail.com [2]
> Reported-by: syzbot <syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Tested-by: syzbot <syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com>
> ---
>  block/genhd.c         | 36 +++++++++++++++++++++++++++---------
>  include/linux/genhd.h |  8 +++++---
>  2 files changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/block/genhd.c b/block/genhd.c
> index 9f8cb7beaad1..9577c70a6bd3 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -169,6 +169,7 @@ static struct blk_major_name {
>  	int major;
>  	char name[16];
>  	void (*probe)(dev_t devt);
> +	struct module *owner;

The module owner should not matter here.


>  } *major_names[BLKDEV_MAJOR_HASH_SIZE];
>  static DEFINE_MUTEX(major_names_lock);
>  
> @@ -197,7 +198,8 @@ void blkdev_show(struct seq_file *seqf, off_t offset)
>   * @major: the requested major device number [1..BLKDEV_MAJOR_MAX-1]. If
>   *         @major = 0, try to allocate any unused major number.
>   * @name: the name of the new block device as a zero terminated string
> - * @probe: allback that is called on access to any minor number of @major
> + * @probe: callback that is called on access to any minor number of @major
> + * @owner: the owner of @probe function (i.e. THIS_MODULE or NULL).

This feels wrong.

>   *
>   * The @name must be unique within the system.
>   *
> @@ -214,8 +216,8 @@ void blkdev_show(struct seq_file *seqf, off_t offset)
>   *
>   * Use register_blkdev instead for any new code.
>   */
> -int __register_blkdev(unsigned int major, const char *name,
> -		void (*probe)(dev_t devt))
> +int ____register_blkdev(unsigned int major, const char *name,
> +			void (*probe)(dev_t devt), struct module *owner)

That's just a crazy naming scheme, please no.

>  {
>  	struct blk_major_name **n, *p;
>  	int index, ret = 0;
> @@ -255,6 +257,7 @@ int __register_blkdev(unsigned int major, const char *name,
>  
>  	p->major = major;
>  	p->probe = probe;
> +	p->owner = owner;
>  	strlcpy(p->name, name, sizeof(p->name));
>  	p->next = NULL;
>  	index = major_to_index(major);
> @@ -277,7 +280,7 @@ int __register_blkdev(unsigned int major, const char *name,
>  	mutex_unlock(&major_names_lock);
>  	return ret;
>  }
> -EXPORT_SYMBOL(__register_blkdev);
> +EXPORT_SYMBOL(____register_blkdev);

That's crazy.

>  
>  void unregister_blkdev(unsigned int major, const char *name)
>  {
> @@ -676,14 +679,29 @@ void blk_request_module(dev_t devt)
>  {
>  	unsigned int major = MAJOR(devt);
>  	struct blk_major_name **n;
> +	void (*probe_fn)(dev_t devt);
>  
>  	mutex_lock(&major_names_lock);
>  	for (n = &major_names[major_to_index(major)]; *n; n = &(*n)->next) {
> -		if ((*n)->major == major && (*n)->probe) {
> -			(*n)->probe(devt);
> -			mutex_unlock(&major_names_lock);
> -			return;
> -		}
> +		if ((*n)->major != major || !(*n)->probe)
> +			continue;
> +		if (!try_module_get((*n)->owner))
> +			break;

So you just fail?  Are you sure that is ok?


> +		/*
> +		 * Calling probe function with major_names_lock held causes
> +		 * circular locking dependency problem. Thus, call it after
> +		 * releasing major_names_lock.
> +		 */
> +		probe_fn = (*n)->probe;
> +		mutex_unlock(&major_names_lock);

So you save a pointer off and then unlock?  Why does that lock matter?

> +		/*
> +		 * Assuming that unregister_blkdev() is called from module's
> +		 * __exit function, a module refcount taken above allows us
> +		 * to safely call probe function without major_names_lock held.
> +		 */
> +		probe_fn(devt);
> +		module_put((*n)->owner);

So you are trying to keep the module in memory while the probe is call,
ok.  But module removal is not an issue, you remove modules at your own
risk.  As syzbot isn't even testing this, why is this an issue?


> +		return;
>  	}
>  	mutex_unlock(&major_names_lock);
>  
> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index 6fc26f7bdf71..070b73c043e6 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -277,10 +277,12 @@ extern void put_disk(struct gendisk *disk);
>  
>  #define alloc_disk(minors) alloc_disk_node(minors, NUMA_NO_NODE)
>  
> -int __register_blkdev(unsigned int major, const char *name,
> -		void (*probe)(dev_t devt));
> +int ____register_blkdev(unsigned int major, const char *name,
> +			void (*probe)(dev_t devt), struct module *owner);
> +#define __register_blkdev(major, name, probe) \
> +	____register_blkdev(major, name, probe, THIS_MODULE)

This just feels wrong, you should only need 1 level deep of __ at most.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
