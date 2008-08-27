Received: from elasmtp-kukur.atl.sa.earthlink.net ([209.86.89.65])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KYFcS-0005Im-DD
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 07:39:08 +0000
Message-Id: <E38B9DE5-5BE3-4400-B5FC-F75D9A6BBDAA@earthlink.net>
From: Bruce Leonard <brucle@earthlink.net>
To: dedekind@infradead.org
In-Reply-To: <1219814980.18027.123.camel@sauron>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v926)
Subject: Re: [PATCH 1/2] Clean up of code found when adding support for > 2GiB
	MTD devices
Date: Wed, 27 Aug 2008 00:39:04 -0700
References: <48AB3AAC.7030900@earthlink.net>
	<1219814980.18027.123.camel@sauron>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

On Aug 26, 2008, at 10:29 PM, Artem Bityutskiy wrote:

> Hi,
>
> On Tue, 2008-08-19 at 14:27 -0700, Bruce Leonard wrote:
>> These are just some code cleanups that I found while working on the  
>> MTD sub-system.
>> From: brucle <brucle@selinc.com>
>> Date: Wed, 13 Aug 2008 17:16:48 -0700
>> Subject: [PATCH] Code clean up preping for support of > 2GiB MTD  
>> devices
>>
>> Signed-off-by: Bruce D. Leonard <brucle@selinc.com>
>
> For this clean-up patch,
>
> Acked-by: Artem Bityutskiy <dedekind@infradead.org>
>
> However, are you shure it is against the mtd-2.6.git tree?

This patch set is against the mainline, 2.6.27-rc3.  At the time I  
posted the patch I was only a day or two out from pulling the latest  
from Linus' tree.  It's now a couple of weeks out of date I think.

Bruce
