Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CTcKQ-0001Ui-RK
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2004 03:35:16 -0500
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id A91E022967
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Nov 2004 11:34:41 +0300 (MSK)
Message-ID: <41986A21.6040605@yandex.ru>
Date: Mon, 15 Nov 2004 11:34:41 +0300
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: one more field in raw_node_ref ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello guys,

I would be happy to know your opinions about to introduce one more 
32-bit field to the node_ref structure in the JFFS2. Is this really bad?

This means to increase the memory needed for in-core structures on 25% 
:-( I know, it sucks, but this would really simplify and improve the 
checkpoints processing...

Opinions?

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
