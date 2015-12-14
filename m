Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8XQQ-0006we-Hi
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2015 18:00:43 +0000
Subject: Re: [PATCH 1/1] fs:ubifs:recovery:fixup UBIFS cannot recover master
 node issue
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Brian Norris <computersforpeace@gmail.com>
References: <A765B125120D1346A63912DDE6D8B6310BF53F90@NTXXIAMBX02.xacn.micron.com>
 <566A9378.4070900@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF54200@NTXXIAMBX02.xacn.micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <566F03AC.90305@nod.at>
Date: Mon, 14 Dec 2015 19:00:12 +0100
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF54200@NTXXIAMBX02.xacn.micron.com>
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

Am 14.12.2015 um 04:55 schrieb Bean Huo »ô±ó±ó (beanhuo):
> Dear Richard
> 
>> Bean,
>>
>> Am 11.12.2015 um 09:26 schrieb Bean Huo »ô±ó±ó (beanhuo):
>>> For MLC NAND, paired page issue is now a common known issue.
>>> This patch is just for master node cannot be recovered while there
>>> will two pages be damaged in one single master node block.
>>> As for this patch, if there are more than one page data in master node
>>> block being damaged, and as long as exist one uncorrupted master node
>>> block, master node will be recovered.
>>
>> So, this patch is part if a larger patch series to make UBIFS MLC aware?
> 
> No, this is not one part of my path series, just a single and dedicated to 
> Master node.

[...]

> Currently, we get more feedbacks from our customers who are using MLC NAND,
> They more like UBIFS more reliable, Even can tolerate to discard some user
> Data after next power on. Means that they don't want to UBIFS mount failed just
> Because of power loss, If to discard the data for the stability of the system, they
> prefer to choose the latter.

MLC is currently simply not supported. If your hardware does not have a mechanism
do temper power-loss the paired page issue will damage UBI and UBIFS.
Please correct me if I'm wrong but this patch just papers over one symptom of that.

> For UBIFS master node on MLC NAND, I often found that one of master node block is OK,
> But because of second master node block exist two pages damaged data, recovery always 
> Fails. Not matter SLC or MLC, as long as there is a good master node, recovery must be 
> Successful.

This needs a much more detailed explanation.
In which scenarios on SLC NAND can you get such an unmountable UBIFS?
Maybe UBIFS is too strict and NAND behaves differently than UBIFS expects
but we need to understand it in depth.

Thanks,
//richard
