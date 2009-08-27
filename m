Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MgY1F-0007ya-Qk
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 05:59:37 +0000
Received: by fxm26 with SMTP id 26so733582fxm.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Aug 2009 22:59:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1251321997.10982.101.camel@jjw-linux>
References: <dac45060908261244wbfc744apec0d5195a0f1dbcf@mail.gmail.com>
	<1251321997.10982.101.camel@jjw-linux>
Date: Thu, 27 Aug 2009 08:59:32 +0300
Message-ID: <dac45060908262259r2f5ff85tb2608bd02153e797@mail.gmail.com>
Subject: Re: Creating an ext3 partition on an mtd device
From: Mark Ryden <markryde@gmail.com>
To: Justin Waters <justin.waters@timesys.com>
Content-Type: text/plain; charset=ISO-8859-1
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

Hello, Justin,
Thanks for your answer.

Then why do I have in "Essential Linux Device Drivers" this , in
"Block Device Emulation" section of chapter 17, "Memory Technology
Devices" , this:

Block Device Emulation
The MTD subsystem provides a block driver called mtdblock that
emulates a hard disk over flash memory. You can put any filesystem,
say EXT2, over the emulated flash disk. Mtdblock hides complicated
flash access procedures (such as preceding a write with an erase of
the corresponding sector) from the filesystem. Device nodes created by
mtdblock are named /dev/mtdblock/X, where X is the partition number.
To create an EXT2 filesystem on the pda_fs partition of the handheld,
as shown in Figure 17.2, do the following:
bash> mkfs.ext2 /dev/mtdblock/2                 Create an EXT2 filesystem
                                                 on the second partition

bash> mount /dev/mtdblock/2 /mnt                Mount the partition


Regards,
Mark


On Thu, Aug 27, 2009 at 12:26 AM, Justin
Waters<justin.waters@timesys.com> wrote:
> Mark,
>
> On Wed, 2009-08-26 at 15:44 -0400, Mark Ryden wrote:
>> Hello,
>>
>> I want to create an ext2 partition on an mtd device.
>
> No, you don't.
>
> See: http://www.linux-mtd.infradead.org/faq/general.html#L_ext2_mtd
>
> and
>
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_raw_vs_ftl
>
>>  I tried to create a partition with fdisk /dev/mtdblock2
>>  The device is /dev/mtdblock2p1
>>  but: mkfs.ext3 /dev/mtdblock2p1  fails
>>
>>  What should I do ? Is it right in this case to use fdisk at all ?
>
> Unless you have some hard requirement for EXT2, you are much better off
> using a flash file system, like ubifs or jffs2.  Check out
> http://www.linux-mtd.infradead.org for more info.
>
>> Regards,
>> Mark Ryden
>
> - Justin Waters
>
>
