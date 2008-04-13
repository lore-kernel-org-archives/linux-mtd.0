Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jkzne-0007w1-5N
	for linux-mtd@lists.infradead.org; Sun, 13 Apr 2008 10:51:06 +0000
Date: Sun, 13 Apr 2008 12:50:46 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions causes
	kernel panic
Message-ID: <20080413105046.GB6022@logfs.org>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<200804101918.21362.jpihet@mvista.com>
	<Pine.LNX.4.64.0804111824450.12186@pentafluge.infradead.org>
	<1207937133.5965.17.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1207937133.5965.17.camel@sauron>
Cc: nickpiggin@yahoo.com.au, Alexey Korolev <akorolev@infradead.org>,
	Jean Pihet <jpihet@mvista.com>, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 11 April 2008 21:05:33 +0300, Artem Bityutskiy wrote:
> 
> So why did you start this project? How about just making all your work
> to go into mainline instead?

At least one of the patches should not go to mainline.  It is one of
those strange "If I change the code here, all symptoms disappear"
patches that doesn't cure the cause.  Someone should spend some time to
find the root couse, but noone has.

Keeping such patches somewhere easily accessable - but not in mainline -
might be a good idea.  Would be even better if the root cause was found
and fixed, of course.

Jörn

-- 
Fantasy is more important than knowledge. Knowledge is limited,
while fantasy embraces the whole world.
-- Albert Einstein
