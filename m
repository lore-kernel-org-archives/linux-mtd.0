Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9u1h-0006HY-8v
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 11:48:34 +0000
Message-ID: <559281F7.5070908@codeaurora.org>
Date: Tue, 30 Jun 2015 14:48:07 +0300
From: "Brokhman, Tanya" <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 reddyn@codeaurora.org
Subject: Re: ubifs_recover_leb() failure
References: <558C04BD.7030101@codeaurora.org> <558C0612.7070309@nod.at>
In-Reply-To: <558C0612.7070309@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard

On 6/25/2015 4:45 PM, Richard Weinberger wrote:
> Hi!
>
> Am 25.06.2015 um 15:40 schrieb Brokhman, Tanya:
>> Hi Richard et. al,
>>
>> We recently encountered the following error messages:
>>
>> UBIFS-0 error (pid 1): ubifs_recover_leb: corrupt empty space LEB 159:32768, corruption starts at 3810
>>
>> UBIFS-0 error (pid 1): ubifs_scanned_corruption: corruption at LEB 159:36578
>>
>> UBIFS-0 error (pid 1): ubifs_scanned_corruption: first 8192 bytes from LEB 159:36578
>>
>> 00000000: fffffffe ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
>>
>> 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff fffffffd ffffffff ffffffff  ................................
>>
>>
>> The test scenario is simple: power cut while writing.
>> We run this in a loop and the issue is not easily reproducible but the failure is constant.
>>
>> We're working with a 3.10 based kernel, fastmap enabled. I saw that you released a lot of fixes in fastmap (~46).
>> I picked up these below 2 as they seemed to resolve a similar issue:
>> 1. UBI: Fastmap: Fix race in ubi_eba_atomic_leb_change() - http://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git/commit/?id=36a87e44f642966442fd0d23f2ec536851e00236
>> 2. UBI: Fastmap: Fix races in ubi_wl_get_peb() - http://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git/commit/?id=d59f21bebe9d0fda34027ff1afda4f2b0d5f1869
>>
>> Unfortunately, even with these fixes, the issue is still reproducible.
>> Picking up all 46 fixes is a bit risky since I will be picking them out of context, without other related ubi patches.
>> I was wondering if you encountered similar error message and was hoping that you could advise me on a shorter list of patches to pick up.
> Please apply all patches. They depend on each other and fix a lot of nasty issues.
>
> Currently I have a similar corruption to analyze on my desk. Maybe you're hitting the same one.
> If you can trigger the issue using a fully patched kernel, I'd love to get a copy of the corrupted image.

Thank you for your inputs!
Unfortunately I'm bound by our legal team from sharing any images.
Applying all of the FM patches didn't go easily, so we did a different 
test - tried to disable fastmap and reproduce the issue. We're hitting 
bitflips now but the original issue is not reproduced and the build is 
significantly more stable now.
Hope this helps you with your issue.

Thanks
-Tanya

-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
