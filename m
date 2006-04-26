Received: from s20.s20avahost.net ([207.44.250.61])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FYjoI-0000gp-C2
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 09:12:09 -0400
Received: from h-67-101-205-98.chcgilgm.covad.net ([67.101.205.98]
	helo=www.westnelson.net) by s20.s20avahost.net with esmtp (Exim 4.52)
	id 1FYjnF-0003wl-TL
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 08:10:58 -0500
Message-ID: <2349.136.182.2.222.1146057120.squirrel@www.westnelson.net>
In-Reply-To: <625fc13d0604251925o10a5062bj45f8397948f6fe5f@mail.gmail.com>
References: <44871.129.188.33.221.1145996362.squirrel@www.westnelson.net>
	<625fc13d0604251925o10a5062bj45f8397948f6fe5f@mail.gmail.com>
Date: Wed, 26 Apr 2006 08:12:00 -0500 (CDT)
From: "Peter Buelow" <pete@putzin.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Re: Unlocking Intel flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 4/25/06, Peter Buelow <pete@putzin.net> wrote:
>> Ok, hoping someone knows, because Google isn't helping oddly enough.
>> I've
>> just started putting together some work that includes adding a JFFS2
>> partition using MTD (obviously) that sits on it's own (ie, it's not
>> bootable and is just a small area that I would like to read/write to
>> where
>> the rest of the FS is squashfs read only). Basically, an rc script
>> either
>> creates it, or mounts it depending, and then I would use it mounted
>> under
>> /store. Here's what's happening.
>>
>> I can create the JFFS2 fielsystem, no errors. I can mount the new
>> filesystem, no errors. I can initially write to the filesystem, but then
>> the writes fail (usually after the first write) with the following error
>>
>> Write of 68 bytes at 0x000e0214 failed. returned 0, retlen 0
>>
>> This happens after initial creation and will happen immediately after
>> reboot and remount of the existing partition. OK, so I need to unlock
>> the
>> flash maybe? I try the unlock command, and get the following.
>>
>> # unlock /dev/mtdblock/8
>> Could not get MTD device info from /dev/mtdblock/8
>
> Try unlock /dev/mtd/8.  You need to use the character device with
> unlock, not the block device.
>
>> This is a stock 2.4.17 kernel, no patches to MTD (yet?) and gcc version
>> 2.95.3. It's Intel Strata flash, the P30 family. Many thanks in advance
>> to
>> anyone who can help.
>
> That combination probably won't work anyway.  You have a fairly new
> flash that has a CFI version of 1.4.  You also have a kernel version
> that is very very very old and does not support that version of CFI.
> If you want real MTD support for those chips, you'll need to update
> your kernel.
>
> josh
>
>
>
I was afraid of this. Will this kernel patch cleanly, or at least with a
reasonable amount of effort?

Thanks.

-- 
"Knowledge is in every country the surest basis of public happiness."
George Washington (State of the Union address, 1790)
--
Pete
