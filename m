Received: from bay19-f9.bay19.hotmail.com ([64.4.53.59] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C8f8a-0004LY-En
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2004 09:20:30 -0400
From: "zheng wei" <jeanwelly0614@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Sat, 18 Sep 2004 21:20:21 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <BAY19-F9ZrKoUhTewrY00004a73@hotmail.com>
Subject: bug.h problem occured when updating the mtd driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using ARM Linux 2.4.18 in my S3C2410 board, and now I download a new 
released MTD driver, and use patchin.sh to patch mtd.
But when I make zImage, error found, saying cannot found bug.h file...
some body told me to add the bug.h manually,
vi bug.h
#define BUG_ON(X)
#define unlikely(X) (X)

but it cannot work when make zImage, how can I make the new mtd work in my 
current ARM Linux version.

Thanks a lot!
