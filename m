Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eELpX-0008WR-IT
 for linux-mtd@lists.infradead.org; Mon, 13 Nov 2017 20:59:45 +0000
Received: by mail-wm0-x236.google.com with SMTP id r68so17455311wmr.1
 for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2017 12:59:22 -0800 (PST)
Subject: Re: UBIFS does not mount after powerfail
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <5883680.7ftK6mdJzr@blindfold>
From: Manfred Spraul <manfred@colorfullife.com>
Message-ID: <79c9281e-9622-7aec-b3a2-cf7cec1f1e3f@colorfullife.com>
Date: Mon, 13 Nov 2017 21:59:18 +0100
MIME-Version: 1.0
In-Reply-To: <5883680.7ftK6mdJzr@blindfold>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/12/2017 08:54 PM, Richard Weinberger wrote:
> Manfred,
>
> Am Sonntag, 12. November 2017, 20:26:38 CET schrieb Manfred Spraul:
>> Hello together,
>>
>> in a power fail stress test with ubifs, I ran into 5 images that do not
>> mount:
>>
>> 3x ubifs_check_node() fails, called by ubifs_garbage_collect_leb()
>> 2x UBIFS assert failed in ubifs_rcvry_gc_commit at 1219 (pid 9570)
>> (and ~550 images with just asserts, the mount was successful)
>>
>> The test was done using kernel 4.14.0-rc5+ #105 SMP PREEMPT.
>> The test involves create/rename/remove, using ecryptfs with xattr.
>>
>> Are these known issues?
> Nope.
> This should not happen at all. ;-(
>
>> Are there any patches that I should apply?
> No, 4.14 is recent.
>
>> What would you need to analyze them?
> Can you retry without encryptfs and xattr?
> xattrs had already some issues, maybe there are more.
> Just as a start to know where to start digging.
I'll try to do that, but it will take a few days (the tests run at ~800 
power fails per hour)

>> If you need the image (~32 MB), I'll try to find a suitable server.
>> Below is the dmesg output from mounting the first bad image.
> An image would be good but I need one with the 1st generation error.
What do you mean with 1st generation error?
The image prior to the first mount after power fail? I have that.

And I found a server:

https://sourceforge.net/projects/calculix-rpm/files/ubifs/

image-168167.bin is the last image that mounts.
then the next 5 images do not mount
then the next image mounts again.
The images are for mtdram, with the min write size set to 2048.

> Can you please make sure the the UBIFS debugfs knob "chk_fs" is set?
> If set, UBIFS will check the whole filesystem while mounting.
Ok, I'll try that first - but it will take a few days as well.
> Thanks,
> //richard
