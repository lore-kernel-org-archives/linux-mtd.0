Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbWZh-0007KM-Vb
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 11:35:26 +0000
Message-ID: <4E09BC89.40306@free-electrons.com>
Date: Tue, 28 Jun 2011 13:35:37 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBI: new module ubiblk: block layer on top of UBI
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>	<1308922482-14967-2-git-send-email-david.wagner@free-electrons.com>
	<1309202771.24805.11.camel@koala>
In-Reply-To: <1309202771.24805.11.camel@koala>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 06/27/2011 09:26 PM, Artem Bityutskiy wrote:
> On Fri, 2011-06-24 at 15:34 +0200, david.wagner@free-electrons.com
> wrote:
>> +	/* Stolen from mtd_blkdevs.c */
>> +	/* Create processing thread */
>> +	dev->thread = kthread_run(ubi_ubiblk_thread, dev, "%s%d_%d",
>> +				  "kubiblkd", dev->ubi_num, dev->vol_id);
>> +	if (IS_ERR(dev->thread)) {
>> +		ret = PTR_ERR(dev->thread);
>> +		goto out_thread;
>> +	}
> 
> Why we need a kernel thread? Could you please describe when exactly it
> is needed and why we cannot avoid having it?

Do you mean that there could be another/better way ?
I read that workqueues could be used for that but since they seem to
internally use kthreads, I don't see the advantage yet. Simpler API ?

I also tried without a kthread altogether (and call do_ubiblk_request
directly within the callback registered with blk_init_queue) but got
lost in locks/context debugging ...

It seems that do_ubiblk_request needs to be in process context because
there are thousands causes for blocking (locking, page fault, for
instance, are the one I encountered). And on the other hand,
blk_run_queue must not block ; So we need to wake the thread up and
return (what ubi_ubiblk_request does).
So, would this be a sufficient justification ?


It's probably possible, however, to have only one thread for the whole
module instead of having one for each volume ; but that seemed good
enough on first approach.


I fixed the read errors issue with filesystems != SquashFS, so they
should all work, now.
I'll send the next iteration, probably later today.

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
