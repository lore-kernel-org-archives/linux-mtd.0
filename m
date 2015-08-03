Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZM7y6-00053r-74
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 05:07:22 +0000
Message-ID: <55BEF5A2.6090606@cn.fujitsu.com>
Date: Mon, 3 Aug 2015 13:01:22 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Dave Chinner <david@fromorbit.com>
CC: <eguan@redhat.com>, <fstests@vger.kernel.org>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/5] xfstest: generic/219 add _require_odirect
References: <1438236417-24612-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438236417-24612-3-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20150803035909.GP3902@dastard>
In-Reply-To: <20150803035909.GP3902@dastard>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/03/2015 11:59 AM, Dave Chinner wrote:
> On Thu, Jul 30, 2015 at 02:06:54PM +0800, Dongsheng Yang wrote:
>> generic/219 is testing quota in three use cases including
>> Direct I/O. So we have to add a dependence to odirect in
>> this test.
>
> Hmmm - you've modified on only 2 tests here in this patch series
> that use direct IO. There are many more - just looking for direct IO
> comments, these generic tests use direct IO in some way, and there
> are others that such usage is not obvious (e.g. this patch to
> generic/219):
>
> generic/091
> generic/113
> generic/130
> generic/214
> generic/224
> generic/263
> shared/272
>
> And all the aio/dio tests:
>
> generic/036
> generic/198
> generic/207
> generic/208
> generic/209
> generic/210
> generic/211
> generic/212
> generic/239
> generic/240
> generic/323
>
> And there are others that run fio that uses DIO, too, like
>
> generic/299
> generic/300
>
> And so on. I haven't even looked at all the fsx tests that might
> use DIO, and I know that some of them are not listed above...
>
> On the whole, I think ubifs would be better to implement DIO via
> buffered fallback that to make us have to annotate every test that
> uses DIO in some way...

Fair point. Yes, It's difficult to find out all the tests which would 
use DIO.

And we are discussing about dio in ubifs.

So if you are strongly rejecting this kind of change, I will drop
this patch in my next version.

Thanx
Yang
>
> Cheers,
>
> Dave.
>
