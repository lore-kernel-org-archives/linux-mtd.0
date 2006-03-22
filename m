Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLzop-0004Rb-8M
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 04:40:08 -0500
Message-ID: <44211B5F.2030200@intel.com>
Date: Wed, 22 Mar 2006 12:39:43 +0300
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>	
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
In-Reply-To: <1142967444.13740.9.camel@sauron.oktetlabs.ru>
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

>> Subdevices are mtd devices which participate in creation of striped mtd 
>> device (superdevice). vol1, vol2 here are the names of subdevices 
>> assigned on partitioning stage (for example) by the following part of 
>> kernel configuration string:
>> CONFIG_CMDLINE=".......... 
>> mtdparts=flash1:512k(blob)ro,2m(kernel)ro,16m(root),16m(vol1);flash2:16m(vol2),8m(vol3) 
>> ........."
>>     
> IMO, it is better to use MTD device numbers. 0 = mtd0, 1 = mtd1, etc. I
> can always glance at /proc/mtd and realize which numbers to use. Names
> may contain white spaces, or whatever inappropriate characters one may
> conceive, right?
>   

At the stage of writing CONFIG_CMDLINE (mtdpart and mtdstripe parts) 
user generally do not know what mtd device number will be assigned to 
each partition. Using names IMO is a better solution if mtdstripe is a 
built-in module since user gives and uses partition names by himself.

Using /proc/mtd and stripe mtd device by number (your suggestion) can be 
quite good for loadable from command line mtdstripe.ko module. But using 
two different configuration methods for built-in and loadable module can 
be quite confusing for user.

>>> 4. I erase eraseblock 0 of mtd7
>>>       
>> In simple case eraseblock 0 on both subdevices 1 and 2 will be erased
>>     
> I see. Why did you say "In simple case" ?

Suggested algorithm supports striping for devices with different 
erasesize. In that (quite uncommon) case erasesize of superdevice is not 
just erasesize of subdevice multiplied by number of subdevices.

Thanks,
Alexander Belyakov
