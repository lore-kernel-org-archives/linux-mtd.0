Received: from p50909bd1.dip.t-dialin.net ([80.144.155.209]
	helo=www.neundorf.net)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BpYsV-0001Zj-VL
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 16:48:53 -0400
From: Alexander Neundorf <neundorf@kde.org>
To: linux-mtd@lists.infradead.org
Date: Tue, 27 Jul 2004 22:48:48 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200407272248.48285.neundorf@kde.org>
Subject: jffs2 performance
Reply-To: neundorf@kde.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody,

on my job we're building an embedded device using the ecos operating system 
which comes with optional jffs2 support.
We need to be *very* fast on startup. I read different things about jffs2 
regarding performance.
We are using a Intel XScale processor 200 Mhz, with a 16 MB flash, from which 
8 MB will be used for jffs2 (or whatever we decide to use).
The file system will contains about 10 to 20 files. One very small file (4..20 
bytes) which is written very often, some intermediate files which are written 
only very seldom, and a big file consisting of approx. 1000 entries each 500 
to 2000 bytes large, the single entries written often. We could also use 1000 
small files each containing just one entry, but I guess this would be slower.

So what performance can I expect, especially how long will mounting approx. 
take (approx. 0.1 s or 1 s or 10 s) ?

I guess writing one (1000 byte) entry to an open file should be quite fast,  
<<0.1 s.

Can you give me some pointers ?

Thanks
Alex

P.S. I'm not subscribed, so please put me in the CC
-- 
Work: alexander.neundorf@jenoptik.com - http://www.jenoptik-los.de
Home: neundorf@kde.org                - http://www.kde.org
      alex@neundorf.net               - http://www.neundorf.net
