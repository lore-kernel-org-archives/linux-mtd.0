Received: from antispam02.maxim-ic.com ([205.153.101.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MnD9h-0004HM-66
	for linux-mtd@lists.infradead.org; Mon, 14 Sep 2009 15:07:53 +0000
Message-ID: <4AAE5C3C.5060809@maxim-ic.com>
Date: Mon, 14 Sep 2009 20:37:40 +0530
From: JerinJacob <jerin.jacob@maxim-ic.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: UBIFS Error
References: <4AA5F37F.4050307@maxim-ic.com> <4AA60E6C.6060307@nokia.com>	
	<4AA8EA9C.4070805@maxim-ic.com> <4AA8ED7B.5020509@nokia.com>	
	<4AA8F6E4.1090209@maxim-ic.com> <4AA90351.3050000@nokia.com>	
	<4AAA4005.9080707@maxim-ic.com>
	<1252938440.5060.102.camel@localhost>
In-Reply-To: <1252938440.5060.102.camel@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Hunter
	Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Artem Bityutskiy wrote:
>>> And finally, could you please try to reproduce this problem with
>>> nandsim:
>>> http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_nandsim
>>>   
>>>       
>>  >>> Unfortunately, I couldn't reproduce the problem with nandsim.It 
>> works with nansim.
>> However i couldn't test with 1GiB nandsim as it needs 1GiB ram.Tested 
>> with 512MiB nandsim.
>>
>> I guess it is a could be data corruption either in platform  specific 
>> driver or ubifs.
>> Is there any way we can validate the platform specific nand driver ?
>> Please let me know your views on this?
>>
>> Actually we are in the process of migrating from yaffs to ubifs, The 
>> same test application works  with
>> yaffs as well.
>>     
>
> I've created this piece of documentation for you:
> http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests
>
> Please, validate your flash driver/HW.
>
>   

 >> Thank you very much. Will validate my flash driver with mtd tests.
BTW I must say that UBIFS tolerant to power-cuts. I was testing that for 
whole day.
It works great!!
