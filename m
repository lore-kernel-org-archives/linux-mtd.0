Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKfxJ-0001Vm-Q7
 for linux-mtd@lists.infradead.org; Fri, 01 Dec 2017 07:41:58 +0000
Received: by mail-wm0-x232.google.com with SMTP id y82so4487891wmg.1
 for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2017 23:41:32 -0800 (PST)
Subject: Re: UBIFS does not mount after powerfail
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <5256290.ff6uB8SQ02@blindfold>
 <10097404-fd3d-73a3-6e0a-658fe8385cd2@colorfullife.com>
 <2908877.jEbli3qftF@blindfold>
From: Manfred Spraul <manfred@colorfullife.com>
Message-ID: <df8dc8e7-cb9a-4cef-bca6-cfc40092b1d1@colorfullife.com>
Date: Fri, 1 Dec 2017 08:41:28 +0100
MIME-Version: 1.0
In-Reply-To: <2908877.jEbli3qftF@blindfold>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 11/30/2017 09:03 PM, Richard Weinberger wrote:
> Manfred,
>
> Am Donnerstag, 30. November 2017, 18:41:52 CET schrieb Manfred Spraul:
>
>> Let's keep it simple and concentrate on the
>> garbage_collect_leb()/ubifs_scan issue.
>>
>>> Let's recap, you trigger a corruption that happens only(!) when xattrs are
>>> used?
>> Correct, I only see the corruption when xattr is used.
> Good.
>
>>> How is Fastmap involved in the game? If so, I want to know whether you can
>>> trigger without Fastmap being enabled.
>> Correct, I have seen the corruption without FASTMAP.
> Also Good.
>
>>> Which one is the image that failed first with chk_fs enabled?
>>> On a vanilla kernel...
>> I have used a modified MTDRAM: I have patched it so that it writes every
>> ERASE and every WRITE into a log.
>> Both the addresses and the data.
>> First, I have created an initial image
>> (ubiformat/ubiattach/ubimkvol/ubidetach).
>> Then I did a dump of it (nanddump /dev/mtd0 > dump-before.bin)
>> Then I enabled logging, and run the test load (ubiattach/mount/mount
>> ecryptfs/<many touch/write/rm/mv commands>/umount/ubidetach).
>> Then I created a dump of the final image. (nanddump /dev/mtd0 >
>> dump-after.bin)
> Okay.
>
>> Then the obvious cross checks:
>> Initial image+apply all commands from the log is identical to the final
>> image.
>>
>> Now I can use the log to create virtual power fail events:
>>
>> What if a power failure happens after 168168 commands?
>> Image:
>> https://sourceforge.net/projects/calculix-rpm/files/ubifs/image-168168.bin/d
>> ownload
>>
>> Logfile of a mount without chk_fs:
>> https://sourceforge.net/projects/calculix-rpm/files/ubifs/r-168168.txt/downl
>> oad
>>
>> What was the last write command?
>> FUNC_WRITE_CHK(addr=0xd61000, len=0x800)
>>
>> What would have been the next write command:
>> FUNC_WRITE_CHK(addr=0xd61800, len=0x800)
>>
>> Image after that command:
>> https://sourceforge.net/projects/calculix-rpm/files/ubifs/image-168169.bin/d
>> ownload
> Which file contains the MTD with chk_fs being enabled?
I'm not sure if this help, it only adds more data that will confuse:
The image.bin is obviously identical, I have only enabled chk_fs for the 
replay.

And: The mount was done using 4.14, the image was created using 4.14-rc5.
If you want: Here is the data (dmesg output + images)
https://sourceforge.net/projects/calculix-rpm/files/ubifs/chkfs_4.14/

> What did you set for CONFIG_MTDRAM_TOTAL_SIZE and CONFIG_MTDRAM_ERASE_SIZE?
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=32768
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTDRAM_WRITE_SIZE=2048
CONFIG_MTDRAM_WRITEBUF_SIZE=2048
CONFIG_MTDRAM_FLIGHTRECORDER=y
CONFIG_MTDRAM_FLIGHTRECORDER_BUFFER_SIZE=131072
CONFIG_MTDRAM_FLIGHTRECORDER_ENABLED=y

With regards to WRITEBUF_SIZE, it may have been at 64.

--
     Manfred
