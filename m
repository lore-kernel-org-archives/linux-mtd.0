Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ncKI-00052V-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 09:24:10 +0000
Subject: Re: Initialization ordering problem
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: William Jhun <wjhun@ayrnetworks.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20020319111155.N6821@ayrnetworks.com>
References: <20020318221449.L6821@ayrnetworks.com>
	<1016520612.19504.3.camel@pcjonashg>  <20020319111155.N6821@ayrnetworks.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 20 Mar 2002 10:36:40 +0100
Message-Id: <1016617000.4115.105.camel@pcjonashg>
Mime-Version: 1.0
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

On Tue, 2002-03-19 at 20:11, William Jhun wrote:
> I may try this temporarily, but is this the "correct" way to deal with
> the problem? I'm not sure it would even work.

I don't know what it looks like in your arch-specific Makefile. But I
changed ours like this: 

@@ -55,7 +55,8 @@
 # each others config options
 SUBDIRS += arch/cris/boot/rescue
 endif
-CORE_FILES += arch/cris/kernel/kernel.o arch/cris/mm/mm.o
arch/cris/drivers/drivers.o
+CORE_FILES += arch/cris/kernel/kernel.o arch/cris/mm/mm.o
+DRIVERS += arch/cris/drivers/drivers.o
 LIBGCC = $(shell $(CC) $(CFLAGS) -print-file-name=libgcc.a)
 LIBS := $(TOPDIR)/arch/cris/lib/lib.a $(LIBS)
$(TOPDIR)/arch/cris/lib/lib.a $(LIBGCC)

Best regards
/Jonas
