Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBIlU-0008Qf-Vn
 for linux-mtd@lists.infradead.org; Sun, 27 Jul 2014 07:21:05 +0000
Received: by mail-vc0-f176.google.com with SMTP id id10so9491457vcb.21
 for <linux-mtd@lists.infradead.org>; Sun, 27 Jul 2014 00:20:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53D2EB45.9060302@huawei.com>
References: <CAAK6Zt03J=0=tv5rPvZH0pTZWM8ha5eu0gqFbZ6P_FgSrgwW-A@mail.gmail.com>
 <53D2EB45.9060302@huawei.com>
Date: Sun, 27 Jul 2014 09:20:42 +0200
Message-ID: <CAFLxGvxDFxtBzKutVUAaJyt54WC3R1qzKyko2cKSEyMGd832fA@mail.gmail.com>
Subject: Re: Using UBIFS as an FTL
From: Richard Weinberger <richard.weinberger@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Cc: Daniel Ehrenberg <dehrenberg@google.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 26, 2014 at 1:41 AM, hujianyang <hujianyang@huawei.com> wrote:
> On 2014/7/26 2:21, Daniel Ehrenberg wrote:
>> - loopback-mounting a file on ubifs--From skimming the code, it looks
>> to me like ubifs uses some nice datastructures to handle writes within
>> a file without doing read-modify-writes all the time as ubiblock
>> forces. ubifs authors/maintainers, do you see any downside to using
>> ubifs this way?
>
> This way seems most easily to realize. Synchronize the loop file and
> maybe you will never worry about power cut.
>
> How about using UBI-layer and writing a new block driver to handle
> bio? This driver should care about which leb on the flash has data
> and other thing else(I don't have a clear idea now). The 'leb_change'
> ops in UBI-layer maybe helpful for in-place update and atomic write.
> But This way is harder than using a loop file.

Instead of adding another UBI block layer, please integrate such functionality
in Ezequiel's UBI block.

-- 
Thanks,
//richard
