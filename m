Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rt97S-0002nx-EY
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 02:43:24 +0000
Received: by wgbdt13 with SMTP id dt13so2206744wgb.18
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 18:43:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4F283C59.2050800@freescale.com>
References: <201201040148.32847.marek.vasut@gmail.com>
 <201201050038.39448.marek.vasut@gmail.com>
 <4F04E558.7000002@freescale.com>
 <201201311233.06949.marek.vasut@gmail.com>
 <4F282519.5020802@gmail.com> <4F283C59.2050800@freescale.com>
Date: Thu, 2 Feb 2012 18:43:18 -0800
Message-ID: <CAN8TOE-Tx52D+96wy-jxcOBxrXqkbT9s6nSGdD3V7dFwR82m0g@mail.gmail.com>
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

On Tue, Jan 31, 2012 at 11:09 AM, Scott Wood <scottwood@freescale.com> wrot=
e:
> On 01/31/2012 11:30 AM, Brian Norris wrote:
>> There's another distinct possibility (one that I use on an out-of-tree
>> driver): instead of calling "nand_scan()", separate it into its two
>> sub-functions "nand_scan_ident()" and "nand_scan_tail()" so you have
>> something like this
>>
>> =A0 =A0 ret =3D nand_scan_ident(mtd, pdata->max_chip_count, NULL);
>> =A0 =A0 chip->options |=3D NAND_NO_SUBPAGE_WRITE;
>> =A0 =A0 if (!ret)
>> =A0 =A0 =A0 =A0 =A0 =A0 ret =3D nand_scan_tail(mtd);
>>
>> That way your option is set after we mask with NAND_CHIPOPTIONS_MSK. I'm
>> not sure if this solution is better than really trying to tackle the
>> issue of why we have that mask and whether it is still needed, but it
>> solves the problem.
>
>
> It's a bit hackish, but should work. =A0Why not get just rid of the mask,
> though, if it's not actually doing anything constructive and is
> requiring such workarounds?

I'm not sure "why not." I hadn't looked at it in enough detail to tell
for sure. I was just providing my own solution, which doesn't require
any big system changes.

And actually, I think that my solution isn't really too "hackish." I
believe nand_scan_ident() and nand_scan_tail() are intentionally
exported separately to support some driver-level tweaking between the
initialization steps. For instance, my systems use the
nand_base-detected parameters (size, page size, etc.) to initialize
controller values before continuing to the tail, where we build our
BBT. I don't see why other options can't be tweaked here as well.

But I do see how, on a system that otherwise could use the default
nand_scan() interface, it seems counterintuitive that you cannot set
NAND_NO_SUBPAGE_WRITE before scanning.

Brian
