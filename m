Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C92CL-0005qk-Pf
	for linux-mtd@lists.infradead.org; Sun, 19 Sep 2004 09:57:53 -0400
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 9ED30229DD
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Sep 2004 17:56:45 +0400 (MSD)
Message-ID: <414D901A.3000703@yandex.ru>
Date: Sun, 19 Sep 2004 17:56:42 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: NAND_NO_AUTOINCR
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It seems that NAND_NO_AUTOINCR option isn't really used in mtd, anyway...

What does the NAND_NO_AUTOINCR mean? I suspect that this means that in 
read operations we can continue reading next consequitive pages without 
new read operation cycle. Is it this?

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
