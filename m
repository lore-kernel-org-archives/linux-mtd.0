Received: from remote.digitalcpt.com ([64.199.159.135])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJUr8-00027U-Pf
	for linux-mtd@lists.infradead.org; Thu, 17 Jul 2008 14:53:19 +0000
From: Christopher Reder <CReder@digitalcpt.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 17 Jul 2008 09:52:27 -0500
Subject: NOR flash erasing, but not writing
Message-ID: <9DD54F664D7E184F9802304615B2A4591C1D2CFB6B@dci-exch07-1.digitalcpt.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am running linux 2.6.21 on an embedded system.  I have a nor flash (AMD s=
tyle) and am able to update the kernel by using u-boot.  I would like to be=
 able to do update the kernel from userspace.

I have the mtd_debug utility as well as the mtd-utils like flash_cp and fla=
sh_eraseall.

Here are the steps I've tried:

1. flash_eraseall /dev/mtd2   (after doing this, I see that the kernel that=
 was there is now erased)
2. flashcp uImage /dev/mtd2

after doing flashcp, it says that the verification failed which makes sense=
 since it is erased, but not written.

I have also tried:  dd if=3DuImage of=3D/dev/mtd2 after doing an erase with=
 no luck.

If I am able to read from the device and erase the device, what else do I n=
eed to do to write properly?  I understand that the commands are different =
and just because you can do one doesn't mean you can do the other, but I am=
 at a loss at what else to try.  I am able to update through u-boot so the =
hardware is fine.

Thanks in advance for any help/suggestions.
Christopher
