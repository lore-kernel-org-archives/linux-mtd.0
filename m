Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOmKA-00061O-Ig
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 07:46:43 +0000
Received: by ewy3 with SMTP id 3so2369951ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 May 2011 00:46:41 -0700 (PDT)
Subject: Re: [PATCH -next] mtd: fix physmap.h warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell King <rmk@arm.linux.org.uk>
In-Reply-To: <20110524074020.GA9490@flint.arm.linux.org.uk>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
	<20110523113709.4357b4ba.randy.dunlap@oracle.com>
	<1306216431.2785.46.camel@localhost>
	<1306216683.2785.47.camel@localhost>
	<20110524074020.GA9490@flint.arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 May 2011 10:42:23 +0300
Message-ID: <1306222943.2785.55.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Marc Zyngier <Marc.Zyngier@arm.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] mtd: fix physmap.h warnings

Fix build warnings in physmap.h:

include/linux/mtd/physmap.h:25: warning: 'struct platform_device' declared inside parameter list
include/linux/mtd/physmap.h:25: warning: its scope is only this definition or declaration, which is probably not what you want
include/linux/mtd/physmap.h:26: warning: 'struct platform_device' declared inside parameter list
include/linux/mtd/physmap.h:27: warning: 'struct platform_device' declared inside parameter list

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 include/linux/mtd/physmap.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index 49b9590..697cc98 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -19,6 +19,7 @@
 #include <linux/mtd/partitions.h>
 
 struct map_info;
+struct platform_device;
 
 struct physmap_flash_data {
 	unsigned int		width;
-- 
1.7.2.3
