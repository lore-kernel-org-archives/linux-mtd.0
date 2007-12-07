Received: from wa-out-1112.google.com ([209.85.146.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J0ebf-0006r9-QP
	for linux-mtd@lists.infradead.org; Fri, 07 Dec 2007 14:55:17 +0000
Received: by wa-out-1112.google.com with SMTP id v33so1447592wah
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 Dec 2007 06:55:10 -0800 (PST)
Message-ID: <8bf247760712070655t1efb8e28x846747e36b4fada3@mail.gmail.com>
Date: Fri, 7 Dec 2007 20:25:08 +0530
From: Ram <vshrirama@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Power Fail test - JFFS2 Errors.
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
   I am using Linux 2.6.19. On a newly flashed board, I boot out of
linux. I dont add any files.

   The startup files loads some linux kernel modules. As soon as i get
the shell prompt,
   If i swicth off the power to my board.
   When i boot linux again. I get the following JFFS2 errors:

  JFFS2 notice: (116) check_node_data: wrong data CRC in data node at
0x01306800: read 0x5dc93a5c, calculated 0x6b022e2a.


 I dont think this the expected behaviour of JFFS2 filesystem?.


 Has anyone got a similar error?


Please advice,
