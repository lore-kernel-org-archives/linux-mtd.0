Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BpRhG-0002qM-4f
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 09:08:49 -0400
Received: from yandex.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 23A7D229D1
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jul 2004 17:08:17 +0400 (MSD)
Message-ID: <410653C0.3070609@yandex.ru>
Date: Tue, 27 Jul 2004 17:08:16 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: bugreport
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

There is a bug in jffs2 module registration function - super.c line 293:
the init_jffs2_fs function doesn't properly perform
the de-initialization in case of failures on lines 315 and 321.
The jffs2_inode_cachep is also not feed.

I Tried to send a patch bit mailman soesn't gieve me...

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
