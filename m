Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKAXp-0002LP-Dk
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 13:01:02 +0000
Subject: Re: New mtd-utils release?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Mack <daniel@caiaq.de>
In-Reply-To: <20091214121439.GC28375@buzzloop.caiaq.de>
References: <20091214121439.GC28375@buzzloop.caiaq.de>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Dec 2009 15:00:33 +0200
Message-Id: <1260795633.11112.49.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-12-14 at 20:14 +0800, Daniel Mack wrote:
> Hi,
> 
> we're building mtd-utils with buildroot, and as we need a recent version
> of it to get the ubi features, we currently check out a git snapshot as
> tarball. Last week, for some reason the SHA1 ID we used (e783e75e0)
> disappeared from the repository. (Just out of curiosity: what happened?
> Was the tree rebased or filtered?).

Dunno, but it must be me how made this crew-up, sorry. I cannot say
exactly how it happened, but it was non-intentional. Probably pushed one
patch version, then later amended it, and pushed it with --force. This
should never be done, sorry.

> However, this approach is somewhat hackish anyway, and we would much
> more like to check out a version that is officially tagged.

OK, I can tag them at the beginning of the next year. I'm having
holydays in 10 min.

>  Seeing the
> last tag has been done ~17 month ago, I wonder whether there is any
> change to get a new one soon?

We usually use the master branch. And there is simply no one who cares
about tags. But I can do this. You'll get a new tag when I come back
from holydays, unless someone else tag it earlier.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
