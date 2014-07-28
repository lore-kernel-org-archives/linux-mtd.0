Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBb1m-0003IU-Un
 for linux-mtd@lists.infradead.org; Mon, 28 Jul 2014 02:51:08 +0000
Message-ID: <53D5BA52.7060108@huawei.com>
Date: Mon, 28 Jul 2014 10:49:54 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Using UBIFS as an FTL
References: <CAAK6Zt03J=0=tv5rPvZH0pTZWM8ha5eu0gqFbZ6P_FgSrgwW-A@mail.gmail.com>
 <53D2EB45.9060302@huawei.com>
 <CAFLxGvxDFxtBzKutVUAaJyt54WC3R1qzKyko2cKSEyMGd832fA@mail.gmail.com>
In-Reply-To: <CAFLxGvxDFxtBzKutVUAaJyt54WC3R1qzKyko2cKSEyMGd832fA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Daniel Ehrenberg <dehrenberg@google.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 ezequiel.garcia@free-electrons.com, artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/7/27 15:20, Richard Weinberger wrote:
> On Sat, Jul 26, 2014 at 1:41 AM, hujianyang <hujianyang@huawei.com> wrote:
>> On 2014/7/26 2:21, Daniel Ehrenberg wrote:
>>> - loopback-mounting a file on ubifs--From skimming the code, it looks
>>> to me like ubifs uses some nice datastructures to handle writes within
>>> a file without doing read-modify-writes all the time as ubiblock
>>> forces. ubifs authors/maintainers, do you see any downside to using
>>> ubifs this way?
>>
>> This way seems most easily to realize. Synchronize the loop file and
>> maybe you will never worry about power cut.
>>
>> How about using UBI-layer and writing a new block driver to handle
>> bio? This driver should care about which leb on the flash has data
>> and other thing else(I don't have a clear idea now). The 'leb_change'
>> ops in UBI-layer maybe helpful for in-place update and atomic write.
>> But This way is harder than using a loop file.
> 
> Instead of adding another UBI block layer, please integrate such functionality
> in Ezequiel's UBI block.
> 

Oh, sorry~! I didn't know his work before. I should have done some
more researches.

Did you mean MTD_UBI_BLOCK? It seems a read-only interface. What's
your plan on it?

Add cc: Ezequiel Garcia

Richard, Thank you very much~!
