Received: from mail153.messagelabs.com ([216.82.253.51])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JHJuZ-0000TW-Ie
	for linux-mtd@lists.infradead.org; Tue, 22 Jan 2008 14:15:42 +0000
Received: from az33exr04.mot.com (az33exr04.mot.com [10.64.251.234])
	by motgate3.mot.com (8.12.11/Motorola) with ESMTP id m0MEFXXi025057
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jan 2008 07:15:33 -0700 (MST)
Received: from az10vts02.mot.com (az10vts02.mot.com [10.64.251.243])
	by az33exr04.mot.com (8.13.1/Vontu) with SMTP id m0MEFWxq007998
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jan 2008 08:15:33 -0600 (CST)
Received: from ct11exm60.ds.mot.com (CT11EXM60.am.mot.com [10.177.8.44])
	by az33exr04.mot.com (8.13.1/8.13.0) with ESMTP id m0MEFVgr007963
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jan 2008 08:15:32 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: problem with 2k page NAND with squashfs
Date: Tue, 22 Jan 2008 09:15:29 -0500
Message-ID: <A2EC06CB0E393B4C8EB220B286B7083E05897213@ct11exm60.ds.mot.com>
From: "Adams Richard-W36112" <rgadams@motorola.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 I have an arm-based embedded system running a 2.6.10 kernel. I'm using
a squashfs file system (read only) on the Flash device. The system was
working fine with a 512 byte page Flash part. I started having problems
when I upgraded to a 2048 byte page Flash part. When I mount the squash
file system, it can successfully find the super block, but squashfs
fails (unable to read inode [5ff3:120]) when it try's to finish the
mount. My suspicions are that with the older kernel (2.6.10) it may not
fully support the larger page devices. Is there an achieve of patches
that are applicable for a 2.6.10 kernel? I tried to look through the
mailing list archive, but without a search tool and not knowing what
month I'm looking for the task became tedious.
=20
Rick Adams
(858) 404-3091  -- Motorola Office
(858) 775-1136  -- cell phone
