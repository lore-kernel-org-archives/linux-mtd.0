Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmZiX-0002YM-Qg
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 22:05:45 +0000
Message-ID: <4C6EFC21.1080605@broadcom.com>
Date: Fri, 20 Aug 2010 15:05:21 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: Bad assumption about ID field definition for Samsung NAND?
References: <20100818180538.GA12238@code-monkey.de>
	<4C6C6BFC.9020408@broadcom.com> <20100819171558.GA8536@code-monkey.de>
	<AANLkTikiTX6US09pVu+uYm_U5=70WVbF+eH9wBtDeWKM@mail.gmail.com>
	<4C6DAFFD.4040602@broadcom.com>
	<AANLkTi=9RmDvzx-5n0UbnMUj2zMm41b1VA=PQqXK_Wgc@mail.gmail.com>
	<20100820134316.GA437@code-monkey.de> <4C6EBE90.2090604@broadcom.com>
	<1282334008.25239.91.camel@localhost> <4C6EED3B.4000001@broadcom.com>
	<1282340081.25239.134.camel@localhost>
In-Reply-To: <1282340081.25239.134.camel@localhost>
Content-Type: text/plain;
 charset=utf-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: "r64343@freescale.com" <r64343@freescale.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	Tilman Sauerbeck <tilman@code-monkey.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/20/2010 02:34 PM, David Woodhouse wrote:
> On Fri, 2010-08-20 at 14:01 -0700, Brian Norris wrote:
>>> Can I have a signed-off-by for it?
>>
>> I don't know what's "legal" here. I'm appending the patch with a
>> sign-off for me and Tilman (since Tilman authored it). Hopefully that's
>> ok.
>
> You have to cut and paste Tilman's own Signed-off-by: header; the magic
> doesn't work if you type it yourself. :)

I'm glad someone has a sense of humor (or humour, depending on the country)

>> I'm really no expert on how inclusion for different versions goes; I
>> just send 'em to you! Anyway, this patch is *very* important:
>> 	* [PATCH] mtd: nand: Fix regression in BBM detection
>> 	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031594.html
>> It addresses issues I overlooked with a lot of Hynix small-page NAND
>> (and others).
>
> That's in the tree already:
> http://git.infradead.org/mtd-2.6.git/commitdiff/065a1ed8

I realized that right after sending this.

>> Other patches - they are ready, but not as important:
>> 	* Spansion ORNAND
>> 	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031603.html
>> 	* New Samsung MLC OOB sizes
>> 	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031621.html
>
> Those aren't regressions or important bug-fixes, so given the timing I
> think they've missed the merge window and are now candidates for 2.6.37
> rather than 2.6.36?
>
> I'll merge them as soon as I've asked Linus to pull what's in the tree
> right now. Unless you object to my classification?

No objection.

> Just FYI; not to criticise when you're doing such excellent work -- this
> would ideally have a From: and Subject: "header" indicating that Tilman
> is the author, and giving the first line of the commit comment. That
> way, running 'git-am' on it would fairly much work. Not that it's a
> problem for me to do it either, of course.

I see. (Thanks for the compliment, btw, I'm rather new to this)

Brian
