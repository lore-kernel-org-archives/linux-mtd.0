Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfOTa-0001AF-3s
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 08:35:31 +0000
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>, Boris Brezillon <boris.brezillon@free-electrons.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CAA8@NTXXIAMBX02.xacn.micron.com>
 <20150925093023.113ceeb1@bbrezillon>
 <A765B125120D1346A63912DDE6D8B6310BF4CBFC@NTXXIAMBX02.xacn.micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 Stefan Roese <sr@denx.de>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "shuangshuo@gmail.com" <shuangshuo@gmail.com>,
 "rnd4@dave-tech.it" <rnd4@dave-tech.it>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 =?UTF-8?B?S2FybCBaaGFuZyDlvKDlj4zplKMgKGthcmx6aGFuZyk=?=
 <karlzhang@micron.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56050734.1000901@nod.at>
Date: Fri, 25 Sep 2015 10:35:00 +0200
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4CBFC@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 25.09.2015 um 10:25 schrieb Bean Huo 霍斌斌 (beanhuo):
> For NAND OOB area, it is dedicated for ECC value, at the same time,
> User available area in OOB is not covered by ECC protection mechanism.
> so saving EC or VID information in OOB is not a perfect solution.
> But if there is additional space, and this space can be covered by ECC,
> We can try it.

As I said, I'm *really* against using OOB and see it as the absolutely last choice.

> By the way, I want to allocate a new internal volume to solve paired pages issue.
> How do you think about this ?

More details please. :)
Adding a new internal volume to UBI is not a big deal.

Thanks,
//richard
