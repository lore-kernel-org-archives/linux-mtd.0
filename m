Received: from lilly.ping.de ([83.97.42.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KzZgc-0007am-LR
	for linux-mtd@lists.infradead.org; Mon, 10 Nov 2008 16:32:23 +0000
Date: Mon, 10 Nov 2008 17:28:50 +0100
To: linux-mtd@lists.infradead.org
Subject: Re: Problem with MTD and multiple erase sizes
Message-ID: <20081110162850.GM5081@leila.ping.de>
References: <20081106160706.GY5081@leila.ping.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20081106160706.GY5081@leila.ping.de>
From: wolfgang@leila.ping.de (Wolfgang Wegner)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

maybe I did not give enough information...

The problem actually happens with uclinux-2.6.23-uc0 in uClinux-dist-20071107,
but as far as I can see, the code in mtdchar (ioctl) is the same in
current kernel revisions.
My application uses the same algorithm as eraseall, so I think the
approach should be correct, and as the kernel correctly states the
erase sizes during bootup, I can not see a configuration problem
either.

Any help would be greatly appreciated!

Best regards,
Wolfgang


On Thu, Nov 06, 2008 at 05:07:06PM +0100, Wolfgang Wegner wrote:
> Hi,
> 
> I am new to the list and also quite new to MTD, and - obviously - have
> a problem.
> 
> I have MTD up and running with several partitions, however, I now have
> a problem accessing the last partition which consists of a region with
> a different erase size than the rest of the device.
> 
> Up to now, my algorithm is as follows:
> - open device
> - get info with MEMGETINFO
> - loop over all erase blocks to do the unlocking/erase
> 
> This fails for the last partition because MEMGETINFO returns the erasesize
> of 0x20000 for this partition, too.
> 
> I tried using MEMGETREGIONINFO, but this fails because MEMGETREGIONCOUNT
> is 0 for this partition (most likely because there actually is only one
> erasesize used within this partition).
> 
> Can anybody point me to what I am doing wrong here?
> 
> Thank you and best regards,
> Wolfgang
> 
> 
> Here is my kernel boot output:
> 
> ASTRO5373L flash device: 2000000 at 0
> Number of erase regions: 2
> Primary Vendor Command Set: 0001 (Intel/Sharp Extended)
> Primary Algorithm Table at 010A
> Alternative Vendor Command Set: 0000 (None)
> No Alternate Algorithm Table
> Vcc Minimum:  1.7 V
> Vcc Maximum:  2.0 V
> Vpp Minimum:  8.5 V
> Vpp Maximum:  9.5 V
> Typical byte/word write timeout: 256 µs
> Maximum byte/word write timeout: 512 µs
> Typical full buffer write timeout: 512 µs
> Maximum full buffer write timeout: 1024 µs
> Typical block erase timeout: 1024 ms
> Maximum block erase timeout: 4096 ms
> Chip erase not supported
> Device size: 0x2000000 bytes (32 MiB)
> Flash Device Interface description: 0x0001
>   - x16-only asynchronous interface
> Max. bytes in buffer write: 0x40
> Number of Erase Block Regions: 2
>   Erase Region #0: BlockSize 0x20000 bytes, 255 blocks
>   Erase Region #1: BlockSize 0x8000 bytes, 4 blocks
> ASTRO5373LFlash: Found 1 x16 devices at 0x0 in 16-bit bank
>  Intel/Sharp Extended Query Table at 0x010A
>  Intel/Sharp Extended Query Table at 0x010A
>  Intel/Sharp Extended Query Table at 0x010A
>  Intel/Sharp Extended Query Table at 0x010A
>  Intel/Sharp Extended Query Table at 0x010A
> Using buffer write method
> cfi_cmdset_0001: Erase suspend on write enabled
> Creating 9 MTD partitions on "ASTRO5373LFlash":
> 0x00000000-0x02000000 : "Complete Flash"
> 0x00000000-0x00080000 : "bootloader"
> 0x00080000-0x00280000 : "kernel"
> 0x00280000-0x00540000 : "root"
> 0x00540000-0x00800000 : "FPGA"
> 0x00800000-0x01f40000 : "data"
> 0x01f40000-0x01f80000 : "Parameters1"
> 0x01f80000-0x01fc0000 : "Parameters2"
> 0x01fc0000-0x02000000 : "Parameters_ext"
> 
> 
> 
> The partition in question is "Parameters_ext" which comprises 4 blocks
> of 0x8000 bytes each.
> 
> For all my flash accesses I have some utility functions, here is the
> unlock part (with some additional debug stuff already):
> 
>       if (ioctl(current_task.fd, MEMGETREGIONCOUNT, &region_count)) {
> 	fprintf(stderr,"flash_worker_threadfunc: MEMGETREGIONCOUNT(%d) failed. %d %s\n",
> 		current_task.fd, errno, strerror(errno)); 
> 	retval = -2;
> 	goto complete_fail;
>       }
>       region_info.regionindex = 0;
>       if (ioctl(current_task.fd, MEMGETREGIONINFO, &region_info)) {
> 	fprintf(stderr,"flash_worker_threadfunc: MEMGETREGIONINFO(%d) failed. %d %s\n",
> 		current_task.fd, errno, strerror(errno)); 
> 	retval = -2;
> 	goto complete_fail;
>       }
>       fprintf(stderr, "flash_worker_threadfunc: regioninfo(%d): %d, 0x%x, 0x%x, 0x%x\n",
> 		current_task.fd,
> 		region_count,
>                 region_info.offset,
>                 region_info.erasesize,
>                 region_info.numblocks);
>       if (ioctl(current_task.fd, MEMGETINFO, &meminfo)) {
> 	fprintf(stderr,"flash_worker_threadfunc: meminfo(%d) failed. %d %s\n",
> 		current_task.fd, errno, strerror(errno)); 
> 	retval = -2;
> 	goto complete_fail;
>       }
>       fprintf(stderr, "flash_worker_threadfunc: meminfo(%d): %d, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x\n",
> 		current_task.fd,
> 		region_count,
>                 meminfo.type,
>                 meminfo.flags,
>                 meminfo.size,
>                 meminfo.erasesize,
>                 meminfo.writesize);
> 
>       if(BIT_IS_SET(current_task.command, FLASH_TASK_COMMAND_ERASE_BIT) ||
>          BIT_IS_SET(current_task.command, FLASH_TASK_COMMAND_WRITE_BIT) ||
> 	 BIT_IS_SET(current_task.command, FLASH_TASK_COMMAND_UNLOCK_BIT)) {
> 	erase.start = current_task.base_address;
> 	erase.length = meminfo.erasesize;
> 
> 	while(erase.start < address_end) {
> 	  fprintf(stderr,"flash_worker_thread: Performing Flash unlock on %d at offset 0x%x (size 0x%x)\n",
> 		  current_task.fd, erase.start, erase.length);
> 	  if (ioctl(current_task.fd, MEMUNLOCK, &erase)) {
> 	    fprintf(stderr,"flash_worker_thread: unlock failed. %d %s\n", errno, strerror(errno));
> 	    retval = -2;
> 	    goto complete_fail;
> 	  }
> 	  erase.start += meminfo.erasesize;
> 	}
>       }
> 
> results in:
> flash_worker_threadfunc: MEMGETREGIONINFO(4) failed. 22 Invalid argument
> 
> or
> 
> flash_worker_threadfunc: meminfo(4): 0, 0x3, 0xc00, 0x40000, 0x20000, 0x1
> flash_worker_thread: Performing Flash unlock on 4 at offset 0x38000 (size 0x20000)
> flash_worker_thread: unlock failed. 22 Invalid argument
> 
> in case I comment out the MEMGETREGIONINFO part.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
