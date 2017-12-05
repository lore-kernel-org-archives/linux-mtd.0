Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMId7-0004Mh-Ni
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 19:11:48 +0000
Received: by mail-wm0-x229.google.com with SMTP id g75so3308087wme.0
 for <linux-mtd@lists.infradead.org>; Tue, 05 Dec 2017 11:11:24 -0800 (PST)
Subject: Re: UBIFS does not mount after powerfail
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <2908877.jEbli3qftF@blindfold>
 <df8dc8e7-cb9a-4cef-bca6-cfc40092b1d1@colorfullife.com>
 <24015049.MUjmLyMSVC@blindfold>
From: Manfred Spraul <manfred@colorfullife.com>
Message-ID: <aa51fb6e-61c9-1133-b2cf-f931ee7e105a@colorfullife.com>
Date: Tue, 5 Dec 2017 20:11:20 +0100
MIME-Version: 1.0
In-Reply-To: <24015049.MUjmLyMSVC@blindfold>
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

On 12/05/2017 02:27 PM, Richard Weinberger wrote:
> Manfred,
>
> Am Freitag, 1. Dezember 2017, 08:41:28 CET schrieb Manfred Spraul:
>>>> Image after that command:
>>>> https://sourceforge.net/projects/calculix-rpm/files/ubifs/image-168169.bi
>>>> n/d ownload
>>> Which file contains the MTD with chk_fs being enabled?
>> I'm not sure if this help, it only adds more data that will confuse:
>> The image.bin is obviously identical, I have only enabled chk_fs for the
>> replay.
>>
>> And: The mount was done using 4.14, the image was created using 4.14-rc5.
>> If you want: Here is the data (dmesg output + images)
>> https://sourceforge.net/projects/calculix-rpm/files/ubifs/chkfs_4.14/
> I still don't get which Image is the right one.
> I gave image-168167.bin a try, but it contains many errors, I'm not sure
> if it contains the first error.
>
> So, which file do I need to download to get the image that contains the first
> error as detected by chk_fs?
>
> The mode of operation of your tool should be:
> 1. Mount UBIFS
> 2. Do various filesystem operations
> 3. Random power-cut (in software)
> 4. Dump the image to a file X
> 5. Set chk_fs to 1
> 6. Mount it again
> 7. If mount succeeds, drop X, umount and goto 1
>     Else if, chk_fs finds a problem. Store file X.
>
> I want file X. :-)
The tool is in release process, thus let's just wait a bit.
There is no "goto 1" in my flow.

Part 1: (done 5x, i.e. with xattr, without xattr, ...)

0. create UBI image, create empty UBIFS image.
1. Mount UBIFS
2. Do various filesystem operations.
    In the background, record nand operations and store it in a trace.

Part 2: (done ~100.000 times)
1. Create an image file X by replaying from the trace.
2. Set chk_fs to 1
3. Mount the image
7. If mount succeeds: ignore the file X
    If mount fails: remember file X

Thus every image is a first error. No image has seen multiple unclean 
unmounts.

--
     Manfred
