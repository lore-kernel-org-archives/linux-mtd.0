Received: from smtp5.pp.htv.fi ([213.243.153.39])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jg1Ae-00069r-69
	for linux-mtd@lists.infradead.org; Sun, 30 Mar 2008 17:18:16 +0000
Date: Sun, 30 Mar 2008 19:53:23 +0300
From: Adrian Bunk <bunk@kernel.org>
To: devzero@web.de, Linus Torvalds <torvalds@linux-foundation.org>
Subject: [2.6.25 patch] sound/oss/ac97_codec.c: restore MODULE_LICENSE
Message-ID: <20080330165323.GA1575@cs181133002.pp.htv.fi>
References: <213384793@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <213384793@web.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, "Rafael J. Wysocki" <rjw@sisk.pl>,
	linux-ide@vger.kernel.org, greg@kroah.com,
	linux-kernel@vger.kernel.org, david-b@pacbell.net,
	linux-acpi@vger.kernel.org, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	alan@lxorguk.ukuu.org.uk, lenb@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 26, 2008 at 09:51:34PM +0100, devzero@web.de wrote:
> > Can you post the full kernel log up to this BUG?
> > It should show that causes the Taint.
> 
> oh - yes:
> 
> Mar 23 09:12:20 opensuse103 kernel: ac97_codec: module license 'unspecified' taints kernel.
> 
> modinfo ac97_codec
> filename:       /lib/modules/2.6.25-rc6-git7-default/kernel/sound/oss/ac97_codec.ko
> srcversion:     8665939D5E471F7E331BB3E
> depends:
> vermagic:       2.6.25-rc6-git7-default SMP mod_unload 586
> 
> 
> seems MODULE_LICENSE is missing in ./sound/oss/ac97_codec.c !?
>...

My fault, fix below.

> regards
> roland

cu
Adrian


<--  snip  -->


I accidentally removed the MODULE_LICENSE("GPL") from sound/oss/ac97_codec.c

Spotted by Roland <devzero@web.de>.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
c4f4fee537525836680163622dc15b045f551d40 diff --git a/sound/oss/ac97_codec.c b/sound/oss/ac97_codec.c
index 87a6726..b63839e 100644
--- a/sound/oss/ac97_codec.c
+++ b/sound/oss/ac97_codec.c
@@ -1202,3 +1202,5 @@ static int pt101_init(struct ac97_codec * codec)
 
 EXPORT_SYMBOL(ac97_probe_codec);
 
+MODULE_LICENSE("GPL");
+
