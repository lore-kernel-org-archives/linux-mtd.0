Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhxaH-0000iD-Jn
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2015 10:29:03 +0000
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
 <560B8758.7010002@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?RnJhbmsgTGl1IOWImOe+pCAoZnJhbmtsaXUp?= <frankliu@micron.com>,
 Andrea Scian <rnd4@dave-tech.it>,
 =?UTF-8?B?S2FybCBaaGFuZyDlvKDlj4zplKMgKGthcmx6aGFuZyk=?=
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <560E5C51.5000900@nod.at>
Date: Fri, 2 Oct 2015 12:28:33 +0200
MIME-Version: 1.0
In-Reply-To: <560B8758.7010002@nod.at>
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

Am 30.09.2015 um 08:55 schrieb Richard Weinberger:
>> By the way, Do you review my patches series ? I don't backup duplicated data in OOB .
>> Can you specify which sector codes ? so that I can explain it in detail.
> 
> Okay. Maybe both Boris and I misread your code, can you please explain in detail
> what functions like check_original_data() or mtd_write_dual_plane_oob() do?

Care to explain?
Maybe we can find a solution without OOB.
Boris proposed already some very promising ideas:
http://comments.gmane.org/gmane.linux.drivers.mtd/61658

BTW: Will you be at Embedded Linuxcon Europe in Dublin?
Many MTD guys, including me, will be there.
Maybe we can discuss the problem in a nice pub, first round is on me. :-)

Thanks,
//richard
