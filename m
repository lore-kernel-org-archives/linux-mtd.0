Received: from [200.53.172.155] (helo=qis)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gwfO-0007va-00
	for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2001 00:10:07 +0100
Message-ID: <20010911222037.24555.qmail@qis>
References: <20010911205853.21285.qmail@qis>
            <20010911201345.19481.qmail@qis>
            <20010911182623.15217.qmail@qis>
            <8583.1000239450@redhat.com>
            <9772.1000243426@redhat.com>
            <10449.1000245624@redhat.com>
In-Reply-To: <10449.1000245624@redhat.com> 
From: "Nikolai Vladychevski" <niko@isl.net.mx>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: duplicate DoC millenium with dd
Date: Tue, 11 Sep 2001 22:20:37 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse writes: 

> 
> niko@isl.net.mx said:
>>  yes, this is the problem... right now I'm leaving 1 Meg for the
>> linuxBIOS  and kernel and right now there is left as little as 40 K
>> bytes free space of  that meg. 
> 
> Use modules?

yes, I do, but it still big, its a 2.4.7 

>  
> 
>>  If I update the  software on the chip once a week (it's an automatic
>> update via remote  server), will it survive for 2 years without
>> errors, for example ?  
> 
> It doesn't degrade over time. Using it the first time may lose the 
> bad-block information which is put on it by the NAND flash chip 
> manufacturer (Toshiba or Samsung, not M-Systems). After that there's no 
> difference. 
> 
>>  Wow! that sounds cool! I have to try it, but would linuxBIOS conflict
>> with  it?  
> 
> No, should be fine. You could have it appear as three MTD devices - one for 
> LinuxBIOS, one for the kernel, and one for cramfs.

I'm sorry, I can't find any docs about creating partitions, mtd0, mtd1, 
mtd2, etc..? list archives dont help either, how it is done? 


>
> Using cramfs directly on the NAND flash gives you no error correction and 

but wait a minute, if I enable these options: 

   <*> NAND Device support
     [*] Enable ECC correction algorithm
     [*] Verify NAND page writes 

won't it help me? 

> no facility to work around bad blocks. I wouldn't wan to do it like that in 
> production, although in practice it'll work unless you have a chip with bad 
> blocks.

well, my environment will be production,so I guess I'm out of luck because 
if I take your precautions: 

1) I can't use nftl_format
2) I can't use mtd partitioning because I will write directly on the NAND 
flash..... 

this is kinda bad news....... 


nikolai
