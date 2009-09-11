Received: from antispam01.maxim-ic.com ([205.153.101.182])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mm551-0001ld-5k
	for linux-mtd@lists.infradead.org; Fri, 11 Sep 2009 12:18:23 +0000
Message-ID: <4AAA4005.9080707@maxim-ic.com>
Date: Fri, 11 Sep 2009 17:48:13 +0530
From: JerinJacob <jerin.jacob@maxim-ic.com>
MIME-Version: 1.0
To: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
Subject: Re: UBIFS Error
References: <4AA5F37F.4050307@maxim-ic.com> <4AA60E6C.6060307@nokia.com>
	<4AA8EA9C.4070805@maxim-ic.com> <4AA8ED7B.5020509@nokia.com>
	<4AA8F6E4.1090209@maxim-ic.com> <4AA90351.3050000@nokia.com>
In-Reply-To: <4AA90351.3050000@nokia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On 09/10/2009 03:53 PM, ext JerinJacob wrote:
>   
>> Hi Artem,
>>
>> Thanks for the support.
>> We are using 2.6.30.
>>     
>
> And finally, could you please try to reproduce this problem with
> nandsim:
> http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_nandsim
>   
 >>> Unfortunately, I couldn't reproduce the problem with nandsim.It 
works with nansim.
However i couldn't test with 1GiB nandsim as it needs 1GiB ram.Tested 
with 512MiB nandsim.

I guess it is a could be data corruption either in platform  specific 
driver or ubifs.
Is there any way we can validate the platform specific nand driver ?
Please let me know your views on this?

Actually we are in the process of migrating from yaffs to ubifs, The 
same test application works  with
yaffs as well.
