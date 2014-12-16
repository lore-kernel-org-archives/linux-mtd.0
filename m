Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0pZ0-0004yB-G2
 for linux-mtd@lists.infradead.org; Tue, 16 Dec 2014 10:41:11 +0000
Message-ID: <54900AB1.30005@huawei.com>
Date: Tue, 16 Dec 2014 18:34:25 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] UBI: add ubi_err() to report the failure of leb read
References: <548FE51D.60707@huawei.com> <548FE72D.5040803@huawei.com>
 <548FF98E.5000503@nod.at> <549000C1.4090709@huawei.com>
 <549001FC.10008@nod.at>
In-Reply-To: <549001FC.10008@nod.at>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/12/16 17:57, Richard Weinberger wrote:
> Then every single embedded vendor will use this flag to keep the broken MTD/UBI/UBIFS setups running
> as long as possible no mater of how corrupted the data is. :-)
> IIRC UBIFS will either mount and work correctly as expected or fail hard.

You are right~!

Maybe we can set filesystem to RO if it is mounted with --force, and
allow users to copy their data to other place.

How about this?

> 
>>> You can dump the raw data and inspect the corrupted data.
>>> Maybe you can fix it by hand.
>>
>> Yes, I want a try~! If we have to introduce a new feature or new mount
>> option. So would you like to help me? Do you think it's a valuable
>> work?
> 
> I'm not a fan of such a mount option.
> What we really need is a fsck.ubifs and a ubifs dump tool to fix and recover
> broken UBIFS images.

I think it's better, but a bit harder. As I know, my UBIDUMP is far
from what you expect. I should spend more time on it.

After all, I was asked to fix this error. My plan is do something
after an ECC error is detected, not directly breakout to allow
this partition to be mounted. I don't think this solution will be
easily accept by mainline.

However, I'd like to show my work if I succeed.

Thanks~!

Hu
