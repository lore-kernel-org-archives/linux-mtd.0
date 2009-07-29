Received: from mail-pz0-f197.google.com ([209.85.222.197])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWGpi-0006kq-Qm
	for linux-mtd@lists.infradead.org; Wed, 29 Jul 2009 21:37:15 +0000
Received: by pzk35 with SMTP id 35so729856pzk.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jul 2009 14:37:08 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 29 Jul 2009 14:32:02 -0700
Message-ID: <1c3f4270907291432v63b064a2r71806b7d414782a@mail.gmail.com>
Subject: mtd gluebi issue
From: Manoj <manoj23@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to use jffs2 on ubi volumes using CONFIG_MTD_UBI_GLUEBI
option. I have also enabled CONFIG_JFFS2_FS_WBUF_VERIFY to verify
every write from jffs2. The kenel seems to crash in
jffs2_verify_write() because wbuf_verify is not initialized. It needs
to be initialized in jffs2_ubivol_setup() like how it is done in
jffs2_nand_flash_setup. Am I seeing it right?
