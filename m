Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ElRws-0005Bv-13
	for linux-mtd@lists.infradead.org; Sun, 11 Dec 2005 09:13:26 -0500
Message-ID: <439C33D2.506@yandex.ru>
Date: Sun, 11 Dec 2005 17:12:34 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao <forrest.zhao@intel.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: EBH question 1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zhao,

did JFFS2 work in your test in this case:

1. flash_eraseall -j /dev/mtd0
flash_eraseall is *old*, it puts cleanmarkers and is not EBH-aware.

2. mount jffs2
3. copy any file to jffs2
4. unmount
5. mount

?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
