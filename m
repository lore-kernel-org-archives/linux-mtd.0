Received: from reefedge.com ([216.10.14.212] helo=reefedge.reefedge.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16B18W-00004t-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2001 22:00:28 +0000
Received: from gwydir (localhost.localdomain [127.0.0.1])
	by reefedge.reefedge.com (8.12.1/8.12.1) with SMTP id fB3M9rAI018485
	for <linux-mtd@lists.infradead.org>; Mon, 3 Dec 2001 17:09:54 -0500
From: "Craig Gwydir" <craig@reefedge.com>
To: <linux-mtd@lists.infradead.org>
Subject: creating jffs filesystems with mkfs.jffs
Date: Mon, 3 Dec 2001 17:14:22 -0500
Message-ID: <BCEMJHKGMLINCAMLMLBFIEMDCDAA.craig@reefedge.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <BCEMJHKGMLINCAMLMLBFOELLCDAA.craig@reefedge.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I am using an Intel E28F128 flash part in my design along with jffs v1 (x86,
linux 2.4).

The Intel flash part is organized as 128 x 128KB blocks.

Question: Are there any options I should use on mkfs.jffs to accomodate
this?
          Should I use the mkfs.jffs -e option and set it to 131072 for the
erase size
          when creating the jffs filesystem?

Thx,
Craig
