Received: from mail.feig.de ([212.184.177.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JZoKg-0007Bg-Ul
	for linux-mtd@lists.infradead.org; Thu, 13 Mar 2008 14:22:59 +0000
Message-ID: <47D938C1.6040804@feig.de>
Date: Thu, 13 Mar 2008 15:22:57 +0100
From: Manuel Sahm <Manuel.Sahm@feig.de>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Binary Nandwrite/read to Flash
References: <47D91B98.20001@feig.de>
	<Pine.LNX.4.64.0803131345580.6032@lnxricardw.se.axis.com>
	<47D92581.1030007@feig.de>
	<Pine.LNX.4.64.0803131448330.6032@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0803131448330.6032@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Ricard Wanderlof schrieb:
>
> On Thu, 13 Mar 2008, Manuel Sahm wrote:
>
>> Thank you,
>>
>> could you tell me the exact call:
>>
>> I have a NAND-Flash with PAGESSIZE = 0x800 and ERASEBLOCKSIZE=0x20000
>>
>> I want to write a file maybe called "test.txt" at adress 0x02000000 
>> of the NAND flash.
>
> Something like
>
> nandwrite -s 0x02000000 -p /dev/mtd0 test.txt
>
> (mtd0 depending on which device your nandflash is)
>
> (Note: you don't have to specify the padding size, nandwrite figures 
> it out by querying mtd).
>
>> And read it back to a file "test2.txt" afterwards.
>
> Something like
>
> nanddump -o -b -s 0x02000000 -l <filesize> -f test2.txt /dev/mtd0
>
> where <filesize> is the size of your file.
>
> /Ricard
> -- 
> Ricard Wolf Wanderlöf                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
Thank you very much....

Is it possible to write/read to the NAND flash "directly" without an 
partition ?(/dev/mtdX) ?

Best regards 

Manuel Sahm	
