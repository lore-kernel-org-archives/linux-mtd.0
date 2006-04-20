Received: from regina.sibername.com ([66.246.246.233])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FWdNH-000806-6c
	for linux-mtd@lists.infradead.org; Thu, 20 Apr 2006 13:55:51 -0400
Received: from ottgate.precidia.com ([206.191.32.162]:49457 helo=[10.0.2.13])
	by regina.sibername.com with esmtpa (Exim 4.52) id 1FWdNF-0000Sz-RP
	for linux-mtd@lists.infradead.org; Thu, 20 Apr 2006 13:55:25 -0400
Mime-Version: 1.0 (Apple Message framework v749.3)
In-Reply-To: <4770282f0604180809v52de6531sd10198663204813b@mail.gmail.com>
References: <4770282f0604180809v52de6531sd10198663204813b@mail.gmail.com>
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Message-Id: <2A72046C-9115-480A-9C8D-67B89555381B@logicaloutcome.ca>
Content-Transfer-Encoding: 7bit
From: Glenn Henshaw <thraxisp@logicaloutcome.ca>
Date: Thu, 20 Apr 2006 13:55:21 -0400
To: linux-mtd@lists.infradead.org
Subject: Re: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 18-Apr-06, at 11:09 AM, Jean-Laurent Gazelle wrote:

> Hi,
>
> I'm running linux 2.6.9 on an ARM based platform booting from Uboot.
> My root filesystem is a flash partition.
>
> And I'm experiencing flash JFFS2/MTD corruption on some units while
> power cycling its on/off after 1 day of usage.
>
> I saw several posting on the subject, but none about a fix or
> workaround. Most of its were talking about powering off units while
> accessing the FS (write or erase block)
>
> I'm trying to investigate more deaper the problem, by setting up
> something like a watchdog and adding FS stress test.
>
> So if you've experienced similar issue and you've finally fixed it or
> workarounded it, please let me know.
>
> thanks,
> Jean-Laurent
>
> Here are the details of my configuration :
>
> Here is my flash topology :
> Probing Flash2 at physical address 0x04000000 (16-bit bankwidth)
> Flash2: Found 1 x16 devices at 0x0 in 16-bit bank
>  Intel/Sharp Extended Query Table at 0x0031
> cfi_cmdset_0001: Erase suspend on write enabled
> Using buffer write method
> RedBoot partition parsing not available
> cmdlinepart partition parsing not available
> Using static partitions on Flash1
> Creating 5 MTD partitions on "Flash1":
> 0x00000000-0x00020000 : "BootLoader"
> 0x00020000-0x00040000 : "BIOS Data"
> 0x00040000-0x001c0000 : "Fixed Kernel"
> 0x001c0000-0x00340000 : "D/L Kernel"
> 0x00340000-0x02000000 : "Root File-system"
>
> My flash device is intel stratflash 128J3C type.
>
>
>
> Everything works properly on the major part of my units.
> About ~ 5% of our devices are experiencing data corruption in Flash
> when Power Cycling the unit.
>
> What I mean by data corruption is :
> - bad CRC of the kernel image in flash.
> - corruption of the JFFS2 filesystem with the following errors .
>
> I have set the JFFS2 debug level to 2 to have more infos :
> jffs2_scan_inode_node(): CRC failed on node at 0x00082968: Read
> 0x53550700, calculated 0x5355a705
> jffs2_scan_dirent_node(): Node CRC failed on node at 0x00085cb4: Read
> 0x40be781e, calculated 0xd96b6459
> jffs2_scan_dirent_node(): Node CRC failed on node at 0x000876f4: Read
> 0xdb341107, calculated 0x70a4cf41
> jffs2_scan_inode_node(): CRC failed on node at 0x00091794: Read
> 0x0b79aada, calculated 0x18f814d5
> jffs2_scan_eraseblock(): Node at 0x00092964 {0x1985, 0xe002,
> 0x00000000) has invalid CRC 0x32fe3396 (calculated
> 0x8c813477)^Mjffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
> at 0x0009296c: 0x3396 instead


   Is it possible that your erase_block size is wrong (too small). I  
had the opposite experience with SST parts erasing 32k when I  
expected 4k.


-- 
Glenn Henshaw                     Logical Outcome Ltd.
e: thraxisp@logicaloutcome.ca     w: www.logicaloutcome.ca
