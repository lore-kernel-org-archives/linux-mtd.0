Received: from smtp017.mail.yahoo.com ([216.136.174.114])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9dqs-00015a-Ob
	for <linux-mtd@lists.infradead.org>; Wed, 15 Oct 2003 06:05:38 +0100
From: "Alan Shih" <alan@storlinksemi.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 14 Oct 2003 22:04:29 -0700
Message-ID: <ODEIIOAOPGGCDIKEOPILOEMODNAA.alan@storlinksemi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Exclusive lock on MTD partition?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I was not able to find any reference in archive regarding the following:
Does the MTD partition only allow one process to write to it (in case
multiple process tries to open the same device for writing). If no such
feature exist, where would it best placed at? (in mtd open?)

Thanks in advance

Alan
