Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YI76F-0000i8-9e
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 02:50:57 +0000
Message-ID: <54CEE5D0.7060003@huawei.com>
Date: Mon, 2 Feb 2015 10:49:52 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH RFC 2/2] UBIFS: scan all log lebs during log replay
References: <549C0A10.3000201@huawei.com> <549C0CC4.9050703@huawei.com>
 <1422708415.8637.328.camel@sauron.fi.intel.com>
In-Reply-To: <1422708415.8637.328.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, shengyong1@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/1/31 20:46, Artem Bityutskiy wrote:
> On Thu, 2014-12-25 at 21:10 +0800, hujianyang wrote:
>> UBIFS suppose no more log lebs need to be scanned when
>> replay_log_leb() return %1. But it is not true because
>> some log lebs maybe incorrectly empty and the next leb
>> of this empty one may contain valid filesystem data.
> 
>>From your other e-mail, I understood that you are doing fuzzing. That
> is, you take a valid file-system, then you corrupt it (e.g., erase one
> LEB), and then you try to mount it.
> 
> This is a great test, I never saw anyone doing it for UBIFS, so I expect
> there may be issues.

Yes, it is.

One of production teams using UBI/UBIFS met an ECC error during log
replay and current UBIFS refuse to mount. This implement is unacceptable
for them. I was asked to solve this problem.

My partner Sheng Yong and I focus on log replay first, although other
parts of UBIFS may suffer ECC errors which could lead to other kinds of
problems.

We separate *ECC error during log replay* into two parts:

1) ECC error on log lebs
2) ECC error on buds

Current implement directly return an error if there is any unrecoverable
corrupt. Log area contains uncommitted data and the data losing of this
area is acceptable as you said. But here is a problem: log replay not
only update TNC tree but also update LPT area. That means, directly discard
corrupt data may put this partition into a unstable state, and lead to
a problem I described in my last patch:

   [PATCH resend] UBIFS: return -EINVAL if first log leb is empty


Since the log of UBIFS is multi-heads, It not easy to judge which log
should be kept, which log should be discard when an ECC error occur.
So we decide to discard all journals with LPT updating -- mark the used
buds as dirty.

It's easy for the second problem *2) ECC error on buds* to achieve
this implement. But hard for *1) ECC error on log lebs*, because
we don't know which leb contains buds in this case, seems a whole scan
is needed. So we just solve the second problem but the first one is
still pending. I'd like to show you the code this week.

> 
> Let's agree on expectations.
> 
> What do we expect UBIFS to do when we give it a corrupted image? I think
> we expect it to either reject it, or accept, but some files may be lost
> or corrupted.
> 
> And we for sure do not expect UBIFS to crash the kernel, or corrupt the
> file-system even more (still good data should not become corrupted).
> 
> Now, what this patch does, it essentially it fixes the following UBIFS
> behavior.
> 
> UBIFS replies the log. It meets empty LEB (this is our injected
> corruption), and it believes this is the end of the log. It proceeds and
> mounts the FS.
> 
> Nothing wrong so far, IMO.
> 
> However, the LEBs we missed contain valid data. And what will happen to
> them once we start writing to the FS? Right - they'll be erased, and
> good data disappears. However, this will be the data that was not
> committed, which means this will be something written to the file-system
> just before the power cut. And I think it is expected that this data may
> disappear. So this is not that bad.
>
> The other _potential_ problem is that the "skipping one LEB" scenario
> has never been really tested, and there may be bugs which may lead to
> kernel crashes or data loss.
>

Sure. But current embedded system usually store their rootfs on a
NOR flash partition. And we just lose new adding things, it's no
harm for a local system, I see.


> Therefore, while I acknowledge the problem, I do not think this patch is
> the right answer to the problem.
> 
> The easiest solution is to do nothing. Just let the rest of the log go
> away. Does not look big deal to me.
> 
> The more difficult thing to do is to start analyzing the log further,
> see what's in there, and keep replying if we are sure this is our stuff.
> But I cannot come up with a reliable algorithm for this off the top of
> my head.
> 

Agree with you.

So I didn't resend this patch. I need some time to reconsidering this
problem. I want to discuss with you and others when I sent this patch,
and need to make sure it is a right way I'm walking forward.

Your replaying give me confidence to keep on working for reliable
problems.

Could you please discuss more with me when I send out the implement
which recover a *buds ECC error* image?


Thanks~!
Hu
