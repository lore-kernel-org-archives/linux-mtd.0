Received: from webmail12.mail.yandex.net ([213.180.223.102])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GML20-0006d5-Be
	for linux-mtd@lists.infradead.org; Sun, 10 Sep 2006 09:51:13 +0100
Date: Sun, 10 Sep 2006 12:47:10 +0400 (MSD)
From: "dedekind" <dedekind@yandex.ru>
Sender: dedekind@yandex.ru
Message-Id: <4503D10E.000001.07116@webmail12.yandex.ru>
MIME-Version: 1.0
Errors-To: dedekind@yandex.ru
To: jwboyer@gmail.com
Subject: Re: State of UBI
In-Reply-To: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
References: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
Content-Type: text/plain;
  charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@yandex.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Josh,

>Where are we with UBI?  It seems Artem has been steadily committing
>fixes to the ubi git tree. 
Yes, I'm using it in another project so I stedily add more tiny
features, changes and fixes. Also, one may notice that I maintain
UBI FAQ which has considerably grown.

>I think a good start would be to list what's missing.  I know that it
>needs a patch to allow double page writes on NAND.  There's also the
>missing JFFS2 integration, or rather two competing versions of it.  Is
>there anything else?  Something documented in a TODO list would be
>good.

Well, what you've listed is not what UBI itself needs:
1. "double page writes on NAND" - it needs MTD changes and zero UBI changes.
2. JFFS2 integration also requires zero changes in UBI (as long as it is
sane).

But, well, this is not to start a new contest :-) Let's list want to
have in UBI and around UBI.

I'd add here then:

1. True and extensive unclean reboot testing.
2. Better UBI utilities as I find the current ones not ideal.

>Then there's a matter of when should it be merged.  As it stands right
>now, UBI is in limbo and I'd hate to see something with good potential
>just sit around rotting.  Having a merge goal would perhaps provide
>some motivation.  It could be a date or a kernel version, but it
>should be realistic.

Would be nice to just add it to mtd-2.6.git, IMO. This would be a good
and simple step further.

>So lets come up with some kind of plan to get it reviewed, tested, and
>merged.  My hope would be that all involved so far, or even those that
>want to help out, could reply with their thoughts.  I'm afraid some
>won't for various reasons.  Perhaps if some of us are going to LCA we
>could get together and hash some things out more in detail, but I'd
>rather not wait until then to get things moving.

I think that we should just to merge it with mtd-2.6.git. And all the
promotion stuff may go in parallel. I'm not sure about the plan... LCA
sounds great.

I can only say that I'm going to use it extensively. And I'm already
thinking about a new - scalable UBI implementation.

Artem.
