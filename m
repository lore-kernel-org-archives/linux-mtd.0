Received: from palrel13.hp.com ([156.153.255.238])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9vNH-00041E-QJ
	for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2003 00:48:15 +0100
From: "Christopher Hoover" <ch@hpl.hp.com>
To: "'Robin Gilks'" <robin.gilks@tait.co.nz>,
	"'mtd list'" <linux-mtd@lists.infradead.org>
Date: Wed, 15 Oct 2003 16:47:08 -0700
Message-ID: <000a01c39376$a5cb6460$d203b60f@duckduck>
MIME-Version: 1.0
In-Reply-To: <3F8DBD52.1020100@tait.co.nz>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: RE: Mount of jffs2 partition fails
Reply-To: ch@hpl.hp.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 3. when I try to use 
> the alternate Jedec probe method, I get a compile 
> error in jedec_probe.c of:
> jedec_probe.c:1756: error: parse error before "jedec_probe_init"
> jedec_probe.c:1757: warning: return type defaults to `int'
> [...]

Add #include <linux/init.h>.

-ch
