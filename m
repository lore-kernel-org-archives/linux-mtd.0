Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKEAN-000326-NL
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 06:58:05 -0400
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id D1435229DD
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Oct 2004 14:57:31 +0400 (MSD)
Message-ID: <4176449B.4090706@yandex.ru>
Date: Wed, 20 Oct 2004 14:57:31 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: 4K block size question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

In case of 2MiB NAND flash (with 256-byte page) the sector size is 4KiB. 
The JFFS2 virtual block size is also 4KiB.

The size of pristine node is 4KiB data + node header. So, in 
uncompressed form, the pristine node can't fit into JFFS2 block if the 
compression is disabled. So, how does JFFS2 work on such flash :-) ?

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
