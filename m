Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qb51q-0001ef-Va
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 06:10:42 +0000
Received: by pwi3 with SMTP id 3so3197902pwi.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 23:10:35 -0700 (PDT)
Subject: Re: [PATCH 1/2 v3] rewrite build system to avoid recursion
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 27 Jun 2011 09:11:24 +0300
In-Reply-To: <1309022438-10093-1-git-send-email-vapier@gentoo.org>
References: <1308983405-27064-1-git-send-email-vapier@gentoo.org>
	<1309022438-10093-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309155088.23597.20.camel@sauron>
Mime-Version: 1.0
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

On Sat, 2011-06-25 at 13:20 -0400, Mike Frysinger wrote:
> The ubi-utils/src/ subdir is tossed as it just complicates things for no
> real gain.  The dictionary.h header is relocated to the ubi-utils/include/
> since other headers in there need it.
> 
> The top level clean is replaced with a `find -delete` on objects, so it
> might prune more than necessary, but many projects now do this sort of
> thing and no one complained there.
> 
> A "mkdep" helper generates the actual rule, and the variables are used
> with "foreach" to expand these automatically.
> 
> The tests subdir is updated only to reflect the ubi-utils source move.
> Otherwise, it is left untouched as making that non-recursive isn't really
> worth the effort.
> 
> While we're gutting things, also through in kbuild style output while
> building to make things more legible.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed both, thanks, this makes a lot of difference!

-- 
Best Regards,
Artem Bityutskiy
