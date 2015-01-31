Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHWz0-0008V1-RL
 for linux-mtd@lists.infradead.org; Sat, 31 Jan 2015 12:17:03 +0000
Message-ID: <1422706597.8637.311.camel@sauron.fi.intel.com>
Subject: Re: [PATCH resend] UBIFS: return -EINVAL if first log leb is empty
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>, Richard Weinberger <richard@nod.at>
Date: Sat, 31 Jan 2015 14:16:37 +0200
In-Reply-To: <54CCAFB4.3060705@huawei.com>
References: <54CC4F77.1000801@huawei.com>
 <1422697906.8637.295.camel@sauron.fi.intel.com>
 <54CCAFB4.3060705@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2015-01-31 at 18:34 +0800, hujianyang wrote:
> Artem, Thanks for your reviewing. Could I add a Reviewed-by after resending
> a v2 patch?

Well, I do want to help you to have things done quicker by letting you
adding the Reviewed-by tag already in v2. But the protocol is the
protocol, the Reviewed-by tag is usually something the reviewer replies
with when he sees the final version of the patch.

Besides, I am still the one who merges UBIFS stuff. I am letting Richard
to be the UBI master so far, since this is the area he demonstrated the
excellence at, not UBIFS.

UBIFS and UBI are very different, just like MTD and UBI. Knowing one of
them well does not make you automatically fluent in the other.

So the layout I proposed Richard was:

1. Richard owns UBI, I most probably will slowly shade away from that
area.
2. Richard owns mtd-utils
3. I still own UBIFS, but will be ready to hand it over to the next
brave one.

<sentiment>
UBI is my baby, it is my first serious piece of work I've done. Working
with smart people from Linutronix, for IBM was fantastic!

But UBI is "grown up" and it is time for me to move forward. I am very
happy to have Richard to take it over, thanks Richard. Maintain it
smartly, make sure your users are happy.

I will be glad to help with architectural/design things. Whenever there
is a debate, or a need in an educated opinion, I'll be happy to give my
input.
</sentiment>
