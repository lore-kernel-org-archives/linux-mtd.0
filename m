Received: from nf-out-0910.google.com ([64.233.182.187])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMQ2a-0007lF-Ft
	for linux-mtd@lists.infradead.org; Sun, 10 Sep 2006 15:12:09 +0100
Received: by nf-out-0910.google.com with SMTP id l37so1137308nfc
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Sep 2006 07:11:05 -0700 (PDT)
Message-ID: <625fc13d0609100711k1555d439ve7f3e15c63378e87@mail.gmail.com>
Date: Sun, 10 Sep 2006 09:11:04 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dedekind@yandex.ru
Subject: Re: State of UBI
In-Reply-To: <4504146D.000002.20805@webmail12.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
	<625fc13d0609100532n58933486l3f66715c38172cd5@mail.gmail.com>
	<4504146D.000002.20805@webmail12.yandex.ru>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/10/06, dedekind <dedekind@yandex.ru> wrote:
> >> 1. "double page writes on NAND" - it needs MTD changes and zero UBI changes.
> >
> >I'll politely disagree here.  UBI _does_ need this on NAND to be
> >really usable.  Otherwise you eat 2 pages per block for UBI metadata,
> >and that is quite a bit of overhead for a handful of bytes in the
> >structures.
> Josh, I politely ask you to read what I said once more, sorry :-).
>
> I didn't say the "double page" stuff is not needed. I agree that it *is*
> needed, and is very important!
>
> What I said is that this feature requires *zero changes in UBI code*.
> It requires changes in *MTD* code. So this is why I said it
> does not really relate to UBI itself, it relates to what I called
> "about UBI" in the previous mail. :-) See what I mean?

Sure, I know the changes need to be made in MTD and not UBI.  But I
think it's important enough to wait for MTD to get that fix before
merging UBI.  I didn't mean to imply that this was somehow a UBI
problem, but rather something that was hindering UBI in general.

Look at it from a user's perspective.  Someone tells you that UBI is
really cool and you should use it, but then you find out you have to
spend 4KiB per eraseblock in overhead on large page NAND devices.
It's just not that appealing.


> >> 2. Better UBI utilities as I find the current ones not ideal.
> >What do you find lacking or not ideal?  I'm just curious.
>
> I dislike that the utilities accept UBI device number instead of UBI
> character device name. And they internally form the UBI device name
> using hardcoded "/dev/ubi%d" pattern. It it insane. I may want to name
> my UBI devices differently.

Hm, ok.  I haven't looked, but that doesn't sound too hard to fix.
Perhaps the current behavior could be left as default.

> I'm partially guilty in this because I started the libubi library with
> this insane feature. But I wrote it for my tests and didn't mean to
> use it as a generic library. Then I created a new sane version of ubilib
> but people had written most of the UBI utilities using the old insane one
> by that time...

Well, nothing has been merged yet so it's easy to fix

> Also, the ubimkvol utility works only for ubi0 device and does not
> work for ubi1 device. I did not dig why.

Sounds like a bug to me.

josh
