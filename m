Received: from pro-236-98.rediffmailpro.com ([202.137.236.98])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ldodx-00067Z-BH
	for linux-mtd@lists.infradead.org; Sun, 01 Mar 2009 16:36:00 +0000
Date: 1 Mar 2009 16:35:12 -0000
Message-ID: <20090301163512.17419.qmail@pro-236-98.rediffmailpro.com>
MIME-Version: 1.0
From: "Syed Ismail" <ismail.riyaz@dyansys.com>
To: linux-mtd@lists.infradead.org
Subject: nand with jffs2
Content-type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: ismail.riyaz@dyansys.com
Reply-To: Syed Ismail <ismail.riyaz@dyansys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi=0AI am having problems using nand flash on my mx31 ads board. I use two =
1 gb nand parts. I first want to ensure 1 gb works. File system used is jff=
s2 on linux 2.6.24.=0A If I make a mtd partition that has no bad blocks, I =
can erase it using flash_eraseall =96j and then mount it with =96t jffs2 op=
tion. If I use this partition for root file system, it works fine, but some=
 jffs2 warnings come up, like crc errors.=0AIf I make a mtd partition that =
contain bad blocks, when mounting i get a lot of mtd-> read ecc errors, fol=
lowed by jffs2 messages. It=92s like bad blocks are also being read, though=
 when I do nand write, bad blocks get skipped.=0AThe final 5 or 6 blocks al=
ways are shown as bad blocks when I do flash_eraseall( I have tried with fo=
ur different chips). If my mtd partition contains these last 5 blocks, moun=
ting gives input/output error, with messages of "Cowardly refusing to erase=
 blocks on filesystem with no valid JFFS2 nodes ".=0AOne more thing is that=
, when I mount I get message of =93jffs2 not using oob=94.=0ACan anyone hel=
p me here? Thanks=0A
