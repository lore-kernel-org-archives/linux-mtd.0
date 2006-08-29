Received: from mail128.messagelabs.com ([216.82.250.131])
	by pentafluge.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GI1wg-00022y-4M
	for linux-mtd@lists.infradead.org; Tue, 29 Aug 2006 12:39:55 +0100
Received: from az33exr02.mot.com ([10.64.251.232])
	by motgate7.mot.com (8.12.11/Motorola) with ESMTP id k7TBRBmf004154
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Aug 2006 04:27:11 -0700 (MST)
Received: from ZMY16EXM67.ds.mot.com (zmy16exm67.ap.mot.com [10.179.4.27])
	by az33exr02.mot.com (8.13.1/8.13.0) with ESMTP id k7TBR9SO015913
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Aug 2006 06:27:10 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Linux Kernel booting the root file system compiled for another
	processor
Date: Tue, 29 Aug 2006 19:27:07 +0800
Message-ID: <B7803DC652E2F9458758AEBB6A5FD60F011E4B0D@ZMY16EXM67.ds.mot.com>
In-Reply-To: <200608231745406401974@gmail.com>
From: "M Sudharshana-A18475" <sudharshana@motorola.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Was unsure this question could be raised in this forum. Please ignore if
it shouldn't be this forum.

I have scenario where, I have options to compile the ROOT file system
for either ARM or another processor, with a raider, Linux Kernel is
compiled for ARM only. Assuming, "CramFS" is used for both the
processor's image.

In such a case, Can Linux Kernel mount root file system that is compiled
for another processor? Is there any such dependency or nothing at all?

Thanks
Sudharshana
