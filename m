Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aApXh-0007l7-Mw
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 01:45:43 +0000
Message-ID: <56775906.2040506@huawei.com>
Date: Mon, 21 Dec 2015 09:42:30 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>, Adam <aps337@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Corrupt Empty Space Error at Runtime
References: <CAHW51sUEt+3mxWE-pLdLvk_xmfuPdjSKTnGi2pBzbEK7CoUFRw@mail.gmail.com>
 <CAFLxGvzNPJQsae-JW_5KabJyDCh2aRKOC3mCWeH5JAboji1gCA@mail.gmail.com>
In-Reply-To: <CAFLxGvzNPJQsae-JW_5KabJyDCh2aRKOC3mCWeH5JAboji1gCA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 12/19/2015 5:49 AM, Richard Weinberger wrote:
> On Fri, Dec 18, 2015 at 5:38 PM, Adam <aps337@gmail.com> wrote:
>> Hello All,
>>
>> I am working on a at91sama5d3x based system running linux 3.18.9. I
>> have been seeing an issue where during normal operation, I see the
>> following....
>>
[...]
>>    <snip>
>>
>>
>> In looking at source, appears that the failure scanning that LEB,
>> causes the filesystem to be changed to read only mode. Based on the
>> source, it also looks like I am losing a couple important debug error
>> messages due to issue with our logging infrastructure (unfortunately
>> serial console was not attached when failure occurred), but I think
>> that we're encountering a 'corrupt empty space' condition. Does this
>> seem right?
> 
> Can be. But to be sure we need full logs.
> 
>> In doing some research (mostly on archives of this mailing list), I
>> believe that LEB 846 is an empty space block and that there has been a
>> bit flip in it. Based on previous posts here and looking at atmel_nand
>> driver, it looks like the atmel_nand driver (and underlying hardware)
>> do not support ECC correction of bit flips in empty blocks and UBIFS
>> doesn't currently have a way to deal with this.
>>
>> I see that some folks reported that they just hacked the ubifs_scan
>> routine to not consider it corruption if the corrupt block was an
>> empty block to workaround this issue. What is the disadvantage to
>> doing this? It seems sort of harmless to have errors in empty blocks..
>> no?
>>
>> What are other options? People must have ways of working around this.
> 
> UBIFS assumes that reading from empty space works.
> It uses this for example at mount time to detect unclean mounts.
> e.g. power-cut while erasing or writing.

We have met several empty space corruptions these days, since the ECC
functionality of the NAND controller driver seems not work correctly.
But we are still considering if there is any workaroud to let UBIFS
check if the corruption occurs really in empty space. If it is, UBIFS
should recover the LEB.

There are 2 conditions we may check:
1. the left space size is less than the min size of a node, it must be
   empty space;
2. how many bits are fliped in left space, if they are less than 4 bits
   (many NAND support 1~4 bits ECC), it should be in empty space;

thanks,
Sheng
> 
> Sadly some NAND flash controller's ECC functions do not work on empty
> space. i.e. CRC(0xff) is not 0xff.
> 
> It is still undecided whether this should be addressed in MTD core or within
> the individual NAND drivers.
> 
