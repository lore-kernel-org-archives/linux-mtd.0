Received: from wa-out-1112.google.com ([209.85.146.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J9wuV-0003H6-Jx
	for linux-mtd@lists.infradead.org; Wed, 02 Jan 2008 06:17:03 +0000
Received: by wa-out-1112.google.com with SMTP id v33so8910449wah.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 Jan 2008 22:13:07 -0800 (PST)
Message-ID: <bae050c10801012213p2c7d630r6efcf5c1f77b78df@mail.gmail.com>
Date: Wed, 2 Jan 2008 14:13:07 +0800
From: Nancy <nancydreaming@gmail.com>
To: kmpark@infradead.org
Subject: Re: Does UBI support MLC nand flash?
In-Reply-To: <002601c84cfa$7886bc10$1fa9580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
	<002601c84cfa$7886bc10$1fa9580a@swcenter.sec.samsung.co.kr>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sir,
     I don't know what is NOP, POP stand for? can you explain that?

     I notice mtd-utils "nandwrite.c" does write each page's oob area
twice, write oob(filesystem area) once, and then call "pwrite" to
write pagedata including oob (ecc part). I don't think that will work
right on MLC nand.


--
Best Regards,
Nancy
