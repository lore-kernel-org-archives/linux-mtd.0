Received: from ns1.idleaire.net ([65.220.16.2] helo=iasrv1.idleaire.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19klpk-00020Q-77
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 15:33:40 +0100
From: Dave Dillow <dave@thedillows.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1060254121.25209.69.camel@passion.cambridge.redhat.com>
References: <97303ED3C472254E8888E5F74A783471045BD2@msu-ex01.corp.m-sys.com>
	 <1060254121.25209.69.camel@passion.cambridge.redhat.com>
Message-Id: <1060266774.27837.2.camel@dillow.idleaire.com>
Mime-Version: 1.0
Date: 07 Aug 2003 10:32:54 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: Problems with 128MB DoC 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-07 at 07:02, David Woodhouse wrote:
> Dave, does the code in drivers/mtd/nand/diskonchip.c work for you if you
> hack it to have the correct address for the DiskOnChip, and make the
> ident bits work?

No, I still get the C6, C6 signature.
-- 
Dave Dillow <dave@thedillows.org>
