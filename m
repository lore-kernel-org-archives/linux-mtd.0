Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NVpnN-0005Mg-OF
	for linux-mtd@lists.infradead.org; Fri, 15 Jan 2010 17:17:18 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o0FHH7hM026211
	for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2010 11:17:11 -0600
Received: from [172.21.41.105] (esdhcp041105.research.nokia.com
	[172.21.41.105])
	by mgw-sa01.ext.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o0FHH5d7018688
	for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2010 19:17:05 +0200
Subject: mtd-utils v1.3.1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Jan 2010 19:17:05 +0200
Message-Id: <1263575825.2969.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've just tagged mtd-utils v1.3.1. There was a serious bugfix form the
ubiformat utility. Basically, ubiformat in 1.3.0 is broken, and 1.3.1
fixes that. The fix is:

http://git.infradead.org/mtd-utils.git/commit/2caf2c6fda66f1f09502245229230743dc20295b

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
