Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16tSyQ-0007B8-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Apr 2002 13:37:46 +0100
Date: Fri, 5 Apr 2002 14:37:45 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Claus Gindhart <claus.gindhart@pep.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 and Disk-On-Chip for PowerPC
Message-ID: <20020405143745.A7852@wohnheim.fh-wedel.de>
References: <E16tSbI-00079k-00@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E16tSbI-00079k-00@pentafluge.infradead.org>; from claus.gindhart@pep.de on Fri, Apr 05, 2002 at 02:15:20PM +0200
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Fri, 5 April 2002 14:15:20 +0200, Claus Gindhart wrote:
> I have installed successfully MTD and NFTLA for Disk-On-Chip for PowerPC. But 
> that i really want is a Journalling Flash File System. 
> Is there any chance, that JFFS2 will run stable on Disk-On-Chip in the next 
> time, also for non-x86 architectures ?

I have no idea about DOC, but jffs2 doesn't have any issues with ppc.
It runs just fine on some 403 and 405 based systems here.

Jörn

-- 
A security system is only as secure as its secret. Beware of
pseudo-secrets.
-- Eric Raymond in "The cathedral and the bazaar"
