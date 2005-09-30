Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ELIiL-00086h-DX
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 07:06:20 -0400
Message-ID: <433D1BA9.9090508@mw-itcon.de>
Date: Fri, 30 Sep 2005 13:04:09 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Subject: [PATCH]jffs2 fix for dataflash + odd erasesizes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes jffs2 for use with atmel dataflash. Now every part of 
jffs2 should be able to handle erase sizes and wbuf sizes, which are not 
2^X.

The patch has some trivial changes, where erase sizes were relying on a 
size of 2^X. The rest of the changes in wbuf.c does affect only 
dataflash handling.

http://www.mw-itcon.de/patches/patch.jffs2.dataflash

Best regards
Peter

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
