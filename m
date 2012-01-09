Received: from na3sys009aog105.obsmtp.com ([74.125.149.75])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rk8oL-0005x2-3O
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 06:34:25 +0000
Received: by mail-vw0-f42.google.com with SMTP id fd1so5292871vbb.1
 for <linux-mtd@lists.infradead.org>; Sun, 08 Jan 2012 22:34:20 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 9 Jan 2012 17:34:20 +1100
Message-ID: <CA+0Dg4q8+6Z+UAr6ni0v_GA70Phhaug-s=PCZyYLjHV1Sk-Qww@mail.gmail.com>
Subject: No oob scheme defined for oobsize 218
From: Joo Aun Saw <jasaw@dius.com.au>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm getting this error and hope someone can help me.

ONFI flash detected
ONFI param page 0 valid
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xd3 (Micron MT29F8G08AAA)
No oob scheme defined for oobsize 218

Do I need to define struct nand_ecclayout nand_oob_218? or can I use
the nand_oob_128 ecc layout?
I'm running Linux version 3.0.4.

Thanks in advance.
