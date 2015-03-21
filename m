Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZLv7-0002X8-Gb
 for linux-mtd@lists.infradead.org; Sat, 21 Mar 2015 16:06:42 +0000
Message-ID: <550D96F2.8020606@nod.at>
Date: Sat, 21 Mar 2015 17:06:10 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: =?UTF-8?B?IlFpIFdhbmcg546L6LW3IChxaXdhbmcpIg==?= <qiwang@micron.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: detect and manage power cut on MLC NAND
References: <mailman.37706.1426822709.22890.linux-mtd@lists.infradead.org>	<71CF8D7F32C5C24C9CD1D0E02D52498A7717444D@NTXXIAMBX02.xacn.micron.com>	<EACD232272DA4849B060F0828564D13B57804E26B6@ntcex01.corp.netcomm.com.au>	<71CF8D7F32C5C24C9CD1D0E02D52498A771744B0@NTXXIAMBX02.xacn.micron.com>	<20150320095822.7e1979ff@bbrezillon>	<550BE355.8020009@nod.at>	<71CF8D7F32C5C24C9CD1D0E02D52498A7717470C@NTXXIAMBX02.xacn.micron.com>
 <20150320161903.608a79fc@bbrezillon>
 <0D23F1ECC880A74392D56535BCADD7354973F4B5@NTXBOIMBX03.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7717482E@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A7717482E@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "rnd4@dave-tech.it" <rnd4@dave-tech.it>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?IkZyYW5rIExpdSDliJjnvqQgKGZyYW5rbGl1KSI=?= <frankliu@micron.com>,
 "andrea.marson@dave.eu" <andrea.marson@dave.eu>,
 =?UTF-8?B?IkJlYW4gSHVvIA==?= =?UTF-8?B?6ZyN5paM5paMIChiZWFuaHVvKSI=?=
 <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.03.2015 um 02:48 schrieb Qi Wang 王起 (qiwang):
> For this method, my idea is we can consider page 1 and page4 as one 
> page, to program page 1 and page 4 together. So if power cut occur, 
> both page 1 and page 4 (But one page corruption in software view)will 
> corrupt at same time, won't have issue for UBI/UBIFS.

I think we could add a new mtd driver which merges paired pages into bigger
pages. We already have "funky" mtd drivers like mtd_concat. What about a mtd_unpair?
This mtd driver could also do the scrambling.

Boris, what do you think?

Thanks,
//richard
