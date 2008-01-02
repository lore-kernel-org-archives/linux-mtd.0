Received: from wa-out-1112.google.com ([209.85.146.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J9sgk-0001iS-Q7
	for linux-mtd@lists.infradead.org; Wed, 02 Jan 2008 01:46:43 +0000
Received: by wa-out-1112.google.com with SMTP id v33so8777866wah.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 Jan 2008 17:42:30 -0800 (PST)
Message-ID: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
Date: Wed, 2 Jan 2008 09:42:29 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Does UBI support MLC nand flash?
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

Sir / Madam,

             Does UBI support MLC nand flash?

             According to the MLC nand spec, It is only allowed write
once per erased
block, moreover, it isn't allowed ramdom write during a block, means
the page number must be increase during the write PED operation.


--
Best Regards,
Nancy
