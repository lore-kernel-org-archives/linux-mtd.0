Received: from t111.niisi.ras.ru ([193.232.173.111] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Fbwv-0000UX-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2001 14:35:14 +0100
Message-ID: <3B3B9CC4.10103@niisi.msk.ru>
Date: Thu, 28 Jun 2001 17:08:20 -0400
From: Alexandr Andreev <andreev@niisi.msk.ru>
MIME-Version: 1.0
To: Abraham vd Merwe <abraham@2d3d.co.za>
CC: MTD for Linux <linux-mtd@lists.infradead.org>,
        David Woodhouse <dwmw2@infradead.org>
Subject: Re: Making partitions questions.
References: <3B3B5128.7040006@niisi.msk.ru> <20010628120519.B6265@crystal.2d3d.co.za>
Content-Type: text/plain; charset=KOI8-R; format=flowed
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

David Woodhouse wrote:

>  You don't necessarily need to be able to change them at runtime. We already 
>  support a few methods of storing partitioning information on the medium 
>  rather than hard-coding it in the mapping driver. We can grok RedBoot FIS 
>  tables, Compaq bootldr partitions, and also the ARM Firmware Suite layout.

I need to be able to change it while development. I need to create and modify 
partitions dynamically, because the size of partitions can be variable during 
development stage. I want to have one partition for the kernel with no 
filesystem on it at all, the second partition for ext2 filesystem with read 
only accesses, and the third for the JFFS2 full functional filesystem. 

Is there any common userland utils for creating RedBoot, Compaq or ARM 
partitions? 

Abraham vd Merwe wrote:

>  The reason why this have to be done is that the mtd partition driver needs
>  to know the partition information before it can register those partitions as
>  devices (it basically just goes and setup MTD structures for each partition
>  and register them the normal way).

Fine. But, why we can't just use MBR and common IDE partition table instead of 
RedBoot, Compaq, ARM and other specific partitions? 

>  In order to actually make a userland utility you'd have to implement a
>  system call to actually send the info to the partition driver which will
>  have to reregister the devices. Not all that difficult, but I don't think
>  anybody is working on it right now.

I guess, we can do the similar to IDE things. And it allows us to use 
habitual
fdisk utility with flash. But it also means, that whole flash device 
have to
be registered ( /dev/mtdblocka for example ). Is it worth while? Is this 
work
usable?
