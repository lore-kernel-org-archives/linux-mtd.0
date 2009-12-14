Received: from ey-out-1920.google.com ([74.125.78.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NKALo-0005bo-5S
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 12:48:36 +0000
Received: by ey-out-1920.google.com with SMTP id 4so703475eyg.26
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Dec 2009 04:48:30 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: Daniel Mack <daniel@caiaq.de>
Subject: Re: New mtd-utils release?
References: <20091214121439.GC28375@buzzloop.caiaq.de>
Date: Mon, 14 Dec 2009 13:48:27 +0100
In-Reply-To: <20091214121439.GC28375@buzzloop.caiaq.de> (Daniel Mack's message
	of "Mon, 14 Dec 2009 20:14:40 +0800")
Message-ID: <87d42hsov8.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 Daniel> we're building mtd-utils with buildroot, and as we need a
 Daniel> recent version of it to get the ubi features, we currently
 Daniel> check out a git snapshot as tarball. Last week, for some reason
 Daniel> the SHA1 ID we used (e783e75e0) disappeared from the
 Daniel> repository. (Just out of curiosity: what happened?  Was the
 Daniel> tree rebased or filtered?).

FYI, the e783e SHA1 must be a local change. We have been using
fcb52ccc996 since April 2008. What did change recently though was that
the git installation on infradead got updated recently, and gitweb >=
1.6.6-rc1 uses a slightly different snapshot tarball format than before
(it appends the 7 first chars of SHA1 to directory name).

 Daniel> However, this approach is somewhat hackish anyway, and we would much
 Daniel> more like to check out a version that is officially tagged. Seeing the
 Daniel> last tag has been done ~17 month ago, I wonder whether there is any
 Daniel> change to get a new one soon?

Me too - It would be very good to see a stable release with ubi support.

-- 
Bye, Peter Korsgaard
