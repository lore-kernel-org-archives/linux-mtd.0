Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcCKf-00060q-Tm
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 06:33:57 +0000
Message-ID: <4B67C8B9.202@windriver.com>
Date: Tue, 02 Feb 2010 14:39:53 +0800
From: "stanley.miao" <stanley.miao@windriver.com>
MIME-Version: 1.0
To: Deven Balani <deven.balani@nxp.com>
Subject: Re: flash_eraseall -j and refusing to mount jffs2 on NAND flash
	partition
References: <BD9D98B4D828E1499D717DBA564A1F2717C04459CC@eu1rdcrdc1wx031.exi.nxp.com>
In-Reply-To: <BD9D98B4D828E1499D717DBA564A1F2717C04459CC@eu1rdcrdc1wx031.exi.nxp.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I encountered the same problem.
I wrote several patch to mtd-utils and I will post them here later.

Stanley.

Deven Balani wrote:
> Hi all,
>
> I'm using linux kernel 2.6.28.9 and flash_eraseall -j from mtd-utils-1.2.0 to install jffs2 cleanmarker on a NAND flash partition. 
>
> Doing so I ran into two problems?
>
> 1. When I attempted to install jffs2 cleanmarker using flash_eraseall -j, I got following error -
>
> flash_eraseall:/dev/mtd6: unable to get NAND oobinfo
>
> I did some debugging to find that MEMGETOOBSEL ioctl is returning -ENOTTY in flash_eraseall.c. Debugged further to find that there is a size mismatch between "struct nand_oobinfo" defined in mtd-utils-1.2.0/include/mtd/mtd-abi.h 
>
> struct nand_oobinfo {
>    uint32_t useecc;
>    uint32_t eccbytes;
>    uint32_t oobfree[8][2];
>    uint32_t eccpos[32];
> };
>
> Whereas in linux-2.6.28.9/include/mtd/mtd-abi.h it is defined as -
> struct nand_oobinfo {
>    uint32_t useecc;
>    uint32_t eccbytes;
>    uint32_t oobfree[8][2];
>    uint32_t eccpos[64];
> };
>
> I was able to get around this problem by changing the size of eccpos[] to 64 in mtd-utils-1.2.0/include/mtd/mtd-abi.h.
>
> 2. Then I tried flash_eraseall -j /dev/mtd6 on NAND partition, it completed successfully but subsequent mount -t jffs2 failed -
>
> # mount -t jffs2 /dev/mtdblock6 /mnt
> Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
> empty_blocks 0, bad_blocks 0, c->nr_blocks 320
> mount: Mounting /dev/mtdblock6 on /mnt failed: Input/output error
>
> I google'd and found that there has been some discussion on this long back and following was the last post.
>
>   
>> Re: Flash_eraseall -j and cowardly refusing to mount
>>
>> Jeff Hane jhane at mobilygen.com
>> Mon Jan 7 13:39:19 EST 2008
>>
>> But doesn't this only fix the case where you have contiguous 8 bytes to
>> write the cleanmarker?  flash_eraseall -j uses MTD_PLACE to write the
>> cleanmarker BUT jffs2 uses MTD_AUTO to read the cleanmarker.
>> For example, if your oob area has byte 0 as the bad block indicator and
>> bytes 8-10 have ecc, there are only 7 consecutive free bytes.
>> flash_eraseall -j will only write 7 bytes so jffs2 will fail when
>> mounting the filesystem because it will read 8 bytes.  The 8th byte,
>> which will be byte 12, will still be FF.
>>  It seems there should be an ioctl that would allow one to read/write
>> the oob area using MTD_AUTO???
>>     
>
>   
>> jeff
>>     
>
> I still see that mtd-utils still don't support this feature. Are there any plans to support this feature in mtd-utils?
>
> I can get around this problem, if I do just flash_eraseall without -j option and then using "mount -t jffs2 -rw" so that jffs2 cleanmarkers are installed during mount time.
>
> I'm not blocked by these problems anyways just thought to bring it to the notice of community. 
>
> Comments and suggestions are welcome.
>
> Thanks,
> Deven
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>   
