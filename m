Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLlkK-0007aJ-Ej
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 13:38:22 -0500
Message-ID: <442041BE.9070407@intel.com>
Date: Tue, 21 Mar 2006 21:11:10 +0300
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
In-Reply-To: <1142953764.13740.0.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,
please find my answers below.


Artem B. Bityutskiy wrote:
> Hello Alexander,
>
> I have basic questions as I haven't grasped your concepts. Note, I'm not
> an expert in RAID, so please, bother to explain basic notions as well.
>
>
> Why can't I have 3 or 5 chips and enable striping?
>   

Striped mtd device erasesize is an erasesize of subdevice multiplied by 
number of subdevices (in case of equal erasesize subdevices). As 
erasesize is commonly considered as a power-of-2 number it is not good 
idea to use 3, 5, etc devices.

>
>   
>> cmdline_parm="<stripedef>[;<stripedef>]"
>> <stripedef> :=
>>     
> <stripename>(<interleavesize>):<subdevname>.<subdevname>
>   
>>   Example:	  
>>   insmod mtdstripe.ko
>> cmddline_parm="stripe1(128):vol1.vol3;stripe2(128):vol2.vol4	  
>>   Note: you should use '.' as a delimiter for subdevice names here.
>>     
> Err, please, define the "subdevice" notion. And what is vol1, vol2, etc?
>   

Subdevices are mtd devices which participate in creation of striped mtd 
device (superdevice). vol1, vol2 here are the names of subdevices 
assigned on partitioning stage (for example) by the following part of 
kernel configuration string:
CONFIG_CMDLINE=".......... 
mtdparts=flash1:512k(blob)ro,2m(kernel)ro,16m(root),16m(vol1);flash2:16m(vol2),8m(vol3) 
........."

> Please, describe the model of the striped MTD device from user's
> perspective. I understand MTD concatenation. It just merges several MTD
> devices to one larger MTD device.
>   

If user has several independent chips (of the same type) in system he 
can stripe them to get performance boost.

> May I consider your striping as another type of MTD concatenation layer
> which concatenates MTD devices by means of interleaving eraseblocks?
>   

Your interpretation is similar to JBOD (concatenation) and RAID0 
(striping) comparison. Yes in case of striping we also get a larger 
device as for concatenation. But the interleave size may differ from 
subdevices erasesize. Actually interleave size is significantly smaller 
than erasesize.

> Suppose my interleave value is 512. Suppose the interleaved MTD
> device name is mtd7 and it concatenates 2 other MTD devices. What
> happens if: 
>
> 1. I write 512 bytes at offset 0 of eraseblock 0 of mtd7
>   

These 512 bytes will be written at first subdevice at offset 0

> 2. I write 512 bytes at offset 512 of eraseblock 0 of mtd7
>   

These 512 bytes will be written at second subdevice at offset 0

> 3. I write 512 bytes at offset 1024 of eraseblock 0 of mtd7
>   

These 512 bytes will be written at first subdevice at offset 512

> 4. I erase eraseblock 0 of mtd7
>   

In simple case eraseblock 0 on both subdevices 1 and 2 will be erased

Thanks,
Alexander Belyakov
