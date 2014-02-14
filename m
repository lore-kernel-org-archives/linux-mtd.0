Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEDsb-0000vz-27
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 08:12:14 +0000
Message-ID: <1392365505.12215.38.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5 0/1] ubi: Introduce block devices for UBI volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Fri, 14 Feb 2014 10:11:45 +0200
In-Reply-To: <1392321426-18256-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1392321426-18256-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Ezequiel,

On Thu, 2014-02-13 at 16:57 -0300, Ezequiel Garcia wrote:
> As soon as this gets merged into UBI kernel core, I'll submit the mtd-utils
> userspace tools, as well as start preparing some documentation for the mtd
> website, and the docbook.

Ideally the docs should come along with the driver.

> I'd be willing to drop read-support is that makes this feature acceptable;
> but I guess that would make it pretty useless :-)

Well, it was your decision.

I only asked to remove the compile-time option. And if there are
limitations, document them.

I pointed that there is a standard 'blkdev' tool which has '--setro' and
'--setrw' options, and you could try to use that for _run-time_ RO/RW
toggling.

>   * Dropped write-support

Fine with me too, thanks, but please, do not allude you was pushed to do
this.

>   * Dropped cached access

Thanks. This little tiny compile options make more harm than benefit.
They break from time, because people usually use one of the
configurations, and rarely test the changed.

If you want to save people 128KiB of ram or something, do it a better
way. For example, we have memory shrinker in the kernel. Register your
your shrinker and free that buffer in case of memory pressure. Allocate
it back if needed later using "gentle" allocation techniques (NORETRY,
NOFS, etc).

Anyway, thanks for this too.


-- 
Best Regards,
Artem Bityutskiy
