Received: from webmail12.mail.yandex.net ([213.180.223.102])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMPW5-0004tB-MY
	for linux-mtd@lists.infradead.org; Sun, 10 Sep 2006 14:38:34 +0100
Date: Sun, 10 Sep 2006 17:34:37 +0400 (MSD)
From: "dedekind" <dedekind@yandex.ru>
Sender: dedekind@yandex.ru
Message-Id: <4504146D.000002.20805@webmail12.yandex.ru>
MIME-Version: 1.0
Errors-To: dedekind@yandex.ru
To: jwboyer@gmail.com
Subject: Re: State of UBI
In-Reply-To: <625fc13d0609100532n58933486l3f66715c38172cd5@mail.gmail.com>
References: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
	<625fc13d0609100532n58933486l3f66715c38172cd5@mail.gmail.com>
Content-Type: text/plain;
  charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
Reply-To: dedekind@yandex.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> 1. "double page writes on NAND" - it needs MTD changes and zero UBI changes.
>
>I'll politely disagree here.  UBI _does_ need this on NAND to be
>really usable.  Otherwise you eat 2 pages per block for UBI metadata,
>and that is quite a bit of overhead for a handful of bytes in the
>structures.
Josh, I politely ask you to read what I said once more, sorry :-).

I didn't say the "double page" stuff is not needed. I agree that it *is*
needed, and is very important!

What I said is that this feature requires *zero changes in UBI code*. 
It requires changes in *MTD* code. So this is why I said it
does not really relate to UBI itself, it relates to what I called
"about UBI" in the previous mail. :-) See what I mean?

>> 2. Better UBI utilities as I find the current ones not ideal.
>What do you find lacking or not ideal?  I'm just curious.

I dislike that the utilities accept UBI device number instead of UBI
character device name. And they internally form the UBI device name
using hardcoded "/dev/ubi%d" pattern. It it insane. I may want to name
my UBI devices differently.

I'm partially guilty in this because I started the libubi library with
this insane feature. But I wrote it for my tests and didn't mean to
use it as a generic library. Then I created a new sane version of ubilib
but people had written most of the UBI utilities using the old insane one
by that time...

Also, the ubimkvol utility works only for ubi0 device and does not
work for ubi1 device. I did not dig why.

Artem.
