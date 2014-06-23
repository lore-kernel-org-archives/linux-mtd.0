Received: from mail-am1lp0013.outbound.protection.outlook.com
 ([213.199.154.13] helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz5h5-0006w7-Rp
 for linux-mtd@lists.infradead.org; Mon, 23 Jun 2014 14:58:08 +0000
From: "Riyaz R, Syed Ismail" <SyedIsmail.RiyazR@trane.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: General question about mounting mtdblock device
Date: Mon, 23 Jun 2014 14:57:36 +0000
Message-ID: <F7D25D0F1F13E04EA375953DC5214A6002DA4B47@DM1PRD7301MB016.mgdir.irco.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

Is it safe to do a flash_eraseall and nandwrite a jffs2 image on a mtdblock=
 that is not unmounted cleanly, then mount to a new mount point.
i.e,
1)mount -t jffs2 /dev/mtdblock2 /mnt/1/
2)flash_eraseall -j /dev/mtd2
3)nandwrite -p /dev/mtdblock2 jffs2_image
4)mount -t jffs2 /dev/mtdblock2 /mnt/1/

The mount point is different. This is just a workaround to account for *if*=
 umount doesn't work.

Will the 2nd mount result in nand corruption, since both are accessing same=
 nand space. Specifically, will reboot in such a scenario cause problems, s=
ince both will try to sync and unmounts at the time.

--Ismail

________________________________

The information contained in this message is privileged and intended only f=
or the recipients named. If the reader is not a representative of the inten=
ded recipient, any review, dissemination or copying of this message or the =
information it contains is prohibited. If you have received this message in=
 error, please immediately notify the sender, and delete the original messa=
ge and attachments.
