Received: from smtp2.cybersurf.net ([209.197.145.112])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 155rSw-00020P-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Jun 2001 17:07:58 +0100
Received: from localhost.localdomain ([209.197.132.58]) by
          smtp2.cybersurf.net (Netscape Messaging Server 4.15) with SMTP
          id GE9ECA00.G9V for <linux-mtd@lists.infradead.org>; Fri, 1 Jun
          2001 10:12:10 -0600
From: Herman Oosthuysen <herman@wirelessnetworksinc.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2
Date: Fri, 1 Jun 2001 10:12:15 -0600
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <01060110160400.02053@localhost.localdomain>
Content-Transfer-Encoding: 8bit
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

Hi guys,

Something is not clear to me:
In order to have JFFS2 support, do I have to compile in the JFFS stuff as well?

I modified the following lines in fs/config.in:
## Herman - Add JFFS2 Support
tristate 'Journaling FLASH filesystem (JFFS) support' CONFIG_JFFS_FS
tristate 'Journalling Flash filesystem (JFFS2) support' CONFIG_JFFS2_FS
int 'Journalling Flash filesystem (JFFS2) Debug Verbosity' CONFIG_JFFS2_FS_DEBUG

Cheers,
-- 
Herman Oosthuysen
Phone: 403+569-5687
E-mail: Herman@WirelessNetworksInc.com
