Received: from rv-out-0910.google.com ([209.85.198.188])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1II56M-0008OL-7n
	for linux-mtd@lists.infradead.org; Mon, 06 Aug 2007 12:06:39 -0400
Received: by rv-out-0910.google.com with SMTP id g11so1133764rvb
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Aug 2007 09:06:37 -0700 (PDT)
Message-ID: <d7ca49770708060906x951ade9q2a4553714e62d86d@mail.gmail.com>
Date: Mon, 6 Aug 2007 21:36:36 +0530
From: "Manish Dusane" <manish2312@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 partitions on a part of Flash.
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi,

For my project, I am using only a part of flash (~50% of 8MB), with 4
jffs2 partitions. I have made the necessary changes, but jffs2 mount fails.

'jffs2_scan_medium' during scan the non-jffs2 erase-blocks and ignore
(with ''Magic BitMask not found" errors). After that the scanning
should proceed and the partitions should be get mounted correctly. I
have taken care of return values, ensuring the scan-errors do not fail
the mount.

Has anyone tried this before ? Am i missing something here ?

Would really appreciate any insights.

TIA,
- Manish
