Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RPaDz-0007Fa-BL
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2011 13:35:56 +0000
Received: by bkat2 with SMTP id t2so7129159bka.36
 for <linux-mtd@lists.infradead.org>; Sun, 13 Nov 2011 05:35:53 -0800 (PST)
Subject: Re: [PATCH v2 07/16] mtd/docg3: add OOB layout to mtdinfo
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Sun, 13 Nov 2011 15:35:49 +0200
In-Reply-To: <1321189398.2021.5.camel@shinybook.infradead.org>
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
 <1320912342-30147-8-git-send-email-robert.jarzmik@free.fr>
 <4EBECB89.2020102@newsguy.com> <87vcqoiavr.fsf@free.fr>
 <1321188825.2273.4.camel@koala>
 <1321189398.2021.5.camel@shinybook.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321191352.2273.14.camel@koala>
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-11-13 at 13:03 +0000, David Woodhouse wrote:
> On Sun, 2011-11-13 at 14:53 +0200, Artem Bityutskiy wrote:
> > On Sun, 2011-11-13 at 11:18 +0100, Robert Jarzmik wrote:
> > > I personally think this should be provided by the MTD API. A function
> > > is_page_blank(ofs) could tell if the page was written or not. Now if the
> > > function is NULL, the upper layer (UBIFS, ...) could decide _by itself_ to
> > > assign a free OOB byte to that meaning. But IMHO it's not the drivers duty to
> > > take these decisions to restrict the OOB, let it be done at an upper level.
> > 
> > Probably it is a good idea to introduce an mtd_is_page_blank. But it
> > should either work for all flashes or not introduced at all. I do not
> > think upper layers should use OOB at all. And this interface should also
> > work for NOR flash. Probably it should just fall-back to comparing the
> > data with 0xFF if the driver cannot offer anything special. 
> 
> We *tried* comparing with 0xFF in JFFS2 and found that it wasn't good
> enough (it could be *mostly* erased before a powerfail but not
> completely, so as soon as you start to program it you get a lot of
> bitflips). Hence the cleanmarkers.
> 
> The only way you can treat a page as erased is if you *know* it was
> successfully erased. So I'd be reluctant to introduce a function that
> encourages people to draw inferences they shouldn't.

That's a bit different. Nowadays no one tries to compare to 0xFFs to
check if an eraseblock is erased or not :-)

This is about the situation when you have an eraseblock with data, and
you want to find where it ends, e.g., you want to find the first blank
NAND page. Both JFFS2 and UBIFS search for 0xFFs. It worked for many
years, but modern NANDs have bit-flips even in empty space, so reading a
never written NAND page may return mostly 0xFFs, but with few bits set
to 0. Modern NANDs have strong ECC which can handle 4 bit errors and
above. According to Ivan, manufacturers say it is expected and OK.

No make SW like JFFS2 and UBIFS work, modern drivers need to
either correct bit-flips on blank pages automatically, or be able to
quickly distinguish between blank and non-blank pages and memset the
buffer with 0xFFs for the former case.

What Robert says is that we probably need an is_page_blank() and let the
driver implement it optimally, or make MTD fall-back to 0xFFs
comparison.

This is my understanding.

Artem.
