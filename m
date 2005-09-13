Received: from bay17-f15.bay17.hotmail.com ([64.4.43.65] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EF7xg-0003vK-6M
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 06:24:31 -0400
Message-ID: <BAY17-F15A89BAEF117B1219F73ACE89C0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 13 Sep 2005 18:24:21 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Subject: A question about fsdata_pos and fsdata_len
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm not sure if it's a bug, so send out this mail to confirm.

1 In jffs2_nand_set_oobinfo():
c->fsdata_pos = oinfo->oobfree[0][0];
c->fsdata_len = oinfo->oobfree[0][1];
2 In line 88 of nand_base.c
static struct nand_oobinfo nand_oob_8 = {
	.useecc = MTD_NANDECC_AUTOPLACE,
	.eccbytes = 3,
	.eccpos = {0, 1, 2},
	.oobfree = { {3, 2}, {6, 2} }
};
so for this kind of NAND flash, c->fsdata_len is 2.
3 but in jffs2_write_nand_cleanmarker(), it's assumed that
c->fsdata_len is at least 8
n.totlen = cpu_to_je32(8);

I want to know if it's a problem, or I missed something?

Thanks,
Forrest
