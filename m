Received: from mo-csw1116.securemx.jp ([210.130.202.158]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWiip-0003eM-8E
 for linux-mtd@lists.infradead.org; Tue, 11 Dec 2018 14:09:19 +0000
Received: from s24c61.dm1.oii.oki.co.jp (localhost.localdomain [127.0.0.1])
 by postfix.imss71 (Postfix) with ESMTP id A5FAFFBC3EF
 for <linux-mtd@lists.infradead.org>; Tue, 11 Dec 2018 23:08:57 +0900 (JST)
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01lp2052.outbound.protection.outlook.com [104.47.124.52])
 by s24c61.dm1.oii.oki.co.jp (Postfix) with ESMTP id 58FC7FBC384
 for <linux-mtd@lists.infradead.org>; Tue, 11 Dec 2018 23:08:57 +0900 (JST)
From: =?iso-2022-jp?B?GyRCSXAwZhsoQiAbJEI5bkxAGyhC?= <takei744@oki.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: =?iso-2022-jp?B?GyRCSXAwZhsoQiAbJEI5bkxAGyhC?= <takei744@oki.com>
Subject: Questions about ubifs,ubi and mtd?
Date: Tue, 11 Dec 2018 14:08:56 +0000
Message-ID: <TY2PR01MB27000DE339F2C8C63CBEF4C49DA60@TY2PR01MB2700.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

We are developing the product using file system using ubi, ubifs on hardwar=
e with NAND flash memory.

Although the development of the product was completed, we are seeking your =
help as the customer who is using it is having trouble with it.

The product we have developed has 6 MTD partitions for NAND flash memory.
These consist of 6 MTDs named 'kernel-a' 'kernel-b', 'rootfs-a', 'rootfs-b'=
, 'data-1', 'data-2', and online program only accesses 'data-1' and 'data-2=
' for write access.
Nevertheless, when loading our program from 'rootfs-a', trying to read the =
inode with the ubifs_read_node() function will result in "bad node type" (e=
x: 193 but expected 9) and the LEB can not be read with the expected value.=
 (Even though you do not have write access to rootfs)
In addition, the file size may be 0 byte in some cases.

Is there anyone who encountered such a problem? Is there patch?

Please let me know, if you have any questions.

Best regards,
Katsuaki Takei/Oki Electric Industry Co., Ltd./JP
