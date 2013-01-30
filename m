Received: from mail-we0-x234.google.com ([2a00:1450:400c:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U0Vl8-000783-EE
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2013 11:23:19 +0000
Received: by mail-we0-f180.google.com with SMTP id k14so1099631wer.11
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jan 2013 03:23:12 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 30 Jan 2013 12:23:12 +0100
Message-ID: <CACKLOr3XoQfTuy4XpORz4QwqPhfEa8mQNzdKdrbJ2UCA-X+MhQ@mail.gmail.com>
Subject: cmdline partition parsing behavior has changed: regression?
From: javier Martin <javier.martin@vista-silicon.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I've been using the following cmdline string to boot my kernel for
several releases until 3.6:

"console=ttymxc0,115200 mem=54MB init=/sbin/preinit
root=/dev/mtdblock2
mtdparts=physmap-flash.0:384k(U-Boot),2560k(kernel0),27904k(rootfs0),2048k(config0),2560k(kernel1),27904k(rootfs1),2048k(config1),32k(env1),32k(env2);"

Partition parsing always has worked properly and the "physmap-flash.0"
NOR flash was properly detected and partitioned.

However, in 3.8-rc3 I've found that this string does not work any
longer. In fact I had to add the following dirty hack to make it work:

-------
    mtd: dirty hack to fix cmdline partition parsing.

    Behavior of cmdline partition parsing seems to have changed
    recently. Currently, it doesn't like that we end our partition
    description string with a ';' character.

    A more suitable solution is yet to be found.

    Signed-off-by: Javier Martin <javier.martin@vista-silicon.com>

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index c533f27..4ef0e7a 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -271,6 +271,10 @@ static int mtdpart_setup_real(char *s)
                     this_mtd->mtd_id, this_mtd->num_parts));


+               /* FIXME: dirty hack */
+               if (*s == ';')
+                       return 0;
+
                /* EOS - we're done */
                if (*s == 0)
                        break;

Is this a regression? Should I just change my cmdline string?

Regards.

-- 
Javier Martin
Vista Silicon S.L.
CDTUC - FASE C - Oficina S-345
Avda de los Castros s/n
39005- Santander. Cantabria. Spain
+34 942 25 32 60
www.vista-silicon.com
