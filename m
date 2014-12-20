Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2B21-0003I3-7K
 for linux-mtd@lists.infradead.org; Sat, 20 Dec 2014 03:48:42 +0000
Received: by mail-wi0-f182.google.com with SMTP id h11so3542645wiw.9
 for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2014 19:48:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <549444E0.8050109@codeaurora.org>
References: <CAOx4H9CgOoxu82M9cpmFcRdfn=n7mQOwOVzVqvhdUiyzddEPSw@mail.gmail.com>
 <549444E0.8050109@codeaurora.org>
Date: Sat, 20 Dec 2014 11:48:18 +0800
Message-ID: <CAOx4H9AQyADPd_ia6prO4OXUZrjaUJKBWKzL_onihaDaA5JqDg@mail.gmail.com>
Subject: Re: Get error -74 (ECC error) during ubiattach
From: t kevin <kevint324@gmail.com>
To: Tanya Brokhman <tlinder@codeaurora.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tanya,

Thanks for the suggestion.
I create the UBIFS by ubiformat+ubimkvol. It was fine at the very
beginning and that error message pops out after a few erase cycles (<
10).
I'm wondering what can I do to fix the problem instead of erase
everything to make it go away.

Thanks
Kevin

2014-12-19 23:31 GMT+08:00 Tanya Brokhman <tlinder@codeaurora.org>:
> On 12/19/2014 2:24 PM, t kevin wrote:
>>
>> Hi all,
>>
>> I get below error message everytime when my box boots up.
>> It appears there is a ECC error. But such errors should be taken care
>> by UBI/UBIFS itself, right?
>> Is it because the background thread "ubi_bgt2d" has not started yet so
>> no one could do the data scrubbing during ubiattach stage?
>> Is it possible to do something like a fsck.ubifs to fix this issue?
>>
>> The system can boot up correctly but this message is kind of terrifying.
>
>
> Hi Kevin
>
> Is it always the same block/offset? If so then Richard is right, the PEB
> probably got bad.
> Is this first boot up after flashing the image? I encountered similar
> behavior on first boot up after flashing the image. What helped me is to
> generate the image with -F flag, or use a UBI-aware flasher (ubiformat for
> example) to flash it.
>
>
> Thanks,
> Tanya Brokhman
> --
> Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
