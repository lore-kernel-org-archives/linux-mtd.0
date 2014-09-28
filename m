Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XY3ld-0000ge-92
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 01:59:18 +0000
Message-ID: <54276B39.6000603@huawei.com>
Date: Sun, 28 Sep 2014 09:58:17 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] UBIFS: Align the dump messages of SB_NODE
References: <541D24CF.1040705@huawei.com>
 <1411727765.23429.61.camel@sauron.fi.intel.com>
In-Reply-To: <1411727765.23429.61.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
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

On 2014/9/26 18:36, Artem Bityutskiy wrote:
> On Sat, 2014-09-20 at 14:55 +0800, hujianyang wrote:
>> I found the dump messages of UBIFS_SB_NODE is not aligned. This
>> patch remove the extra space from the line which is retracted.
>>
>>
>> Signed-off-by: hujianyang <hujianyang@huawei.com>
> 
> This was not a typo, this was intentional. We first print the all flags
> in a hex format, and then we "decode" it and print the values of the
> individual flags with an additional indent. The indent is to make it
> clear that these line belong to the flags, and they are not independent
> values.
> 

Oh, thanks for your explanation~!


Hu
