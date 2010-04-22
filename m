Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O4mkm-00042H-9F
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2010 03:07:01 +0000
Message-ID: <4BCFBF5A.9090102@windriver.com>
Date: Thu, 22 Apr 2010 11:15:38 +0800
From: "stanley.miao" <stanley.miao@windriver.com>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>
Subject: Re: [Yaffs] Problems with mkyaffs2image.c v1.5
References: <l2mb249ed931004191643n679c074bs6c03c5ab4cd8fd26@mail.gmail.com>
	<201004201304.34429.manningc2@actrix.gen.nz>
In-Reply-To: <201004201304.34429.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org >> \"linux-mtd@lists.infradead.org\""
	<linux-mtd@lists.infradead.org>, yaffs@lists.aleph1.co.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Manning wrote:
> We should put this in an FAQ...
>
>
> On Tuesday 20 April 2010 11:43:52 Guy Lancaster wrote:
>   
>> I built a file system image using mkyaffs2image v1.5 but but won't
>>     
>
> mkyaffsimage (the yaffs1 version) worked reasonably well because yaffs1 
> tends/tended to be used with a single straight-forward flash format.
>
> With yaffs2, the actual binary layout is defered to the flash driver (mtd in 
> the case of Linux). This varies from device to device.
>
> As a result, the current mkyaffs2image is really a bit of a mess and needs to 
> be whittled and sandpapered to fit with your flash.
>   

Yes, The NAND oob layout varies from device to device, mkyaffs2image 
can't know
the layout. So we should leave this job to nandwrite.

This is the patch for it.

http://lists.infradead.org/pipermail/linux-mtd/2010-February/028923.html


Stanley.

>   
>> load.  Without modifications I get numerous errors of the form:
>>     
>>> yaffs tragedy: Bad object type, 2 != 3, for object 1059 at chunk 8242
>>> during scan
>>>       
>> I'm using a Linux 2.6.33.2 kernel with what I believe is the latest
>> YAFFS source installed (specifically yaffs_fs.c,v 1.102) for a Samsung
>> S3C2440 Arm target with 128MB NAND Flash (Samsung K9F1G08X0A).
>>
>> When I compile mkyaffs2image I get numerous warnings including a set
>>
>> of the form:
>>     
>>> mkyaffs2image.c:249: warning: array subscript is above array bounds
>>>       
>> When I enable a number of the trace flags I get:
>>     
>>> yaffs_ScanBackwards starts intstartblk 1 intendblk 1005...
>>> block is bad seq 0 state 3
>>> Block scanning block 1 state 3 seq 0
>>> Block empty
>>> block is bad seq 0 state 3
>>>       
>> ...
>>
>> I'm wondering if the problem is that the mkyaffs2image.c needs to be
>> configured for the MTD layout but I don't know how to find out what
>> that layout is.
>>     
>
> Yes, that is the problem. The easiest is to just look at the driver and see 
> what flash layout it provides.
>
> -- Charles
>
>
> _______________________________________________
> yaffs mailing list
> yaffs@lists.aleph1.co.uk
> http://lists.aleph1.co.uk/cgi-bin/mailman/listinfo/yaffs
>
>   
