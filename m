Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E5ifk-00082a-Q1
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2005 07:35:08 -0400
Date: Thu, 18 Aug 2005 13:34:39 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050818113439.GC16751@wohnheim.fh-wedel.de>
References: <BAY17-F27367B9FB0CF0A4D578090E8B20@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F27367B9FB0CF0A4D578090E8B20@phx.gbl>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Add erase count tracking support in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 18 August 2005 17:08:41 +0800, zhao forrest wrote:
> 
> This patch adds the "erase count tracking" support in JFFS2.
> In particular it records the erase count of each erase block.
> By knowing the erase count of each erase block, we can further
> enhance the current wear-leveling algorithm of random nature
> in JFFS2.
> So this patch is also the basis of my future patch for
> enhancing the wear-leveling algorithm in JFFS2.
> 
> Your comments are highly welcome.

Getting rid of the #ifdefs would help.  Will have a closer look
sometime later...

Jörn

-- 
tglx1 thinks that joern should get a (TM) for "Thinking Is Hard"
-- Thomas Gleixner
