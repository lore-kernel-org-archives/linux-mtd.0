Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKXPW-0003yW-OR
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 03:30:59 -0400
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id DDEE0229CF
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2004 11:30:26 +0400 (MSD)
Message-ID: <41776592.7020100@yandex.ru>
Date: Thu, 21 Oct 2004 11:30:26 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <41767593.9030004@inf.u-szeged.hu>
In-Reply-To: <41767593.9030004@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 mount time - more
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc,

I have 3 more questions.

1. How large are your summary nodes (in average) for blocks full of 
dirents/nodes ?
2. Why do not you use compression for them?
3. Why did you introduce new tool instead of just adding new options to 
the mkfs.jffs2 ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
