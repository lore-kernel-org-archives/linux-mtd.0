Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bd3QV-0004Ro-Vw
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2004 04:48:17 -0400
Received: from yandex.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id A548A2288A
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Jun 2004 12:48:01 +0400 (MSD)
Message-ID: <40D943C1.3000801@yandex.ru>
Date: Wed, 23 Jun 2004 12:48:01 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Wasted space question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello guys. I have "theoretical" question about JFFS2.

Perhaps, my question is for David, but will be glad if somebody else 
reply too.

Exploring JFFS2 sources I can't realize what is *wasted space* ? Dirty 
space is anything within block excluding valid nodes (no more used clean 
markers, pad nodes, paddings with JFFS2_DIRTY_BITMASK, obsoleted nodes). 
But what is *wasted space*. For what is it used?

Thanrs in advance.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
