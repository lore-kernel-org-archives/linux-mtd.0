Received: from wa-out-1112.google.com ([209.85.146.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1aM8-0005UW-Hf
	for linux-mtd@lists.infradead.org; Wed, 06 May 2009 06:11:55 +0000
Received: by wa-out-1112.google.com with SMTP id j5so2558071wah.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 May 2009 23:11:43 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 6 May 2009 14:11:43 +0800
Message-ID: <39811fe10905052311p53eaf0bcl4274e92ed030bbdd@mail.gmail.com>
Subject: UBIFS recovery fail
From: Jacky Lam <jackylam.gsl@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

	I have no idea why my UBIFS suddenly corrupted. But when I try to mount
the UBIFS again, the following error appear:

	UBIFS: recovery needed
	UBIFS error (pid 1057): check_lpt_type: invalid type (15) in LPT node
type 2
	mount: mounting ubi0:fat on /mnt/fat failed: Invalid argument

	Is there any way to recovery or let me clear the volume and mount again?

	Thanks.

BR,
Jacky
