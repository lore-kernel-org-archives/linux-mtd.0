Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9VGT-0005bg-Uq
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 08:17:39 +0000
Message-ID: <53CE1D97.6010609@huawei.com>
Date: Tue, 22 Jul 2014 16:15:19 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: [PATCH 6/7] New utility ubidump
References: <53BA491E.8060502@huawei.com> <53BA4B98.1080000@huawei.com>
 <1405497907.1920.27.camel@sauron.fi.intel.com> <53C63DA2.5080200@huawei.com>
 <1405507040.1906.18.camel@sauron.fi.intel.com> <53C6618F.3010707@huawei.com>
 <874myan0no.fsf@nbsps.com>
In-Reply-To: <874myan0no.fsf@nbsps.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> I started some thing like this.  The source is attached.  As really you
> only want 'read only' access, there is a minimal portion of the
> UBI/UbiFs code that is needed.  I think that only the 'ubi-media.h' is
> needed.  The Linux is high performance and handles read/write with
> different fault conditions.
> 
> If you write code for read-only/single thread I think it will be much
> more simple than the active UBI/UbiFS code in the Linux kernel.  I did
> not look at the UbiFS layer as much.  It is far more complex that UBI
> imho; of course, I just saw a little of the internal volumes and the
> fast map features.  However, fast map itself should not be needed for
> this utility.
> 
> For your use case of analysis in a running system, I think that reads of
> '/dev/mtd0ro', etc can be used.  This way recovery features can also be
> developed if we identified some inconsistency; Ie, it is not required to
> 'mount' the volume before analysis.
> 
> The attached source just scans an file image and create an leb/peb
> mapping.  I only used the 'ubi-media.h' as documentation.
> 
> Fwiw,
> Bill Pringlemeir.
>

Hi Bill,

I've read your code.  This code shows me a better way to get EC header
and VID header than my 'ioctl' design. Thanks~!

I think my former work started in a wrong way. Using MTD functionality
as yours seems better to develop a new utility we want.

So in the next step, I would like to resend a new patch set which just
read fs data by mtd_read(). I think a new ioctl is needed to translate
specified eraseblock num from lnum to pnum. I will not care about volume
table or fastmap this time. This patch set will not support dumping
image file(something like -f) either. As Artem said, we should do this
step by step.

Thanks for your advice. I will resend this utility soon and Cc to you.


Hu
