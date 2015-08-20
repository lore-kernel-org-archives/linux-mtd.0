Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSJfJ-0005ur-8B
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 06:49:33 +0000
Subject: Re: [kernel.org bug 103071] Dead "security.*" xattr code in ubifs
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 =?UTF-8?Q?Andreas_Gr=c3=bcnbacher?= <andreas.gruenbacher@gmail.com>
References: <CAHpGcM+bkFA-UDM0FKwH=FkS9+TWv_Br7nWJXSpKDquo5n_gFw@mail.gmail.com>
 <CAFLxGvxPGZoRX3Ft_g59fzfLhoOmEES=q-oPBmYuGVBzn-dRUA@mail.gmail.com>
 <55D52473.7050209@cn.fujitsu.com>
Cc: snijsure@grid-net.com, Artem Bityutskiy <dedekind1@gmail.com>,
 ben.shelton@ni.com, terry.wilcox@ni.com, mkl@pengutronix.de,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 gratian.crisan@ni.com, brad.mouring@ni.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <55D57864.7060404@nod.at>
Date: Thu, 20 Aug 2015 08:49:08 +0200
MIME-Version: 1.0
In-Reply-To: <55D52473.7050209@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.08.2015 um 02:50 schrieb Dongsheng Yang:
> Hi Richard,
>     Glad to know you are also using fstests for our ubifs. :)
> About this case, I checked it and found it's a bug in fstests.

Yeah, I'm extending my testbed to use xfstests too. :)
I'm sure these tests will uncover some UBIFS issues.

> Because when we are setting USE_ATTR_SECURE=yes, the output
> would be different with what it expected currently.
>     So, I will send a patch out to fix it. And with a quick
> fix, I found ubifs works well in xattr security.

Oh. Good find!

Thanks,
//richard
