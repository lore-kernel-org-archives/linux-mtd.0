Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4EGj-0000bS-8a
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 20:44:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id E294D28C0E0
 for <linux-mtd@lists.infradead.org>; Wed,  2 Dec 2015 21:44:23 +0100 (CET)
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
 [209.85.215.48])
 by arrakis.dune.hu (Postfix) with ESMTPSA id 9046228C0BC
 for <linux-mtd@lists.infradead.org>; Wed,  2 Dec 2015 21:44:18 +0100 (CET)
Received: by lfs39 with SMTP id 39so63175491lfs.3
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2015 12:44:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <565F51D2.4010204@simon.arlott.org.uk>
References: <5659FF4A.7080203@simon.arlott.org.uk>
 <CAOiHx=nMZwQK9ESw9Ggqc6pHWqYQriB-t2eWq++pke8cXhvupw@mail.gmail.com>
 <565F51D2.4010204@simon.arlott.org.uk>
From: Jonas Gorski <jogo@openwrt.org>
Date: Wed, 2 Dec 2015 21:44:04 +0100
Message-ID: <CAOiHx=mLmEW=gK_HE6oVqaFZjMUAWoP1PxZchc_mC_A5PJn-Cw@mail.gmail.com>
Subject: Re: [PATCH] mtd: brcmnand: Workaround false ECC uncorrectable errors
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 2, 2015 at 9:17 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
> On 01/12/15 10:41, Jonas Gorski wrote:
>> On Sat, Nov 28, 2015 at 8:23 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
>>> +
>>> +       /* Go to start of buffer */
>>> +       buf -= FC_WORDS;
>>> +
>>> +       /* Erased if all data bytes are 0xFF */
>>> +       buf_erased = memchr_inv(buf, 0xFF, FC_WORDS) == NULL;
>>> +
>>> +       if (!buf_erased)
>>> +               goto out_free;
>>
>> We now have a function exactly for that use case in 4.4,
>> nand_check_erased_buf [1], consider using that. This also has the
>> benefit of treating bit flips as correctable as long as the ECC scheme
>> is strong enough.
>
> I have no idea whether or not it's appropriate to specify
> bitflips_threshold > 0 so it'd just be a more complex way to do
> a memchr_inv() search for 0xFF.

The threshold would be the amount of bitflips the code can correct, so
basically ecc.strength (at least that is my understanding).

> The code also has to check for the hamming code bytes being all 0x00,
> because according to the comments [2], the controller also has
> difficulty with the non-erased all-0xFFs scenario too.

According to brcmnand.c hamming can fix up to fifteen bitflips, but in
the current code you would fail a hamming protected all-0xff-page for
even a single bitflip in the data or in the ecc bytes, which means
that all-0xff-pages wouldn't be protected at all.


Jonas
