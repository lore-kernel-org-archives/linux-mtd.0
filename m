Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgrDR-0007Tn-EJ
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 09:28:55 +0000
Subject: Re: [PATCH 0/9] drivers:mtd:UBI: add bakvol module for MLC NAND
 paired page issue
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "baruch@tkos.co.il" <baruch@tkos.co.il>,
 "asierra@xes-inc.com" <asierra@xes-inc.com>,
 "guz.fnst@cn.fujitsu.com" <guz.fnst@cn.fujitsu.com>,
 "gsi@denx.de" <gsi@denx.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CEC3@NTXXIAMBX02.xacn.micron.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?RnJhbmsgTGl1IOWImOe+pCAoZnJhbmtsaXUp?= <frankliu@micron.com>,
 Andrea Scian <rnd4@dave-tech.it>,
 =?UTF-8?B?UGV0ZXIgUGFuIOa9mOafj+WujyAocGV0ZXJwYW4p?= <peterpan@micron.com>,
 =?UTF-8?B?S2FybCBaaGFuZyDlvKDlj4zplKMgKGthcmx6aGFuZyk=?=
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <560A59B8.4000701@nod.at>
Date: Tue, 29 Sep 2015 11:28:24 +0200
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4CEC3@NTXXIAMBX02.xacn.micron.com>
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

Am 28.09.2015 um 09:02 schrieb Bean Huo »ô±ó±ó (beanhuo):
> Hello,
> 
> This series aims at adding a bakvol module for MLC NAND paired page
> Power loss protection.
> MLC NAND paired page power loss is a known issue so far, MLC NAND pages are
> coupled in a sense that if you cut power while writing to a page, you corrupt not only
> this page, but also one of the previous pages which is paired with the current one.
> Currently, there is no a perfect solution for this. 
> This paired page solution is based on NAND multiple plane program feature. For this
> Patch, only used dual plane page program, means two different plane pages can
> Be programmed together at the same time.
> Dual plane page program only implements in backup operation. Only lower page data
> Be duplicated and back up into a internal log volume by dual plane program method.
> 
> This patch has been testing on Micron 70s/80s/90s MLC NAND.
> Of course there are some places needed to be improved and simplified.
> 
> Any suggestion and comments welcomed.

As stated before, using OOB in UBI is not going to happen unless
proven that there is absolutely no other way to solve the paired pages
problem.

Nacked-by: Richard Weinberger <richard@nod.at>

Sorry,
//richard
