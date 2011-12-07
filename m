Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYMIU-0007ES-Eo
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 18:32:51 +0000
Message-ID: <4EDFB142.6050208@newsguy.com>
Date: Wed, 07 Dec 2011 10:32:34 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
 <4EDB3295.6040201@bitbox.co.uk> <4EDB7B1D.60603@newsguy.com>
 <1323009827.9400.75.camel@sauron.fi.intel.com> <4EDB89E9.6070306@newsguy.com>
 <1323065234.2316.2.camel@koala> <4EDCF840.7050107@newsguy.com>
 <4EDCFAAC.90709@bitbox.co.uk> <4EDD142B.6090303@newsguy.com>
 <87hb1de5b6.fsf@free.fr> <4EDECC7A.1080202@newsguy.com>
 <Pine.LNX.4.64.1112070848340.32119@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1112070848340.32119@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Peter Horton <phorton@bitbox.co.uk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ricard, thanks for chiming in.

On 12/07/2011 12:01 AM, Ricard Wanderlof wrote:
>
>
> So, something like this:
> - The driver reports number of bit flips and current ECC strength etc to
>   the mtd layer.
> - Based on some userspace knob, the mtd framework reports -EUCLEAN if
>   scrubbing is needed.
> - Upper layers perform scrubbing if they want to (i.e. UBI) or not (i.e.
>   JFFS2).


Sounds like a nice compromise between user configurability and keeping the
decision in the mtd layer.  The problem is that the read method currently goes
directly to the driver, so all drivers would have to be patched.  The last patch
I submitted was rejected as being too large.  And it can't be broken into
smaller patches because they are interdependent and not bisectable. 
Implementing this scheme would be an even larger patch, and the changes made to
every driver would bear scrutiny.


>
> I don't really see this as lying, more of a redefinition of what -EUCLEAN
> really means. The current behavior was invented when single-bit errors could
> be correct and nothing else, 


That is clear.  In mtdconcat.c, ecc_stats.corrected is incremented by one when
mtd->read() returns -EUCLEAN.


> and furthermore such bitflips were rare; now that multiple-bit errors are
> commonplace it's time to put more detail into what -EUCLEAN implies.  It's not
> really breaking anything old either, if sane defaults are used.
>


I'm willing to implement whatever consensus emerges, but I need buy-in from the
maintainers before I spend more time on it.

Thanks,
Mike
