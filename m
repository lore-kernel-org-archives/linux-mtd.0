Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bs3kV-0001n7-Gi
	for linux-mtd@lists.infradead.org; Tue, 03 Aug 2004 14:10:58 -0400
Received: from oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 7F2F4229D1
	for <linux-mtd@lists.infradead.org>;
	Tue,  3 Aug 2004 22:09:39 +0400 (MSD)
Message-ID: <410FD4CA.6010008@oktetlabs.ru>
Date: Tue, 03 Aug 2004 22:09:14 +0400
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: notice
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello. I have a notice to the JFFS2 initialisation code.

It seems to me that it would be good to add the __init/__exit attributes 
to the jffs2_compressors_init/jffs2_compressors_exit (compt.c) functions.

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
