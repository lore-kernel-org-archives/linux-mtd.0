From: David Woodhouse <dwmw2@infradead.org>
To: zhao <forrest.zhao@intel.com>
In-Reply-To: <42B14245.7070500@intel.com>
References: <8126E4F969BA254AB43EA03C59F44E840263CEAE@pdsmsx404>
	<1118827313.22181.52.camel@hades.cambridge.redhat.com>
	<42B11054.4020509@intel.com> <42B12463.4060106@yandex.ru>
	<42B14245.7070500@intel.com>
Content-Type: text/plain
Date: Thu, 16 Jun 2005 11:24:26 +0100
Message-Id: <1118917466.5497.43.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: jffs2 corrupt rarely, how to fix it?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-06-16 at 17:11 +0800, zhao wrote:
> In fact, we were using JFFS2 on kernel 2.4.10.......
> And we encountered some problems(e.g. jffs2 corrupt rarely), it seems 
> that I need to
> back-port JFFS2 in latest 2.4 kernel(2.4.31, right?) to 2.4.10 :( if 
> they are not willing
> to upgrade to latest 2.4 kernel in the product.

If you're using 2.4 and it's mostly fine except for the occasional JFFS2
problem then staying with 2.4 makes some sense. 

I wouldn't backport the current JFFS2 code though -- you want the 2.4
branch which is actually designed and maintained for 2.4. 

That does mean that you need all the inter-related changes to fs/inode.c
which happened from 2.4.20-odd onwards. We added ilookup() and then
there was a couple of rounds of fixes to locking problems with it, I
believe.

Personally, I'd be inclined just to update to 2.4.31 and change the
numbers back to appease whatever idiot in management wants you to
mix-and-match your own new code instead of taking what's been tested by
others and developed as a coherent whole.

If you can reproduce problems in JFFS2 in 2.4.31 (other than that it
takes an age to mount and doesn't work on NAND), then we'd be interested
in fixing those.

Nobody but yourself is ever going to be interested in your own personal
merge of new JFFS2 code and old kernels. Do that if you really want --
it's GPL'd code after all. But don't bother to ask anyone for help with
it.
> 
-- 
dwmw2
