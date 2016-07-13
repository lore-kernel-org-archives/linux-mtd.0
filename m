Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNJhv-0004FC-2D
 for linux-mtd@lists.infradead.org; Wed, 13 Jul 2016 12:56:07 +0000
Subject: Re: UBIFS orphans and ro-mounts
To: dedekind1@gmail.com, Boris Brezillon <boris.brezillon@free-electrons.com>
References: <57863442.1000303@sigma-star.at>
 <1468414098.18533.34.camel@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@sigma-star.at>
Message-ID: <57863A51.6030205@sigma-star.at>
Date: Wed, 13 Jul 2016 14:55:45 +0200
MIME-Version: 1.0
In-Reply-To: <1468414098.18533.34.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Am 13.07.2016 um 14:48 schrieb Artem Bityutskiy:
> On Wed, 2016-07-13 at 14:29 +0200, Richard Weinberger wrote:
>> Artem,
>>
>> I wonder why UBIFS processes orphan inodes also when mounting read-
>> only.
> 
> Well, people expect UBIFS to report correct free/used space even if it
> is R/O, right? :-)

Well, I'd say people will understand the on ro-mode free is less than
expected since UBIFS had no chance to garbage collect...

But I agree that changing the current behavior will confuse users. :-(

>> Depending on the workload before a power cut this can take a few
>> seconds
>> and since we mount read-only the updated TNC will not written back to
>> flash,
>> so upon next mount the time is again wasted.
> 
> I see the problem, but I do not agree with word "wasted", because this
> is like doing it for nothing, while UBIFS is doing this for a reason.
> So I'd rather used word "spent". :-)

;-)

>> This hurts boot performance a lot on systems where u-boot loads the
>> kernel
>> from UBIFS.
>> u-boot always mounts UBIFS read-only.
>> So even when Linux mounts UBIFS rw and a powercut happens orphan
>> processing
>> will happen twice.
> 
> Sure, because in the R/O case the results of that processing cannot be
> "saved" on the media, so they have to be repeated.
> 
>> I'd suggest calling ubifs_mount_orphans() only when we mount rw or
>> remount to
>> rw.
>> What do you think?
> 
> I understand the problem. I do not think this is the right solution
> because it'll introduce a regression (incorrect used/free space). But a
> special mount option and/or superblock flag may be considered, if this
> helps substantially.

A new mount option is an option, true.
That said, the real solution is that u-boot (and other bootloaders)
should not mount UBIFS and use static volumes.
But currently the opposite is happening on most systems I get my hands on. :(

Thanks,
//richard
-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
