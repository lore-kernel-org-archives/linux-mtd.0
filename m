Received: from mail-vw0-f181.google.com ([209.85.212.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MoXr7-0003Zj-9f
	for linux-mtd@lists.infradead.org; Fri, 18 Sep 2009 07:26:14 +0000
Received: by vws11 with SMTP id 11so777091vws.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Sep 2009 00:26:08 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
Date: Fri, 18 Sep 2009 16:26:07 +0900
Message-ID: <9c9fda240909180026x7183ccecw9a1a3430090787a3@mail.gmail.com>
Subject: UBIFS warning: ubifs_vm_page_mkwrite: out of space for mmapped file
From: Kyungmin Park <kmpark@infradead.org>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Do you have any clue of following message?

We used the latest UBIFS.

[21474583.825000] UBIFS warning (pid 1263): ubifs_vm_page_mkwrite: out
of space for mmapped file (inode number 2180)
[21474583.830000] UBIFS warning (pid 1263): ubifs_vm_page_mkwrite: out
of space for mmapped file (inode number 2180)
[21474584.190000] UBIFS warning (pid 1362): ubifs_vm_page_mkwrite: out
of space for mmapped file (inode number 2180)
[21474584.200000] UBIFS warning (pid 1362): ubifs_vm_page_mkwrite: out
of space for mmapped file (inode number 2180)

Thank you,
Kyungmin Park
