Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BiCoT-0002yF-0N
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2004 09:50:17 -0400
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 70B282288A
	for <linux-mtd@lists.infradead.org>;
	Wed,  7 Jul 2004 17:50:15 +0400 (MSD)
Message-ID: <40EBFF97.6040405@yandex.ru>
Date: Wed, 07 Jul 2004 17:50:15 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Padding node
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Could anybody please explain why "padding nodes" are uses (I mean 
JFFS2_NODETYPE_PADDING node type).

JFFS2 uses these nodes only in case of NAND flash in order to fill the 
end if Flash pages. In case of small ending space, JFFS2 uses 
JFFS2_DIRTY_BITMASK padding. Why don't it always use JFFS2_DIRTY_BITMASK?

Is this just to speed-up the future mount time because padding node is 
scanned faster then continuous filling?

Why the same padding nodes aren't used in case of NOR flashes?

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
