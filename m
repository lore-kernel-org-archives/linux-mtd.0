Received: from oproxy6.bluehost.com ([2605:dc00:100:2::a6]
 helo=oproxy6-pub.bluehost.com)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rt0X5-0001sX-5z
 for linux-mtd@lists.infradead.org; Thu, 02 Feb 2012 17:33:18 +0000
Message-ID: <4F2AD4DE.7040508@xenotime.net>
Date: Thu, 02 Feb 2012 10:24:30 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Feb 2 (fs/jffs2)
References: <20120202144516.11b33e667a7cbb8d85d96226@canb.auug.org.au>
In-Reply-To: <20120202144516.11b33e667a7cbb8d85d96226@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-next@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/01/2012 07:45 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20120201:


fs/jffs2/*.c still contains uses of ->read etc. instead of using
mtd_read() etc.

fs/jffs2/read.c:36:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/read.c:112:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/nodemgmt.c:669:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/readinode.c:83:9: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/readinode.c:676:9: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/readinode.c:954:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/readinode.c:1040:9: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/readinode.c:1216:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/readinode.c:1275:10: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/scan.c:286:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/gc.c:590:8: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/gc.c:894:10: error: 'struct mtd_info' has no member named 'read'
fs/jffs2/gc.c:977:9: error: 'struct mtd_info' has no member named 'read'

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
