Received: from bay17-f15.bay17.hotmail.com ([64.4.43.65] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ELFfH-0005LM-M6
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 03:50:57 -0400
Message-ID: <BAY17-F1527A3A8A2DD65FABCE30BE88F0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru, joern@wohnheim.fh-wedel.de
Date: Fri, 30 Sep 2005 15:48:38 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH]add EBH support to flash_eraseall
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch modified user utility - flash_eraseall.
Now it will write eraseblock header instead of clean
marker into erase block.

The patch is at:
http://www.infradead.org/~forrest/flash_eraseall.patch

I'll take one week vacation next week. So the patch for
other user utilities will be sent out after I come back.

Thanks,
Forrest
