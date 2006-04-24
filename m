Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FXvR2-0006uz-Mm
	for linux-mtd@lists.infradead.org; Mon, 24 Apr 2006 03:24:44 -0400
Received: from joern by wohnheim.fh-wedel.de with local (Exim 3.36 #1 (Debian))
	id 1FXvR2-0004sb-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Apr 2006 09:24:40 +0200
Date: Mon, 24 Apr 2006 09:24:40 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20060424072440.GA15854@wohnheim.fh-wedel.de>
References: <20060423193438.GF29948@admingilde.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060423193438.GF29948@admingilde.org>
Subject: Re: [PATCH] MTD: make mtd->name const
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 23 April 2006 21:34:39 +0200, Martin Waitz wrote:
> 
> mtd->name is never used read-write and often holds a pointer to constant data.
> 
> Signed-off-by: Martin Waitz <tali@admingilde.org>

Applied, thanks.

Jörn

-- 
To my face you have the audacity to advise me to become a thief - the worst
kind of thief that is conceivable, a thief of spiritual things, a thief of
ideas! It is insufferable, intolerable!
-- M. Binet in Scarabouche
