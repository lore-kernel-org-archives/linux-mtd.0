Received: from elasmtp-banded.atl.sa.earthlink.net ([209.86.89.70])
	by pentafluge.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fay9J-0001dS-D2
	for linux-mtd@lists.infradead.org; Tue, 02 May 2006 17:54:58 +0100
Received: from [209.86.224.44] (helo=elwamui-ovcar.atl.sa.earthlink.net)
	by elasmtp-banded.atl.sa.earthlink.net with asmtp (Exim 4.34)
	id 1Fay99-0002PD-1l
	for linux-mtd@lists.infradead.org; Tue, 02 May 2006 12:54:47 -0400
Message-ID: <18996390.1146588887040.JavaMail.root@elwamui-ovcar.atl.sa.earthlink.net>
Date: Tue, 2 May 2006 12:54:46 -0400 (EDT)
From: Steve Finney <saf76@earthlink.net>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: [PATCH 1/3] MTD Utils. Allow hex argument in nandwrite
Reply-To: Steve Finney <saf76@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's reasonable to allow specifying the start address in hex. If these patches 
arn't in the appropriate format, I'm sure someone will let me know :-).

sf

Signed-off-by: Steven FInney <sfinney@healthhero.com>

----------------------------------

--- util.orig/nandwrite.c       2006-05-02 07:52:41.556880288 -0700
+++ util/nandwrite.c    2006-05-02 09:37:13.843347808 -0700
@@ -183,7 +183,7 @@ void process_options (int argc, char *ar
                        pad = 1;
                        break;
                case 's':
-                       mtdoffset = atoi (optarg);
+                       mtdoffset = strtol (optarg, NULL, 0);
                        break;
                case 'b':
                        blockalign = atoi (optarg);
