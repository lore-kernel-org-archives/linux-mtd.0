Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLrnM-0003E8-5T
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:00:49 +0000
Received: by qwi2 with SMTP id 2so2531149qwi.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 May 2011 00:00:46 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 16 May 2011 17:00:46 +1000
Message-ID: <BANLkTimzSjv5UX=UqFYTyGZnM8ESk731dQ@mail.gmail.com>
Subject: mtd-char driver 2.6.35
From: linux newbie <linux.newbie79@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I recently migrated my kernel from 2.6.27 to 2.6.35 and observed that
one of our application program was not working as expected. This
application writes data to NAND using mtd-char. Write is success, but
on reading the same block the data is corrupted. This is happening
intermittently i.e not consistent to same block.

We are running JFFS2 in another partition of NAND, I can say mtd-block
is not having any issue.

I also migrated the code to 2.6.38 and observed the same issue.

Has anyone face the same problem, if yes is there any solution?

Thanks
