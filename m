Received: from pmac.infradead.org ([81.187.2.168])
	by canuck.infradead.org with esmtpsa (Exim 4.62 #1 (Red Hat Linux))
	id 1Ffyl0-00046r-Ny
	for linux-mtd@lists.infradead.org; Tue, 16 May 2006 08:34:35 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 16 May 2006 13:34:32 +0100
Message-Id: <1147782872.27870.24.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Commits list spam.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for the mass of commits from Linus' tree which got sent to the MTD
commits list last night. The script excludes commits from the 'linus'
branch of the tree... but that only works if I have the wit to actually
_update_ that branch at the same time as I merge from Linus.

I've added a safeguard so it also excludes commits which are in the
automatically-updated local mirror of Linus' tree. That mirror is only
updated once a day, so if I make the same mistake again we'll only see
at most a day's worth of unrelated commits. I shall also endeavour not
to make that mistake again :)

-- 
dwmw2
