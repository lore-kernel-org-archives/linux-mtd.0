Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DJq8w-0004fj-DT
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2005 05:51:15 -0400
From: David Woodhouse <dwmw2@redhat.com>
To: Chris Elston <chris.elston@radstone.co.uk>
In-Reply-To: <F38DEABE0E171746B133C1ABBD142D9703691AF4@radmail.Radstone.Local>
References: <F38DEABE0E171746B133C1ABBD142D9703691AF4@radmail.Radstone.Local>
Content-Type: text/plain
Date: Fri, 08 Apr 2005 10:50:45 +0100
Message-Id: <1112953845.5714.67.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2.6.12-rc2] Add flash mapping for Radstone PPC7D
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-04-08 at 10:48 +0100, Chris Elston wrote:
> Comments/criticisms on this technique and the rest of the patch would
> be much appreciated.

vmalloc() can sleep, but you may not in your read/write map functions.

-- 
dwmw2
