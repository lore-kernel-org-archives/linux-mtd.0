Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmgOy-0006P1-TZ
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 10:04:21 +0000
Message-ID: <545C98DE.3020706@huawei.com>
Date: Fri, 7 Nov 2014 18:03:10 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: Report: mtd-utils: "Floating point exception" with ubiformat
References: <5453663A.8080608@huawei.com>
 <1415353395.958.300.camel@sauron.fi.intel.com>
In-Reply-To: <1415353395.958.300.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/11/7 17:43, Artem Bityutskiy wrote:
> On Fri, 2014-10-31 at 18:36 +0800, hujianyang wrote:
>> Do you think it is a valuable problem to deal with? Keep the
>> existing logic is OK. But can we add something in mtd-utils
>> to indicate this error than "Floating point exception"?
> 
> I think a work-around in mtd-utils is needed for sure. Because even if
> we change the kernel, the change will only affect new kernels.
> 
> And I think changing the kernel is worthwhile too. It is extremely
> unlikely, in my opinion, that someone relies on this illogical behavior
> which happens only for zero-size partitions.  May be we can also
> disallow zero-size partitions?
> 
> Artem.
> 
> 
> 

I'm agree with you.

I found another strange thing, also caused by the wrong partition
table.

In my board there is only one 512M nand flash. But the partition
table in nand driver is used for a board with 2G(4*512M) nand flash.

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 20000000 00020000 "ubi0"
mtd1: 00000000 00000000 "ubi1"
mtd2: 20000000 00020000 "rest"


The /proc/mtd shows there are two 512M nand flash but actually
they share the same device.

If I format mtdblock0 as jffs2 and then, I can mount a jffs2 file
system from mtdblock2. Very interesting~!

Hu
