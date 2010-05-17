Date: Mon, 17 May 2010 09:16:32 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Woodhouse
	<dwmw2@infradead.org>
Subject: [PATCH -next] pcmciamtd: fix printk format warnings
Message-Id: <20100517091632.59c2696c.randy.dunlap@oracle.com>
In-Reply-To: <20100517163521.649526d0.sfr@canb.auug.org.au>
References: <20100517163521.649526d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, linux-pcmcia@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warnings in pcmciamtd debug code:

drivers/mtd/maps/pcmciamtd.c:163: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'ssize_t'
drivers/mtd/maps/pcmciamtd.c:212: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'ssize_t'
drivers/mtd/maps/pcmciamtd.c:274: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'ssize_t'
drivers/mtd/maps/pcmciamtd.c:312: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'ssize_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/maps/pcmciamtd.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20100517.orig/drivers/mtd/maps/pcmciamtd.c
+++ linux-next-20100517/drivers/mtd/maps/pcmciamtd.c
@@ -160,7 +160,7 @@ static void pcmcia_copy_from_remap(struc
 	struct pcmciamtd_dev *dev = (struct pcmciamtd_dev *)map->map_priv_1;
 	unsigned long win_size = dev->win_size;
 
-	DEBUG(3, "to = %p from = %lu len = %u", to, from, len);
+	DEBUG(3, "to = %p from = %lu len = %zd", to, from, len);
 	while(len) {
 		int toread = win_size - (from & (win_size-1));
 		caddr_t addr;
@@ -209,7 +209,7 @@ static void pcmcia_copy_to_remap(struct 
 	struct pcmciamtd_dev *dev = (struct pcmciamtd_dev *)map->map_priv_1;
 	unsigned long win_size = dev->win_size;
 
-	DEBUG(3, "to = %lu from = %p len = %u", to, from, len);
+	DEBUG(3, "to = %lu from = %p len = %zd", to, from, len);
 	while(len) {
 		int towrite = win_size - (to & (win_size-1));
 		caddr_t addr;
@@ -271,7 +271,7 @@ static void pcmcia_copy_from(struct map_
 	if(DEV_REMOVED(map))
 		return;
 
-	DEBUG(3, "to = %p from = %lu len = %u", to, from, len);
+	DEBUG(3, "to = %p from = %lu len = %zd", to, from, len);
 	memcpy_fromio(to, win_base + from, len);
 }
 
@@ -309,7 +309,7 @@ static void pcmcia_copy_to(struct map_in
 	if(DEV_REMOVED(map))
 		return;
 
-	DEBUG(3, "to = %lu from = %p len = %u", to, from, len);
+	DEBUG(3, "to = %lu from = %p len = %zd", to, from, len);
 	memcpy_toio(win_base + to, from, len);
 }
 
