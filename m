Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhJ3z-0000Vk-JW
 for linux-mtd@lists.infradead.org; Tue, 06 Sep 2016 16:17:32 +0000
Received: by mail-oi0-x244.google.com with SMTP id 2so15492234oif.2
 for <linux-mtd@lists.infradead.org>; Tue, 06 Sep 2016 09:17:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <40ec1dc1-210a-77fb-89d5-779b930c3764@opensource.altera.com>
References: <1438886294.23233.6.camel@mramach3-lnx001>
 <40ec1dc1-210a-77fb-89d5-779b930c3764@opensource.altera.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 6 Sep 2016 18:17:08 +0200
Message-ID: <CAFLxGvzeLSP8_FpruSOJ72LCanBumGZTZqwDouZWwEz=Ku-oNg@mail.gmail.com>
Subject: Re: [PATCH] mtd-utils: Support jffs2 flash-erase for large OOB (>32b)
To: Graham Moore <grmoore@opensource.altera.com>
Cc: Manikandan Ramachandran <crmanik@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <goliath@sigma-star.at>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 6, 2016 at 5:22 PM, Graham Moore
<grmoore@opensource.altera.com> wrote:
> On 08/06/2015 01:38 PM, Manikandan Ramachandran wrote:
>>
>> "flash_erase" fails on nand flash with JFFS2 that has OOB size greater
>> than
>> 32 bytes. "flash_erase" uses "MEMGETOOSEL" to determine OOB size. This
>> ioctl
>> call is obsolete and returns error if OOB size is more than 32 bytes.
>>
>> This patch fixes this issue by using "mtd_write" to update clean-marker
>> instead of mtd_oob_write. This fix is based on the discussion:
>> http://lists.infradead.org/pipermail/linux-mtd/2011-September/037958.html.
>>
>
> Hi Manikandan,
>
> I'd like to use this patch in our Angstrom/Yocto builds, but our company
> policy doesn't allow patches that aren't signed off.
>
> I wonder if you could re-post this with your sign-off?  I'd really
> appreciate it.

Not needed, I can do that myself.
Let's get this reviewed and merged. :-)

-- 
Thanks,
//richard
