Received: from [119.145.14.65] (helo=szxga02-in.huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAp8v-00081H-AY
 for linux-mtd@lists.infradead.org; Fri, 25 Jul 2014 23:43:18 +0000
Message-ID: <53D2EB45.9060302@huawei.com>
Date: Sat, 26 Jul 2014 07:41:57 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Daniel Ehrenberg <dehrenberg@google.com>
Subject: Re: Using UBIFS as an FTL
References: <CAAK6Zt03J=0=tv5rPvZH0pTZWM8ha5eu0gqFbZ6P_FgSrgwW-A@mail.gmail.com>
In-Reply-To: <CAAK6Zt03J=0=tv5rPvZH0pTZWM8ha5eu0gqFbZ6P_FgSrgwW-A@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: artem.bityutskiy@linux.intel.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/7/26 2:21, Daniel Ehrenberg wrote:
> - loopback-mounting a file on ubifs--From skimming the code, it looks
> to me like ubifs uses some nice datastructures to handle writes within
> a file without doing read-modify-writes all the time as ubiblock
> forces. ubifs authors/maintainers, do you see any downside to using
> ubifs this way?

This way seems most easily to realize. Synchronize the loop file and
maybe you will never worry about power cut.

How about using UBI-layer and writing a new block driver to handle
bio? This driver should care about which leb on the flash has data
and other thing else(I don't have a clear idea now). The 'leb_change'
ops in UBI-layer maybe helpful for in-place update and atomic write.
But This way is harder than using a loop file.
