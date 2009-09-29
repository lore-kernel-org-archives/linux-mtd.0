Received: from antispam01.maxim-ic.com ([205.153.101.182])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MsVZe-00062M-GX
	for linux-mtd@lists.infradead.org; Tue, 29 Sep 2009 05:48:37 +0000
Message-ID: <4AC19FA0.1090301@maxim-ic.com>
Date: Tue, 29 Sep 2009 11:18:16 +0530
From: JerinJacob <jerin.jacob@maxim-ic.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: UBIFS Error
References: <4AA5F37F.4050307@maxim-ic.com> <4AA60E6C.6060307@nokia.com>	
	<4AA8EA9C.4070805@maxim-ic.com> <4AA8ED7B.5020509@nokia.com>	
	<4AA8F6E4.1090209@maxim-ic.com> <4AA90351.3050000@nokia.com>	
	<4AAA4005.9080707@maxim-ic.com>
	<1252938440.5060.102.camel@localhost>	
	<1252938588.5060.103.camel@localhost>
	<4AAF5016.2030809@maxim-ic.com>	 <4AB1F58D.7070809@maxim-ic.com>
	<1254136949.3778.58.camel@localhost>
In-Reply-To: <1254136949.3778.58.camel@localhost>
Content-Type: text/plain; charset="utf-8"; format=flowed
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

Do you still have UBIFS errors? Any new interesting findings? Did you
manage to somehow reproduce this on nandsim?

 >Still the UBIFS crashing problem persist.
 >Not able to reproduce with nandsim.
 >Is there anything I can help you to accelerate this bug fix ? Please 
let me know ?
 >Even I could reproduce the problem 16MiB of nand partition(Earlier, I 
Was testing with 500MiB partition)
 >If possible,Could you please run the testapp on any target board(if 
you have any).



Artem Bityutskiy wrote:
> On Thu, 2009-09-17 at 14:08 +0530, JerinJacob wrote:
>   
>>>> Got a crash  while reading a large mtd device with "mtd_readtest".
>>>>         
>> Let me fix this platform specific driver bug.
>> Any way this mtd_tests are very use full.
>>
>>  >>> Fixed the platform specific driver bug.And all the mtd test case 
>> are passing now with zero errors.
>> Unfortunately, Still the UBIFS crashing problem persist.
>>     
>
> Do you still have UBIFS errors? Any new interesting findings? Did you
> manage to somehow reproduce this on nandsim?
>
>   
