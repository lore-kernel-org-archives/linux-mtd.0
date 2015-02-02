Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YI7Qe-0000zt-0K
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 03:12:01 +0000
Message-ID: <54CEEAC1.2080403@huawei.com>
Date: Mon, 2 Feb 2015 11:10:57 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH resend] UBIFS: return -EINVAL if first log leb is empty
References: <54CC4F77.1000801@huawei.com>
 <1422697906.8637.295.camel@sauron.fi.intel.com> <54CCAFB4.3060705@huawei.com>
 <1422706597.8637.311.camel@sauron.fi.intel.com>
In-Reply-To: <1422706597.8637.311.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/1/31 20:16, Artem Bityutskiy wrote:
> On Sat, 2015-01-31 at 18:34 +0800, hujianyang wrote:
>> Artem, Thanks for your reviewing. Could I add a Reviewed-by after resending
>> a v2 patch?
> 
> Well, I do want to help you to have things done quicker by letting you
> adding the Reviewed-by tag already in v2. But the protocol is the
> protocol, the Reviewed-by tag is usually something the reviewer replies
> with when he sees the final version of the patch.
>

Sure. I just thought it's a simple problem and I could fix it as you
suggested in v2. Since I'm not a careful man, I wish you could keep
on commenting my v2 patch.

Thanks for your help in this patch again.

> Besides, I am still the one who merges UBIFS stuff. I am letting Richard
> to be the UBI master so far, since this is the area he demonstrated the
> excellence at, not UBIFS.
> 
> UBIFS and UBI are very different, just like MTD and UBI. Knowing one of
> them well does not make you automatically fluent in the other.
> 
> So the layout I proposed Richard was:
> 
> 1. Richard owns UBI, I most probably will slowly shade away from that
> area.
> 2. Richard owns mtd-utils
> 3. I still own UBIFS, but will be ready to hand it over to the next
> brave one.
> 

I think you are busy with other stuff these days. I'm sorry to disturb
you a lot.

> <sentiment>
> UBI is my baby, it is my first serious piece of work I've done. Working
> with smart people from Linutronix, for IBM was fantastic!
> 
> But UBI is "grown up" and it is time for me to move forward. I am very
> happy to have Richard to take it over, thanks Richard. Maintain it
> smartly, make sure your users are happy.
> 
> I will be glad to help with architectural/design things. Whenever there
> is a debate, or a need in an educated opinion, I'll be happy to give my
> input.
> </sentiment>
> 
> 
> 

Thanks~!

Another problem. Someone <markus.heininger@online.de> asked:

"UBIFS: Is it possible to get the compressed size of a file?"

I think it's an interesting problem. Actually we used to separate an UBI
device into several volumes for space management reason. So could we
realize the compressed size getting mechanism and import *quota* to UBIFS
itself.

BR,
Hu
