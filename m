Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkrqx-0006Gr-W7
 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2018 14:11:53 +0000
From: Richard Weinberger <richard@nod.at>
To: palmer@sifive.com
Cc: wesley@sifive.com, linux-mtd@lists.infradead.org,
 Marek Vasut <marek.vasut@gmail.com>
Subject: upstreaming spi-nor: add support for is25wp{32,64,128,256}
Date: Wed, 01 Aug 2018 16:11:31 +0200
Message-ID: <1955523.Qt66yi4IIu@blindfold>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,

can you please upstream this patch:
https://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git/commit/?h=riscv-all&id=c6e4a154bd008655dd69a850275d5cb082a7304b

>From Marek's and my POV it is ready for mainline.
Expect for the prints in issi_unlock().

Thanks,
//richard
