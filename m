Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zf04M-00044u-Fb
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2015 06:31:51 +0000
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
To: =?UTF-8?B?S2FybCBaaGFuZyDlvKDlj4zplKMgKGthcmx6aGFuZyk=?=
 <karlzhang@micron.com>, Andrea Scian <rnd4@dave-tech.it>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20150917152240.757c9e90@bbrezillon>
 <1442503239.19983.18.camel@gmail.com> <20150917174642.0c983136@bbrezillon>
 <55FAEEB1.50401@nod.at> <55FBBA6E.9070203@dave-tech.it>
 <1442562845.19983.43.camel@gmail.com> <55FBDB8F.2040301@dave-tech.it>
 <D067BF0533BDBE4F821CF557AAAE78443B96AA67@NTXXIAMBX01.xacn.micron.com>
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>,
 =?UTF-8?B?UWkgV2FuZyDnjovotbcgKHFpd2FuZyk=?= <qiwang@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "shuangshuo@gmail.com" <shuangshuo@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <560398BA.4040604@nod.at>
Date: Thu, 24 Sep 2015 08:31:22 +0200
MIME-Version: 1.0
In-Reply-To: <D067BF0533BDBE4F821CF557AAAE78443B96AA67@NTXXIAMBX01.xacn.micron.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 24.09.2015 um 03:57 schrieb Karl Zhang ÕÅË«Âà (karlzhang):
> 	We are developing another solution to store VID info into other page's OOB area in its own block, because UBI does not 
> 	use OOB and ECC code always not use all OOB area. 

sorry, I really detest this idea. Not using the OOB area is one of the design principles behind UBI.
We've have learned from JFFS and YAFFS that using OOB is problematic.
I'd give it up only if nothing else is applicable.

Thanks,
//richard
