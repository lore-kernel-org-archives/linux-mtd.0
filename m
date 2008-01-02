Received: from wa-out-1112.google.com ([209.85.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J9x0U-0003cr-8C
	for linux-mtd@lists.infradead.org; Wed, 02 Jan 2008 06:23:14 +0000
Received: by wa-out-1112.google.com with SMTP id v33so8913509wah.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 Jan 2008 22:19:17 -0800 (PST)
Message-ID: <bae050c10801012219m71d7415du4379e5b5d5a54560@mail.gmail.com>
Date: Wed, 2 Jan 2008 14:19:16 +0800
From: Nancy <nancydreaming@gmail.com>
To: kmpark@infradead.org
Subject: Re: Does UBI support MLC nand flash?
In-Reply-To: <bae050c10801012213p2c7d630r6efcf5c1f77b78df@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
	<002601c84cfa$7886bc10$1fa9580a@swcenter.sec.samsung.co.kr>
	<bae050c10801012213p2c7d630r6efcf5c1f77b78df@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

oh, forgot to metion UBI.
UBI has two headers for each LED/PED, they are not write at same time.
Is that against MLC nand's no ramdom write and  write only once
permission?

--
Best Regards,
Nancy
