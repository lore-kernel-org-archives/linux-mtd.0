Received: from wa-out-1112.google.com ([209.85.146.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JK6Zl-0000AB-1a
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 06:37:44 +0000
Received: by wa-out-1112.google.com with SMTP id v33so195947wah.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Jan 2008 22:37:30 -0800 (PST)
Message-ID: <47A01B22.9040206@gmail.com>
Date: Wed, 30 Jan 2008 01:37:22 -0500
From: Max Stirling <vicky.irobot@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: mtd block readonly low level nand driver cramfs
References: <47985D88.1060005@gmail.com>
	<6a61dac20801270054t19e2af20o1211490d104110a9@mail.gmail.com>
	<479D86E4.30903@gmail.com>
In-Reply-To: <479D86E4.30903@gmail.com>
Content-Type: multipart/mixed; boundary="------------020806050905060107050203"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020806050905060107050203
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Max Stirling wrote:
> Max Stirling wrote:
>> I was looking at the chips folder under MTD and the MTD_ROM flag 
>> settings.
>>
>> I got this idea of having this low level driver code under chips with
>> the MTD_ROM flag set and mounting this for cramfs.
>>
>> Please comment, especially folks using the RO FS mounted on flash.
>>
>> MS
>>
>> On Jan 24, 2008 3:12 PM, Max Stirling <vicky.irobot@gmail.com> wrote:
>>  
>>> Hi,
>>>
>>> This might sound quite basic question. This is the first time I am
>>> looking into the MTD code so have some really basic questions.
>>>
>>> I am trying to mount a read only fs (cramfs) on the flash. Please 
>>> let me
>>> know if the following steps are right:
>>>
>>> 1. Enabled the following in the Kconfig files
>>>     CONFIG_MTD_PARITIONS
>>>     CONFIG_MTD
>>>     CONFIG_MTD_BLOCK_RO
>>>     CONFIG_MTD_NAND
>>>     CONFIG_MTD_NAND_IDS
>>>
>>>
>>> After booting the compiled kernel I am able to see the mtdblock under
>>> /proc/devices using 31 Major number.
>>>
>>> Now for me to mount the cramfs image that is on the flash I need to
>>> provide the low level nand driver code. This I need to write but before
>>> starting that can any one point me to a reference nand driver code that
>>> is used for read only mount? Which functionality would the MTD require
>>> to be implemented for mounting a cramfs image which is on the flash.
>>>
>>> Would appreciate any pointers to how to get started off with this.
>>>
>>> thanks in advance for the reply.
>>>
>>> M.S
>>>
>>>
>>>     
> When using the cramfs as the fs for the flash and mtdblock_ro enabled. 
> Which one should I be calling the user module, the cramfs or the 
> mtdblock_ro?
>
>
I have enabled the mtdblock_ro module and written a low lever chip 
driver code. Since I am mounting this as read-only I have set the type 
in mtd_info to MTD_ROM.


When I do a mount using command

# mount -t cramfs /dev/mtdblock mnt_cramfs
.
mtdblock_ro.c mtdblock_readsect
mtdblock_ro.c mtdblock_readsect
mtdblock_ro.c mtdblock_readsect
mtdblock_ro.c mtdblock_readsect
.
mount: Mounting /dev/mtdblock on cramfs failed: Invalid argument.

I created a cramfs image using cramfs utility and written that to flash. 
I tested the cramfs image by mounting on my local machine.

Is there anything that is missing here?


--------------020806050905060107050203
Content-Type: text/x-vcard; charset=utf-8;
 name="vicky_irobot.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vicky_irobot.vcf"

begin:vcard
fn:M S
n:S;M
version:2.1
end:vcard


--------------020806050905060107050203--
