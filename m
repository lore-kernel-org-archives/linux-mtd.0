Received: from wa-out-1112.google.com ([209.85.146.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KOaRV-00074I-8D
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 15:51:54 +0000
Received: by wa-out-1112.google.com with SMTP id v33so312139wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Jul 2008 08:51:51 -0700 (PDT)
Message-ID: <2b49c3100807310851k75fb8230uce38545c459e4497@mail.gmail.com>
Date: Thu, 31 Jul 2008 21:21:51 +0530
From: "Tiju Jacob" <jacobtiju@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: jffs2 support for nand flash
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

Hi All,

I have a freescale based development board i.MX27 ADS. I am trying to
boot from a
nand flash (Samsung) using redboot. It seems that redboot does not
have the nand driver but treats it as if it were nor with flat address
space. My queries are:

1. From where do I start to write the NAND drivers?
2. How would I enable the nand flash in redboot?
3. How to integrate jffs2 filesystem with redboot?
4. If integrated will I be able to write, read, erase files in the nand flash?
5. How could I enable the support for these functionalities?

Please also give me links to where I would be able to get more
information regarding this.

Thanks in advance.

TJ
