Received: from mail-yw0-x22c.google.com ([2607:f8b0:4002:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ae63l-00032k-1R
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 19:15:45 +0000
Received: by mail-yw0-x22c.google.com with SMTP id h129so75921912ywb.1
 for <linux-mtd@lists.infradead.org>; Thu, 10 Mar 2016 11:15:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1457636880.3433.12.camel@perches.com>
References: <20160310190023.GB2545@google.com>
 <1457636880.3433.12.camel@perches.com>
Date: Thu, 10 Mar 2016 11:15:23 -0800
Message-ID: <CAN8TOE-dOUsuPfm8cp6c3k94XRzyyCb1g7sAaPeOdaxS9zG-uA@mail.gmail.com>
Subject: Re: checkpatch.pl false positive: FSF mailing address
From: Brian Norris <computersforpeace@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 10, 2016 at 11:08 AM, Joe Perches <joe@perches.com> wrote:
> On Thu, 2016-03-10 at 11:00 -0800, Brian Norris wrote:
>> Hi Joe,
>
> Hi Brian.
>
>> I found this false positive amusing:
>>
>> $ curl http://patchwork.ozlabs.org/patch/577786/mbox/ | scripts/checkpatch.pl -
>> [...]
>> ERROR: Do not include the paragraph about writing to the Free Software
>> Foundation's mailing address from the sample GPL notice. The FSF has
>> changed addresses in the past, and may do so again. Linux already
>> includes a copy of the GPL.
>> #1489: FILE: drivers/mtd/nand/qcom_nandc.c:1335:
>> +^I^I * write to the free oob area.$
>> [...]
>>
>> The patch is:
>>   http://patchwork.ozlabs.org/patch/577786/
>>   [PATCH v8,2/3] mtd: nand: Qualcomm NAND controller driver
>>
>> and the comment text is:
>>
>>   "For the last codeword, we skip the bbm positions and write to the
>>   free oob area."
>>
>> which matches on this:
>>
>> # Check for FSF mailing addresses.
>>                 if ($rawline =~ /\bwrite to the Free/i ||
>>
>> I'm just writing as recommended by the closing text of your tool.
>
> Thanks.
>
> Yeah, it's amusing.  It's also likely not something worth
> bothering with though as the likelihood of fixing it is low
> and eventually the FSF warning will be minimized or removed
> as no longer necessary.

An easy improvement: don't use "ignore case" for the regex.

> checkpatch is stupid, false positives will always exist.

Regards,
Brian
