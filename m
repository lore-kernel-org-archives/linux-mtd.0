Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIjXM-0000MJ-Lp
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 05:08:21 -0400
Date: Fri, 23 Sep 2005 11:08:02 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050923090802.GD7522@wohnheim.fh-wedel.de>
References: <20050922140223.GB6854@wohnheim.fh-wedel.de>
	<BAY17-F31136691CA372165BD3066E8960@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F31136691CA372165BD3066E8960@phx.gbl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: 1:1 mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 September 2005 10:56:56 +0800, zhao forrest wrote:
> >> > Can you explain "when JFFS2 has detected that the image is an old
> >> > image" in C?
> >> Well, we may even do better. Scan FS. If we meet any node which crosses
> >> the eraseblock boundary - bye bye. That must be easy to implement as
> >> node headers contain the total node length.
> >
> >Sounds fine.  Yes, that appears to be the best solution.
> >
> This solution has been in my patch.
> 
> Until now we only disscussed one aspect of the problem.
> Another aspect is that what should we do when users mount new JFFS2 image
> with old JFFS2 code? Is the "big warning" in readme enough? Or we should
> let old JFFS2 code reject mounting new JFFS2 image?

Just let them mount it.  If people actually convert to virtual block
in this way, it should be relatively safe.  On their way back they
will notice.

Really, this is an unlikely case of an unlikely case.  People would
have to
1. have enough erase blocks to need virtual blocks,
2. not have MTD_NO_VIRTBLOCKS flag set,
3. decide to downgrade from newer code,
4. by all chances, previously have upgraded to the newer code and
   either not see a problem or ignore it.

Just ignore that case.

Jörn

-- 
I don't understand it. Nobody does.
-- Richard P. Feynman
