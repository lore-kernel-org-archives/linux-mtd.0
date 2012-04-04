Received: from mail-qa0-f41.google.com ([209.85.216.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFML5-0002wC-Qx
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2012 09:17:16 +0000
Received: by qafl39 with SMTP id l39so245608qaf.0
 for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2012 02:17:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE-2exM1YomfbiQ_CzkZn=MbotYwSxJnzU6mNVK4WPBNdQ@mail.gmail.com>
References: <CAHMF36FsVeg=ZVtZZz8H6YLj3GhKwD-ofCV1hcJcL5cVVKRK1A@mail.gmail.com>
 <CAN8TOE-2exM1YomfbiQ_CzkZn=MbotYwSxJnzU6mNVK4WPBNdQ@mail.gmail.com>
Date: Wed, 4 Apr 2012 11:17:13 +0200
Message-ID: <CAHMF36GrBOZBTzyBpxD2U+nkBcZExGqkvKY7fkA6494M2PtShw@mail.gmail.com>
Subject: Re: Unstable bits and JFFS2
From: Matej Kupljen <matej.kupljen@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

> On Wed, Mar 28, 2012 at 4:16 AM, Matej Kupljen <matej.kupljen@gmail.com> wrote:
>> during my experiments with the UBIFS crashing, I believe that I am experiencing
>> the "unstable bit" issue.
>>
>> Would another FS, like JFFS2 work on such device, or I'd have the problems on
>> such device with all file systems?
>
> I doubt it. JFFS2 is not supported much anymore, and it is not
> designed for some of the problems with modern NAND flash.

Aha, I see.
Thank you for the information.

> Have you read the information here?
>
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits

Yes, I have. Artem already pointed me to that FAQ.

> I'm not much of an export on UBIFS or unstable bits, but I think that
> there are some unsolved problems. However, before ruling this an
> unstable bits problem, it's a good idea to rule out any other possible
> issues.

Yes, I'll check the MTD driver.

At the moment I am running again integrity check on my UBIFS for
almost 24 hours
now, but until now no error:
# ./integck -n 0 -v -e /media/card

The only difference from previous run, where I saw one bit flip is
that previously
I run the test with power failure option set to ON. Now it is off.

Artem, you said that this unstable bits only happen during power cuts,
is this right?
Would those appear also on simulated power cuts, the ones that can
integck produce?

As for the ECC correction of the empty space, nothing is mentioned in
the manual.
Maybe I should ask the manufacturer of the chip (NXP LPC3152)??
It uses HW error correction included in the FLASH controller, with:
"The error correction code used is Reed-Solomon over GF(2^9). The
primitive polynomial
g(x) over GF(2) is:
g(x) = x9 + x4 +1"

Thank you and Best Regards,
Matej
