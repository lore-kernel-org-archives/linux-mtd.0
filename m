Received: from smtprelay01.ispgateway.de ([80.67.31.24])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEaww-0008Pp-Hf
 for linux-mtd@lists.infradead.org; Tue, 05 Aug 2014 09:22:34 +0000
Message-ID: <53E0A239.8060209@symeo.com>
Date: Tue, 5 Aug 2014 11:22:01 +0200
From: Christoph Mammitzsch <Christoph.Mammitzsch@symeo.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Disappearing directories (jffs2 on nand flash)
References: <53B6DDA2.7000508@symeo.com>	<53C56392.2070306@symeo.com>	<53DD3A45.7000802@symeo.com>
 <CAFLxGvx2s0dZeRUruhQUPQAVDUrdMTFY7bPCH2-2D6Kg4Lv9bw@mail.gmail.com>
In-Reply-To: <CAFLxGvx2s0dZeRUruhQUPQAVDUrdMTFY7bPCH2-2D6Kg4Lv9bw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 03.08.2014 01:13, schrieb Richard Weinberger:
> On Sat, Aug 2, 2014 at 9:21 PM, Christoph Mammitzsch
> <Christoph.Mammitzsch@symeo.com> wrote:
>> Hello,
>>
>> I am a little astonished at the amount of feedback I got for my
>> bugreport. Apparently jffs2 losing entire directories is not as big a
>> deal as I thought. Does that mean that JFFS2 is dead and I should use
>> another flash filesystem instead, or did I simply post on the wrong
>> mailing list?
> 
> Is there any reason why you are not using UBIFS?

We introduced our first linux based product 2006, so UBIFS was not an
option. Our second linux based product was designed in 2011. Back then
UBIFS was still relatively new, and it seemed beneficial to keep
differences between our two products minimal, so we kept using JFFS2.

Switching to UBIFS now means we would have to update and test quite a
lot of scripts. And providing an update for existing stations would be
even more problematic. Therefore I was hoping for a bugfix, so we could
just deliver a new kernel image and be done with it.


Regards,

Christoph Mammitzsch
