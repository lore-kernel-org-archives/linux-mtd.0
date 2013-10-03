Received: from mail-qc0-x232.google.com ([2607:f8b0:400d:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRe3w-0003H7-LT
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 08:15:09 +0000
Received: by mail-qc0-f178.google.com with SMTP id r5so1372751qcx.37
 for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2013 01:14:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHqTa-1NhB4+zNkpSe3Ojw6ZywVBrxuPY1ZcWrN47nXeoBxWBg@mail.gmail.com>
References: <CAHqTa-0d=U+W2nju8WeCJ=gL+ja8DVuK0BUquajOL6qXV5C0+g@mail.gmail.com>
 <l2grtn$svg$1@ger.gmane.org>
 <CAHqTa-3HxoQJ=wEZ_w8Vcp9VXS12=xNbiJ2v8fSsJbMb9BT_4w@mail.gmail.com>
 <alpine.DEB.2.00.1310030932150.18310@lnxricardw.se.axis.com>
 <CAHqTa-1NhB4+zNkpSe3Ojw6ZywVBrxuPY1ZcWrN47nXeoBxWBg@mail.gmail.com>
Date: Thu, 3 Oct 2013 10:14:47 +0200
Message-ID: <CAMiSF3AdXYaJMd7qu0VM91e0g9CVOOdN0F_Ci4fwFrMacGLWFQ@mail.gmail.com>
Subject: Re: Page corruption when writing non-sequential pages in an MLC NAND
 eraseblock
From: Romain Izard <romain.izard.pro@gmail.com>
To: Avery Pennarun <apenwarr@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/10/3 Avery Pennarun <apenwarr@gmail.com>:
> On Thu, Oct 3, 2013 at 12:40 AM, Ricard Wanderlof
> <ricard.wanderlof@axis.com> wrote:
>> Just because they place the constraint on the user that the pages must be
>> written in order doesn't mean that the device necessarily will malfunction
>> if the user violates this. It just means that the designers have the freedom
>> to introduce dependencies between the page writes if it makes the design
>> easier/better/possible/whatever. It could very well be that for a given
>> flash it is possible to do some writes out of order, but to avoid a) tying
>> down the actual possibilities for a given flash and b) complicating the
>> facts for the user they just specify that 'page writes must be executed in
>> order'.
>>
>> I must admit I wasn't aware of this fact either, but I have no hands-on
>> experience with MLC flashes on the other hand.
>
> It seems rather under-documented to me, and I wouldn't be overly
> surprised if it's not so much "standard behaviour" as "behaviour some
> chip makers decided they could get away with based on usage patterns."
>  But ok.
>

It's right there in the datasheet for both MLC manufacturers I have worked with.
And it seems that even SLC flash with large blocks [1] can also have the
same constraint.

There is very interesting technical presentation from Micron [2] that explains
all the issues with NAND flash, and that states that the write order
is necessary
to reduce the 'program disturb' issues.

[1] http://permalink.gmane.org/gmane.linux.drivers.mtd/20182
[2] https://www.micron.com/~/media/Documents/Products/Presentation/flash_mem_summit_jcooke_inconvenient_truths_nand.pdf

Regards,
-- 
Romain Izard
