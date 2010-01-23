Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NYcee-0005ZF-F7
	for linux-mtd@lists.infradead.org; Sat, 23 Jan 2010 09:51:49 +0000
Received: by ewy23 with SMTP id 23so2337868ewy.4
	for <linux-mtd@lists.infradead.org>;
	Sat, 23 Jan 2010 01:51:42 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 23 Jan 2010 17:51:42 +0800
Message-ID: <791c381001230151t45f3003dh1cc5b24bf0a1783f@mail.gmail.com>
Subject: Dose linux-mtd really support mlc nand flash?
From: liulunzuo <liulunzuo@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi:
  Mlc nand flash should be write only once per write operation(NOP=1),
  but i found when i use mtd-utils to write a mtdchar device with oob ,
  it write a page twice: page and oob zone wrote separately,
  and mtdchar.c support no way to write a page and oob zone to the mlc
nand flash at the same time.

  And when a writing or eraseing operation fail, yaffs2 fs will mark
the block as bad block,
  but the function "markbad" will only write oob area neither use a
bad block scan first nor not.

  it seems a real problem when i use mlc nand flash under yaffs2.

  My English is so poor, could you know what i mean?

Thanks.

Best Regards!
