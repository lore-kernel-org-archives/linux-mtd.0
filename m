Received: from wa-out-1112.google.com ([209.85.146.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J2zB9-0003c2-4h
	for linux-mtd@lists.infradead.org; Fri, 14 Dec 2007 01:17:33 +0000
Received: by wa-out-1112.google.com with SMTP id v33so1377909wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Dec 2007 17:17:23 -0800 (PST)
Message-ID: <6934efce0712131716x662f1f4k829a0d5bc396f25e@mail.gmail.com>
Date: Thu, 13 Dec 2007 17:16:55 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"David Woodhouse" <dwmw2@infradead.org>
Subject: [GIT PULL] cache invalidation error, unlock blocks on power up,
	point hack
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: Justin Treon <justin_treon@yahoo.com>, massimo cirillo <maxcir@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

Would you please pull from my git tree: /users/jehulber/mtd.git

It has three patches that have been reviewed but not applied.

(1) The cache invalidation error fix from Massimo Cirillo
(2) Unlock block on powerup on Intel NOR from Justin Treon
(3) Physical address from ->point() from Jared Hulbert

Thanks,
  Jared
