Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCzr3-0001Aw-2W
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 23:01:35 +0000
Date: Tue, 11 Feb 2014 00:01:09 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140211000109.36724c26@skate>
In-Reply-To: <a3fc06a8-c809-4687-9da4-015bd8dd29e8@email.android.com>
References: <52F6BCCD.5070302@nod.at> <20140208233758.GH22376@1wt.eu>
 <52F6C916.2030506@nod.at> <20140209075157.GJ22376@1wt.eu>
 <20140210024827.GB9643@localhost>
 <1392017750.31031.8.camel@sauron.fi.intel.com>
 <20140210082714.GB10872@localhost> <20140210084616.GP22376@1wt.eu>
 <20140210142026.GB15607@localhost>
 <1392043814.32363.49.camel@sauron.fi.intel.com>
 <20140210184858.GA6484@localhost> <20140210233754.71e3e199@skate>
 <de976336-3144-4f21-859b-d1a37fc3d811@email.android.com>
 <20140210234600.3a03b346@skate>
 <a3fc06a8-c809-4687-9da4-015bd8dd29e8@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Piergiorgio Beruto,

(Please wrap your e-mail at ~72 characters per line, as is coming
practice in the open-source community)

On Mon, 10 Feb 2014 23:49:38 +0100, Piergiorgio Beruto wrote:

> Sorry, i understand, just i dont see the point in using a runtime var when the compile time option is already implemented and in my personal opinion is preferable.

That's probably because you don't understand the additional maintenance
burden caused by compile time option. When there are gazillions of
compile time options, there are gazillions of build possibilities that
a maintainer must test when applying patches, and pushing changes
upstream. This is annoying and can be avoided by limiting the number of
compile time parameters.

Of course, it's completely a matter of trade-off: we still do want to
have compile-time options for complete drivers, but we generally try to
avoid them to tune the driver behavior itself.

That being said, I can't speak for the UBI maintainer :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
