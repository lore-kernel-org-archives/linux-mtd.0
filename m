Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJOd4-0003hM-Kj
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 01:37:38 -0500
Received: by ug-out-1314.google.com with SMTP id m2so685112uge
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Feb 2007 22:37:22 -0800 (PST)
Message-ID: <6b5362aa0702192237o69e7efe9wf5844bfaff91e2ff@mail.gmail.com>
Date: Tue, 20 Feb 2007 12:07:22 +0530
From: "Brijesh Singh" <brijesh.s.singh@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Why is PEB not erased before writing???
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I tried to overwrite same block.
Ubi should call erase before overwriting the data block.But it didn't.
UBI simply wrote the block again.That will write garbage for a flash.
So who will call erase??Is it the application's responsibility to call
erase before writing at same  location???

I am stuck here because my concept was,
ubi will check if we are re-writing the same PEB.
If yes,UBI will erase the block and then write the same block.

Regards,
BRIJESH
