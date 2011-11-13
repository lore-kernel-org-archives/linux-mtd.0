Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RPgeo-0000Gz-VO
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2011 20:28:03 +0000
Received: by bkat2 with SMTP id t2so7482381bka.36
 for <linux-mtd@lists.infradead.org>; Sun, 13 Nov 2011 12:28:00 -0800 (PST)
Subject: Re: [PATCH v2 07/16] mtd/docg3: add OOB layout to mtdinfo
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Sun, 13 Nov 2011 22:27:50 +0200
In-Reply-To: <4EC020A2.9070003@newsguy.com>
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
 <1320912342-30147-8-git-send-email-robert.jarzmik@free.fr>
 <4EBECB89.2020102@newsguy.com> <87vcqoiavr.fsf@free.fr>
 <1321188825.2273.4.camel@koala>
 <1321189398.2021.5.camel@shinybook.infradead.org>
 <1321191352.2273.14.camel@koala> <87ehxchta0.fsf@free.fr>
 <4EC020A2.9070003@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321216077.26585.11.camel@koala>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Ivan Djelic <ivan.djelic@parrot.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-11-13 at 11:55 -0800, Mike Dunn wrote:
> An objection might be that mtd should not be setting policy.  It's also a fairly
> sizeable modification.  The alternative would be to implement a mechanism to
> return the corrected error count to the higher layer (e.g., ubi) for each read
> operation.  This would be even more work, requiring modifications to mtd and ubi.

Yeah, probably just returning the ECC correction count is cleaner
design. Probably we can add another argument to the mtd read function
and if the return code is -EUCLEAN (correctable bit-flips happened), it
would contain the highest ECC correction count encountered while reading
this region of the flash. So the SW which does not care, will not
require any changes.

I am not sure if you'll need to mtd interfaces from mtd->func(...) to
mtd_func(mtd, ...) for this or not, though.

Artem.
