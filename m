Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OoCP6-0001De-7R
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2010 09:36:20 +0000
Received: by qwe4 with SMTP id 4so324752qwe.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Aug 2010 02:36:19 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 25 Aug 2010 17:36:18 +0800
Message-ID: <AANLkTim=JEuHBXXqVFOJ4ozXGSEVxjuCt7sOpXcox-NQ@mail.gmail.com>
Subject: anyone can help me about nand_get_flash_type
From: Tony Wan <visual2me@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I got an ARM device from Marvell with a NAND rom, running Linux
2.6.22.18. These days I'm working on upgrading the kernel to 2.6.31.8.
After the upgrade, all devices work well except the NAND rom. I found
it's because that the device and=A0manufacturer IDs cannot be retrieved
correctly in nand_get_flash_type. =A0In 2.6.22.18, the IDs can be
retrieved as expected; but in 2.6.31.8, the IDs always be 0, which
leads to an error in nand_scan.

I'm a definitely newbie with MTD, and currently have no idea about the
problem. Except IO_ADDR_R & IO_ADDR_W are remapped to different
addresses, I can't find any differences between the 2 versions from
the system log -- may it be the reason? Anyone can give me some tips
about this problem -- how to fix it or how to debug? Any suggestions
will be appreciated.

--
Best regards,
Tony Wan
