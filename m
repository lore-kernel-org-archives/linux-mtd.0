Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z34r7-00030c-8X
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2015 15:57:26 +0000
From: Kamil Debski <Kamil.Debski@imgtec.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: NAND/OneNAND/SPI NAND bad block management
Date: Thu, 11 Jun 2015 15:57:00 +0000
Message-ID: <616819EF2EBFD445AEF36EFF651655B6AB8BB1@hhmail02.hh.imgtec.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 Ionela Voinescu <Ionela.Voinescu@imgtec.com>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>,
 "peterpandong@micron.com" <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am currently working on the SPI NAND framework. I noticed that there was =
quite a lot of discussion on this topic.=20

It seems that the necessary task to do first is to make some modification t=
o the bad block management. It is necessary to separate it from the NAND co=
re, as the same bad block handling would be used by the SPI NAND core.=20

My question regarding this is following. OneNAND core also needs BBM and im=
plements it on its own. The design of BBM in OneNAND core is very similar t=
o NAND core - there are also two files onenand_base.c and onenand_bbt.c.  T=
he latter was actually derived from nand_bbt.c. I am pretty sure OneNAND wo=
uld be also benefit from using a generic BBM. I did not find OneNAND mentio=
ned in the previous discussion about separating bad block management from t=
he NAND core [1]. Was there any reason why it was left out, or was it just =
overlooked?

The file include/linux/mtd/bbm.h contains the struct bbm_info, which seems =
as a good place to store the parameters and state of the BBM. I am not sure=
 about creating a new struct nand_bbt for that reason; especially that stru=
ct bbm_info is already used by the OneNAND core.  I would go for embedding =
a struct bbm_info * in struct mtd_info, such that it wouldn't be necessary =
to create wrappers.

I am working on the patches and should send them out soon. I am quite new t=
o mtd, so I am sure you'll have quite a few comments on this topic and the =
patches :)

Best wishes,
Kamil Debski

[1] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057639.html

Other useful links:
- previous attempt at the SPI NAND framework by Ezequiel Garcia
http://lists.infradead.org/pipermail/linux-mtd/2014-December/056763.html
- successive attempt at the SPI NAND framework by Peter Pan
http://lists.infradead.org/pipermail/linux-mtd/2015-January/057223.html
