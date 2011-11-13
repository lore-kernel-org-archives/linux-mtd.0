Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RPd4t-0001cI-Cw
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2011 16:38:44 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 07/16] mtd/docg3: add OOB layout to mtdinfo
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
 <1320912342-30147-8-git-send-email-robert.jarzmik@free.fr>
 <4EBECB89.2020102@newsguy.com> <87vcqoiavr.fsf@free.fr>
 <1321188825.2273.4.camel@koala>
 <1321189398.2021.5.camel@shinybook.infradead.org>
 <1321191352.2273.14.camel@koala>
Date: Sun, 13 Nov 2011 17:38:31 +0100
In-Reply-To: <1321191352.2273.14.camel@koala> (Artem Bityutskiy's message of
 "Sun, 13 Nov 2011 15:35:49 +0200")
Message-ID: <87ehxchta0.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, Ivan Djelic <ivan.djelic@parrot.com>,
 Mike Dunn <mikedunn@newsguy.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> What Robert says is that we probably need an is_page_blank() and let the
> driver implement it optimally, or make MTD fall-back to 0xFFs
> comparison.
>
> This is my understanding.
And that's exactly my point.

And while we're discussing MTD API, I'd like to add another thing I was thinking
of, from a conversation Mike and Ivan had.

They discussed how UBIFS is "intolerant" to bitflips, and marks a block as
"unusable" if one bitflip occured, even if the ECC can fix much more.

What I was thinking is that the MTD oob information which exposes how many ECC
are available should expose as well how many bitflips can be fixed (for example
4 bitflips can be fixed, 5 bitflips can be detected). Then, the read_oob()
function could return back 0 if read was successful, -Exxxx on error, or a
positive number N if N bitflips were fixed.
With this information, upper level could decide from (read_oob() return and
ecc.fixable_bitflips) if a block should be marked as unusable (worn out) or not.

I'd like some feedback on this idea as well.

Cheers.

--
Robert
