Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhBIv-0006xL-9l
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 06:55:54 +0000
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
 <560A59B8.4000701@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF4D4C6@NTXXIAMBX02.xacn.micron.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?RnJhbmsgTGl1IOWImOe+pCAoZnJhbmtsaXUp?= <frankliu@micron.com>,
 Andrea Scian <rnd4@dave-tech.it>,
 =?UTF-8?B?S2FybCBaaGFuZyDlvKDlj4zplKMgKGthcmx6aGFuZyk=?=
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <560B8758.7010002@nod.at>
Date: Wed, 30 Sep 2015 08:55:20 +0200
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4D4C6@NTXXIAMBX02.xacn.micron.com>
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

Bean,

Am 30.09.2015 um 07:31 schrieb Bean Huo »ô±ó±ó (beanhuo):
>> As stated before, using OOB in UBI is not going to happen unless proven that
>> there is absolutely no other way to solve the paired pages problem.
>>
>> Nacked-by: Richard Weinberger <richard@nod.at>
>>
>> Sorry,
>> //Richard
> 
> Hi, Richard
> Thanks for your concern. I am a new patch submitter.
> Can you tell me Nacked-by means?

I basically means that I'm (as maintainer) really unhappy with this patches
and don't see a way to get them merged as the whole concept is not acceptable.

> By the way, Do you review my patches series ? I don't backup duplicated data in OOB .
> Can you specify which sector codes ? so that I can explain it in detail.

Okay. Maybe both Boris and I misread your code, can you please explain in detail
what functions like check_original_data() or mtd_write_dual_plane_oob() do?

Thanks,
//richard
