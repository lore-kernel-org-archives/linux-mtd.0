Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYsuO-0000RK-RQ
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2015 09:08:02 +0000
Message-ID: <550BE355.8020009@nod.at>
Date: Fri, 20 Mar 2015 10:07:33 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>, =?UTF-8?B?IlFpIA==?=
 =?UTF-8?B?V2FuZyDnjovotbcgKHFpd2FuZyki?= <qiwang@micron.com>
Subject: Re: detect and manage power cut on MLC NAND
References: <mailman.37706.1426822709.22890.linux-mtd@lists.infradead.org>	<71CF8D7F32C5C24C9CD1D0E02D52498A7717444D@NTXXIAMBX02.xacn.micron.com>	<EACD232272DA4849B060F0828564D13B57804E26B6@ntcex01.corp.netcomm.com.au>	<71CF8D7F32C5C24C9CD1D0E02D52498A771744B0@NTXXIAMBX02.xacn.micron.com>
 <20150320095822.7e1979ff@bbrezillon>
In-Reply-To: <20150320095822.7e1979ff@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "rnd4@dave-tech.it" <rnd4@dave-tech.it>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?IkZyYW5rIExpdSDliJjnvqQgKGZyYW5rbGl1KSI=?= <frankliu@micron.com>,
 "andrea.marson@dave.eu" <andrea.marson@dave.eu>,
 =?UTF-8?B?IkJlYW4gSHVvIOmcjeaWjOaWjCAoYmVhbmh1byki?= <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.03.2015 um 09:58 schrieb Boris Brezillon:
> Hi Qi,
> 
> On Fri, 20 Mar 2015 07:44:58 +0000
> Qi Wang 王起 (qiwang) <qiwang@micron.com> wrote:
> 
>>>
>>> I seem to remember a requirement to write pages to a block in a
>>> monotonic fashion (low to high). Is that still the case? It
>>> seems that the low page backup could violate that rule otherwise.
>>
>> Yes, pages need to be programmed from low to high. But it is possible
>> to skip some pages. Take a example,
>>
>> below page program ordering is ok.
>> Page 0, page 1, page 2, page 4, page 6, page 10, page 15, etc..
>> Just make sure don't turn back to program the low page is ok.
> 
> I asked a question regarding the programming sequence in answer to Iwo,
> but I'm not sure you were in Cc, so I'm asking it again.
> 
> Say page 1 is paired with page 4, can we program pages in this order:
> 1, 4, 2, 5, 3, 6, ..., so that both paired pages are programmed
> together (the Jumbo page approach Iwo described in his mail).

That's a good question. I was always told that you're not allowed
to program pages in a non-linear manner.

Thanks,
//richard
