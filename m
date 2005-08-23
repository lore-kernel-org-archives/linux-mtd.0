Received: from mx01.net.com ([134.56.3.131])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E7Zab-0001jP-BD
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 10:17:37 -0400
Received: from mx01-int.net.com (mx01-int.net.com [134.56.112.13])
	by mx01.net.com (Switch-3.1.3/Switch-3.1.0) with ESMTP id
	j7NEJsSp018654 for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2005 07:19:54 -0700 (PDT)
Received: from fmt-ex01.net.com (fmt-exchange.net.com [134.56.112.251])
	by mx01-int.net.com (Switch-3.1.3/Switch-3.1.0) with ESMTP id
	j7NECaOO011050 for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2005 07:12:37 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Aug 2005 07:16:28 -0700
Message-ID: <CE711B0E5D7A1A4096A808997E00832982A949@fmt-ex01.net.com>
From: "Tony Hardie" <Tony_Hardie@net.com>
To: <linux-mtd@lists.infradead.org>
Subject: jffs2 image upgrade on running system root
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Guys,
I have a running embedded 2.6.11 distro with a busybox type jffs2 rfs.
Not I am trying to upgrade that jffs2 imaged and tried something like to =
following.

Have a temp ext2 ramdisk mounted in /mnt=20
pivot_root . oldroot exec chroot . /linuxrc <dev/console >dev/console =
2>&1 or exec chroot . /sbin/init <dev/console >dev/console 2>&1

all "seem" to work but init is still running I think on the /oldroot/ as =
well so when I try to umount /oldroot is just get=A0 device or resource =
busy.
Any ideas?

Thanks
Tony


Tony Hardie B.Sc
SHOUTIP Software Architect
Net.com
6900 Paseo Padre Parkway
Fremont
CA, 94555
Ph: 510-574-2386
Mob: 510-449-4339
