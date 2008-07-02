Received: from mail.slimdevices.com ([67.155.107.5])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KDxDN-0006al-D6
	for linux-mtd@lists.infradead.org; Wed, 02 Jul 2008 07:57:21 +0000
Message-ID: <486B34D9.2070009@logitech.com>
Date: Wed, 02 Jul 2008 08:57:13 +0100
From: Richard Titmuss <richard_titmuss@logitech.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: Bootloader support for UBI images
References: <486A184B.3080708@logitech.com> <1214915164.6573.75.camel@sauron>
In-Reply-To: <1214915164.6573.75.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:

>>  Also I need support for 
>> renaming multiple volumes atomically when switching images after the 
>> upgrade. If these sound sensible and useful changes I can look at 
>> creating patches to add these features.
>>     
> Also sounds as a good and useful idea. And implementation should not
> difficult - it is just about changing the volume table. You may count on
> my assistance.
>
> I'm just not sure about the interface. Renaming one volume is fine. But
> you need to rename 2, so the interface should be more complex. And if 2,
> why not 3, or 5? Or 16? Or any amount from 1 to UBI_MAX_VOLUMES?
>   
Right, I was thinking that it would allow any number of volumes for 
renaming. I am also not sure about the interface, and was hoping to get 
some suggestions here. I will think about it and propose something in a 
few days.

> So you use the sub-page read patch BTW?
No, I'd missed that. Where is it?

> Well, surely the boot-loader may create a per-PEB (physical eraseblock)
> array and put all information about each PEB there (mapped/unmapped, LEB
> number, erase-counter, etc)? Then in UBI it will be easy to scan this
> array instead of the flash media. I am just not aware how such kind of
> bootloader->kernel data passing is done in Linux. Can you come up with a
> nice and mainline-acceptible way?
>   
Ok, that is possible. This would also have to include the bad block and 
bit flip status for each PEB. At the moment the Redboot flash api does 
not make this available, so it would mean extending Redboot or writing 
custom flash drivers to access this information.

> I did not actually catch the second part (LER and PER) tables - this is
> something I am not aware of. UBI has only volume table on flash, the
> other things are in-memory and build by scanning.
>   
It was a proposal to _add_ an addition table, that provided a LER to PER 
mapping for static volumes. If this table was stored near the beginning 
of the flash, then it could be accessed without a full scan. This could 
only be used if the UBI volume was mounted read-only, any write 
operations would require scanning all the flash blocks. This is an 
alternative approach to passing data from the bootloader to the kernel.

Richard
