Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CTcm6-0002kt-1Y
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2004 04:04:01 -0500
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 372A322886
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Nov 2004 12:03:16 +0300 (MSK)
Message-ID: <419870D4.4050703@yandex.ru>
Date: Mon, 15 Nov 2004 12:03:16 +0300
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: remove the 'totlen' field from node_ref
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I see there were efforts to remove the 'totlen' field from the 
jffs2_raw_node_ref structure. But it is not done yet.

As I understand, in order to succesfullt done this improvements, all the 
space in flash must be represented by means of nodes. This means, we 
should keep padding node references (jffs2_raw_node_ref for paddigs) 
in-core too.

Why is this work not done yet? Are there some difficulties? May be some 
problems arise when we pad to the end of NAND page/Flash block but the 
padding length is not sufficient to write the padding node and we just 
write some pattern?

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
