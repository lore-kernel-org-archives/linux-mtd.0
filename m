Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtZ44-0003Hy-Hn
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 10:43:45 +0000
Message-ID: <1446547391.6126.145.camel@gmail.com>
Subject: Re: UBIFS corruption after power cut - possibly unstable bits issue?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Michal Suchanek <hramrach@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Tim Harvey <tharvey@gateworks.com>, Adrian Hunter
 <adrian.hunter@intel.com>,  MTD Maling List <linux-mtd@lists.infradead.org>
Date: Tue, 03 Nov 2015 12:43:11 +0200
In-Reply-To: <CAOMqctQz=MnPMw2Dq-SFGwa1g7tPw7jG25Rh9=W4xkw-__HXDg@mail.gmail.com>
References: <CAJ+vNU3eu4qBxaZpDRY=Fidv=9iGmA5pq8b4yUfyBayLTos5oQ@mail.gmail.com>
 <562E8697.50207@nod.at>
 <CAOMqctQz=MnPMw2Dq-SFGwa1g7tPw7jG25Rh9=W4xkw-__HXDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-11-03 at 11:06 +0100, Michal Suchanek wrote:
> it has been pointed out that this assumption on the part of UBI that
> erased pages are composed of 0xff bytes is just wrong.
> 
> Here it is wrong in the sense that the pages are not bit-perfect but
> there are other reasons why it may go wrong.
> 
> - if the nand controller uses randomization layer the pages are 0xff
> bytes transformed by the randomization layer
> 
> - if MTD grows full-disk encryption then reading a page of 0xff bytes
> will yield what this page decrypts to using current encryption scheme
> 
> The layering is wrong here. The MTD core should provide a function to
> check if a physical page is empty and the driver should provide
> driver-specific implementation if needed.

Yes, this was discussed, and the missing part is patches. The reason I
am replying to you is that I find the wording you are using to be
inaccurate.

The assumptions were not wrong when this stuff was designed,
implemented, tested and used in production. And for that hardware they
are not wrong.

Nowadays the situation is different, the HW is different. It is not the
same as the HW UBIFS was implemented and tested for. UBIFS needs to be
adjusted in order to support that hardware. "Wrong wrong wrong" is
incorrect wording, please do not use it. Please, use "needs more work",
"needs extending", "needs to support bit-flips in empty space", etc.

And layering is not wrong. We do not implement useless MTD methods for
something which does not exist in the Linux kernel. Please, introduce
the encryption support, introduce that driver with that method, and
then refactor the code. Please, do not use word "wrong", because it is
not the correct word for this situation, and it is unnecessarily
negative.

Thank you!
