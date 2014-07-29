Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XC3VD-0007Ni-D6
 for linux-mtd@lists.infradead.org; Tue, 29 Jul 2014 09:15:24 +0000
Message-ID: <1406625280.23376.102.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 6/7] New utility ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Tue, 29 Jul 2014 12:14:40 +0300
In-Reply-To: <53CE1D97.6010609@huawei.com>
References: <53BA491E.8060502@huawei.com> <53BA4B98.1080000@huawei.com>
 <1405497907.1920.27.camel@sauron.fi.intel.com>
 <53C63DA2.5080200@huawei.com>
 <1405507040.1906.18.camel@sauron.fi.intel.com>
 <53C6618F.3010707@huawei.com> <874myan0no.fsf@nbsps.com>
 <53CE1D97.6010609@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-07-22 at 16:15 +0800, hujianyang wrote:
> I've read your code.  This code shows me a better way to get EC header
> and VID header than my 'ioctl' design. Thanks~!
> 
> I think my former work started in a wrong way. Using MTD functionality
> as yours seems better to develop a new utility we want.
> 
> So in the next step, I would like to resend a new patch set which just
> read fs data by mtd_read(). I think a new ioctl is needed to translate
> specified eraseblock num from lnum to pnum. I will not care about volume
> table or fastmap this time. This patch set will not support dumping
> image file(something like -f) either. As Artem said, we should do this
> step by step.
> 
> Thanks for your advice. I will resend this utility soon and Cc to you.

If possible, please, try to implement few things at a time. Try to make
your initial submission smaller, and then add more stuff on top. This
way it is going to be easier to merge the work. Thanks!

-- 
Best Regards,
Artem Bityutskiy
