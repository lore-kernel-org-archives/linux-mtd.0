Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RaDyW-0005x1-PZ
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 22:03:59 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [PATCH v3] mtd/docg3: fixes and cleanups
References: <1322726702.2332.9.camel@koala>
 <1322852412-15193-1-git-send-email-robert.jarzmik@free.fr>
 <1323066682.2316.18.camel@koala> <877h2590zp.fsf@free.fr>
 <1323724387.2297.13.camel@koala>
Date: Mon, 12 Dec 2011 23:03:48 +0100
In-Reply-To: <1323724387.2297.13.camel@koala> (Artem Bityutskiy's message of
 "Mon, 12 Dec 2011 23:13:05 +0200")
Message-ID: <874nx5zbuj.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> On Fri, 2011-12-09 at 17:13 +0100, Robert Jarzmik wrote:
> What do you mean by "handle" ? Is the problem that docg3 maintains
> per-eraseblock erase-counters and you do not know how to use them?
Yes, exactly, docg3 maintains that counter for each block.

I thought that upper layers (UBI,...) could use both the erase counter and the
ECC number of flipped bits to select which block to erase next. After a quick
glance, I don't think they can do it.

> May be it is better to just embrace this function with "#ifdef 0" and add a
> comment that we can do this but do not have a good use for this?
Ah yes, I didn't think about that possibility. It's looks better, I'll submit
another patch with a comment and the #if 0.

Cheers.

-- 
Robert
