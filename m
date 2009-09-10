Received: from antispam02.maxim-ic.com ([205.153.101.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mlj9z-0008Eb-RQ
	for linux-mtd@lists.infradead.org; Thu, 10 Sep 2009 12:54:04 +0000
Message-ID: <4AA8F6E4.1090209@maxim-ic.com>
Date: Thu, 10 Sep 2009 18:23:56 +0530
From: JerinJacob <jerin.jacob@maxim-ic.com>
MIME-Version: 1.0
To: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
Subject: Re: UBIFS Error
References: <4AA5F37F.4050307@maxim-ic.com> <4AA60E6C.6060307@nokia.com>
	<4AA8EA9C.4070805@maxim-ic.com> <4AA8ED7B.5020509@nokia.com>
In-Reply-To: <4AA8ED7B.5020509@nokia.com>
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

Hi Artem,

Thanks for the support.
We are using 2.6.30.

----------------------------------------------------------------------------------------
root@mg3500evp323 # uname -a
Linux evp323 2.6.30.SDK6r3430 #1 PREEMPT Tue Sep 1 21:18:07 IST 2009 
armv5tejl GNU/Linux
----------------------------------------------------------------------------------------

I guess 2.6.30 (from kernel.org )have all the latest stable UBIFS 
updates.Please correct me if I am wrong.

Regards,
Jerin.


Artem Bityutskiy wrote:
> On 09/10/2009 03:01 PM, ext JerinJacob wrote:
>   
>> Hi UBIFS-Dev,
>>
>> I am able to reproduce the problem with a C  program. please find it below.
>> Please find pseudo code for the same
>> -----------------------------------------------------------------------------
>> Step 1: Open 10 files for writing.
>> Step 2: fill the files with random data, which size is less than
>> (100KiB*2*10)
>> Step 3: if total files size is greater than 500MiB then
>>              lseek file pointers to 0'th location
>> Step 4: Goto  2
>> ---------------------------------------------------------------------------------
>>     
>
> Hi,
>
> we'll look at this. But please, let us know which kernel version
> you are using? Do you have all the latest UBIFS updates? I remember
> we fixed a problem with similar symptoms at some point.
>
>   
