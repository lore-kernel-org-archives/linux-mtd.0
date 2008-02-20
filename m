Received: from rv-out-0910.google.com ([209.85.198.185])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JRpbG-00086a-3u
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 14:07:06 +0000
Received: by rv-out-0910.google.com with SMTP id c24so1898158rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Feb 2008 06:07:03 -0800 (PST)
Message-ID: <4ffb81490802200607n3d5f6ad5h12f4a53399a32466@mail.gmail.com>
Date: Wed, 20 Feb 2008 09:07:03 -0500
From: "Ken Chan" <ken8804@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: MTD - NAND (Micron MT29F16G08)
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

Hi,
I am trying to get my NAND Flash (Micron MT29F16G08 -- 2 GBytes NAND) going.
Based on the data sheet, the page size is 4KB, the Spare area size (i.e.
OOB) is 218 Bytes, the Block size is 512KB.
I am using Linux Kernel 2.6.16 and it does not support this NAND Flash
because of the OOB is 218 Bytes.
I checked the Linux Kernel (2.6.24) and same thing applied.

Here are my questions:
1) How can I build a data structure "struct nand_oobinfo nand_oob_218"?
What shall I put for those eccpos[]?
2) If I don't want to create that new data structure, what is the
alternative method to bring up that NAND Flash?
3) Do anyone have similar problem using that kind of NAND Flash?

Thanks
ken
