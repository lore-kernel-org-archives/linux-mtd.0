Received: from mail-vc0-x234.google.com ([2607:f8b0:400c:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YM2P1-0008QY-8I
 for linux-mtd@lists.infradead.org; Thu, 12 Feb 2015 22:38:32 +0000
Received: by mail-vc0-f180.google.com with SMTP id im6so4811850vcb.11
 for <linux-mtd@lists.infradead.org>; Thu, 12 Feb 2015 14:38:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54B04529.8060705@vanguardiasur.com.ar>
References: <1419017238-28809-1-git-send-email-dehrenberg@chromium.org>
 <54B04529.8060705@vanguardiasur.com.ar>
Date: Thu, 12 Feb 2015 23:38:09 +0100
Message-ID: <CAFLxGvxq46LZXhXGvNSXV0PvrLxvbFPp0f-weKJRweeEbOyV-A@mail.gmail.com>
Subject: Re: [PATCH v5] UBI: block: Continue creating ubiblocks after an
 initialization error
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
Cc: Grant Grundler <grundler@chromium.org>,
 Gwendal Grignou <gwendal@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 9, 2015 at 10:16 PM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> On 12/19/2014 04:27 PM, Dan Ehrenberg wrote:
>> If one ubi volume is corrupted but another is not, it should be
>> possible to initialize that ubiblock from a kernel commandline which
>> includes both of them. This patch changes the error handling behavior
>> in initializing ubiblock to ensure that all parameters are attempted
>> even if one fails. If there is a failure, it is logged on dmesg.
>> It also makes error messages more descriptive by including the
>> name of the UBI volume that failed.
>>
>> Tested: Formatted ubi volume /dev/ubi5_0 in a corrupt way and
>> dev/ubi3_0 properly and included "ubi.block=5,0 ubi.block=3,0" on
>> the kernel command line. At boot, I see the following in the console:
>> [   21.082420] UBI error: ubiblock_create_from_param: block: can't open volume on ubi5_0, err=-19
>> [   21.084268] UBI: ubiblock3_0 created from ubi3:0(rootfs)
>>
>> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Applied, thank you Daniel and Ezequiel!

-- 
Thanks,
//richard
