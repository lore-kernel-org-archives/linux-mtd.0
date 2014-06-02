Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrT16-0006G8-Ky
 for linux-mtd@lists.infradead.org; Mon, 02 Jun 2014 14:15:13 +0000
Message-ID: <cb750eb1ee14601083033617f5ade99e.squirrel@www.codeaurora.org>
In-Reply-To: <1401697826.11182.119.camel@sauron.fi.intel.com>
References: <53894EF4.5030607@huawei.com>
 <1401697826.11182.119.camel@sauron.fi.intel.com>
Date: Mon, 2 Jun 2014 14:14:51 -0000
Subject: Re: [PATCH] UBIFS: Remove incorrect assertion in shrink_tnc()
From: "Dolev Raviv" <draviv@codeaurora.org>
To: dedekind1@gmail.com
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: Dolev Raviv <draviv@codeaurora.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Sat, 2014-05-31 at 11:39 +0800, hujianyang wrote:
>> I hit the same assert failed as Dolev Raviv reported in Kernel v3.10
>> shows like this:
>
> ...
>
>> Signed-off-by: hujianyang <hujianyang@huawei.com>
>
> hujianyang,
>
> looks like you got it right, thanks for your excellent analysis.
>
> I think we want to include this patch to the stable tree, so I add
>
> Cc: stable@vger.kernel.org
>
> I've pushed it to the master branch of the UBIFS tree, thanks!
>
> Also, having a
>
> Tested-by: Dolev Raviv <draviv@codeaurora.org>
>
I'm actually testing it as we speak :)

> if possible, would increase our confidence in sending this patch to the
> stable tree.
>
> Thank you!
>
> --
> Best Regards,
> Artem Bityutskiy
>
>


-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
