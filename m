Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MGtGN-00068I-7N
	for linux-mtd@lists.infradead.org; Wed, 17 Jun 2009 11:25:14 +0000
Date: Wed, 17 Jun 2009 13:24:50 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] [MTD] phram: cleanup error handling and associated
	messages
Message-ID: <20090617112450.GA29067@logfs.org>
References: <1245235818-22649-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1245235818-22649-1-git-send-email-vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org, joern@lazybastard.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 June 2009 06:50:18 -0400, Mike Frysinger wrote:
> 
> The error handling in the phram driver is pretty bad -- in many places,
> errors are silently ignored or logged, but then still ignored in the
> return value.  So convert all of the code to pass back the correct return
> value and log error messages properly (and using the new pr_fmt() helper).

I don't remember why I always returned 0 in phram_setup.  Could well
have been an oversight.

> If everything does go smoothly, rather than exit silently, dump a helpful
> info message like pretty much every other MTD driver does.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Acked-by: Joern Engel <joern@logfs.org>

Care to take over maintainership?  I haven't used this driver in ages
and don't foresee using it anytime soon.

Jörn

-- 
You cannot suppose that Moliere ever troubled himself to be original in the
matter of ideas. You cannot suppose that the stories he tells in his plays
have never been told before. They were culled, as you very well know.
-- Andre-Louis Moreau in Scarabouche
