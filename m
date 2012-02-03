Received: from mail-ww0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rt9d7-0003xY-CP
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 03:16:06 +0000
Received: by wgbdt11 with SMTP id dt11so763953wgb.0
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 19:16:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4F04E558.7000002@freescale.com>
References: <201201040148.32847.marek.vasut@gmail.com>
 <201201042232.26781.marek.vasut@gmail.com>
 <4F04C93C.2090308@freescale.com>
 <201201050038.39448.marek.vasut@gmail.com>
 <4F04E558.7000002@freescale.com>
Date: Thu, 2 Feb 2012 19:16:03 -0800
Message-ID: <CAN8TOE86VckQKQQYhyUXnJjx9rWxxc6g0AJbrXfi-RJVACUvAA@mail.gmail.com>
Subject: Re: GPMI-NAND: Wrong ECC size in driver
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 4, 2012 at 3:48 PM, Scott Wood <scottwood@freescale.com> wrote:
> On 01/04/2012 05:38 PM, Marek Vasut wrote:
>> Scott Wood wrote:
>>> On 01/04/2012 03:32 PM, Marek Vasut wrote:
>>>> Scott Wood wrote:
>>>>> Can we just get rid of NAND_CHIPOPTIONS_MSK and trust that drivers wo=
n't
>>>>> set options that aren't appropriate? =A0Possibly replace it with
>>>>> documentation about which options are for chips, which are for driver=
s,
>>>>> and which (such as NAND_NO_SUBPAGE_WRITE) can be set by either.
>>>>
>>>> Rather let's just adjust the mask?
>>>
>>> The way the mask is used means that any given option can only be chip o=
r
>>> driver, not both. =A0Though, I don't see anywhere this option is set by=
 a
>>> chip -- maybe we can just renumber it to be in the controller half.
>>
>> I suspect this was meant to allow controllers where one chip can do subp=
age-
>> write and the other can not.
>
> What I mean is I don't see any place where this is actually used --
> gpmi-nand is the only place I see this flag being set (though it belongs
> on at least elbc as well).

It's never actually set per-chip (i.e., it's not in the nand_ids table
or similar), so I don't see a problem with Scott's suggestion: "maybe
we can just renumber it to be in the controller half." But that may
not be the best way (see below)

>>> I still don't see a whole lot of value in the mask, though -- seems to
>>> be just causing problems, especially given that bits set by the "wrong"
>>> component are silently discarded.
>>
>> Yes. Patch is welcome to remove it and separate these two ;-)
>
> Do they need to be separated? =A0Just OR them with no mask. =A0If either =
the
> controller or the chip set the flag, then it's set, and subpage writes
> are disallowed. =A0Obviously you can only do this for certain types of
> options -- for others, just don't set the flag in an inappropriate contex=
t.

It looks like this might work as well. Now that I look at the code a
bit, it seems that there's at least one other option
(NAND_NO_AUTOINCR) which is sometimes set by the controller *and*
per-chip (in nand_ids.c) but the per-chip option will always be
silently masked out in nand_base.c:

  chip->options |=3D type->options & NAND_CHIPOPTIONS_MSK;

But it also seems that NAND_NO_AUTOINCR has no effect in the kernel
anyway... (seems like we should just kill the option, then, right? But
I digress...)

So there seems to be more than one issue related to a mostly
unnecessary mask, and unless there's a strong reason against it, I
like Scott's last suggestions a little better ("Just OR them with no
mask" and "just don't set the flag in an inappropriate context").

Brian
