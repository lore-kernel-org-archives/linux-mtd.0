Received: from rv-out-0910.google.com ([209.85.198.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JJpEu-0007LF-8q
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 12:07:05 +0000
Received: by rv-out-0910.google.com with SMTP id c24so1854172rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Jan 2008 04:02:56 -0800 (PST)
Message-ID: <3db60e760801290402p282910dey9891eb9b10c80661@mail.gmail.com>
Date: Tue, 29 Jan 2008 17:32:55 +0530
From: "Tushar Kapse" <tusharkapse@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: MTD nand device mount problem
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
           I am working on the PXA-255 (armV5T) board with 128mb nand support.
To boot the board using MTD nand, I did the following steps:
1. Booted the board using ram filesystem.
2. Using the mtd utility "flash_eraseall" erased the partition /dev/mtd0
    ./flash_eraseall -j /dev/mtd0
3. Using the mtd utility "nandwrite" wrote the jffs2 filesystem image
to /dev/mtd0
   ./nandwrite -jf /dev/mtd0 250kb.jffs2
4. After this to verify, I tried to mount /dev/mtdblock0
    where I have received the following error messages,
end_request: I/O error, dev mtdblock0, sector 262016
printk: 35 messages suppressed.
Buffer I/O error on device mtdblock0, logical block 32752
end_request: I/O error, dev mtdblock0, sector 262016
Buffer I/O error on device mtdblock0, logical block 32752
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
end_request: I/O error, dev mtdblock0, sector 0

What could be the problem?

Regards,

Tushar Kapse
