Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IjCQA-0000tF-Rp
	for linux-mtd@lists.infradead.org; Sat, 20 Oct 2007 12:23:13 +0100
Date: Sat, 20 Oct 2007 12:28:41 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Matt Reimer <mattjreimer@gmail.com>
Subject: Re: [PATCH] MTD: make s3c2410's correct_data indicate an error for
	multi-bit read errors
Message-ID: <20071020102840.GC32465@lazybastard.org>
References: <f383264b0710181813i61b5b9acs76afdf27f199adcc@mail.gmail.com>
	<20071019082438.GA26913@lazybastard.org>
	<1192784447.3421.27.camel@sauron>
	<f383264b0710191229q612ae6b3y23835ca9cf873f35@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f383264b0710191229q612ae6b3y23835ca9cf873f35@mail.gmail.com>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 19 October 2007 12:29:45 -0700, Matt Reimer wrote:
> 
> See the patch I posted a couple of days ago with the subject "MTD:
> treat any negative return value from correct() as an error". Once that
> patch is accepted, doing what you say will work as you expect; right
> now, it results in lying to upper layers about errors.

I'll comment to that patch seperately.  This one is
Acked-By: Joern Engel <joern@logfs.org>

Jörn

-- 
It does not matter how slowly you go, so long as you do not stop.
-- Confucius
