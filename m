Received: from rn-out-0910.google.com ([64.233.170.185])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L7X3P-0001Nd-Og
	for linux-mtd@lists.infradead.org; Tue, 02 Dec 2008 15:20:47 +0000
Received: by rn-out-0910.google.com with SMTP id k50so2678971rnd.3
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Dec 2008 07:20:46 -0800 (PST)
Message-ID: <ecdd5ced0812020720p47bc8fdcw5589f6a5c6f4e95c@mail.gmail.com>
Date: Tue, 2 Dec 2008 10:20:45 -0500
From: "Andrew Xiang" <andrewxiang@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: jffs2 scan utility?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Is there an utility that I can run to scan a JFFS2 partition and
report back all error in the partition?
I encountered a corruption case where mount did not pick up. But a
file was corrupted and it would not allow me to copy the file.
A power failure occurred during the GC activity.
