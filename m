Received: from ip2.esoft.com.tw ([211.21.74.99] helo=esoft.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1890Dm-00080Z-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 09:42:07 +0000
Received: (from root@localhost)
	by esoft.com.tw (8.12.6/8.12.6) id gA5AC744002788
	for linux-mtd@lists.infradead.org; Tue, 5 Nov 2002 18:12:07 +0800 (CST)
	(envelope-from jimmyc@esoft.com.tw)
Received: from jimmy.esoft.com.tw ([192.168.1.15])
	by esoft.com.tw (8.12.6/8.12.6av) with ESMTP id gA5AC34Y002780
	for <linux-mtd@lists.infradead.org>; Tue, 5 Nov 2002 18:12:05 +0800 (CST)
	(envelope-from jimmyc@esoft.com.tw)
Content-Type: text/plain;
  charset="us-ascii"
From: jimmy tanyoongtak <jimmyc@esoft.com.tw>
Reply-To: jimmyc@esoft.com.tw
To: linux-mtd@lists.infradead.org
Subject: Booting on DOM
Date: Tue, 5 Nov 2002 18:14:11 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200211051814.12000.jimmyc@esoft.com.tw>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

=09I'm compressing jffs2 image and dd to DOM using lfs in x86 arch,that w=
ork=20
o.k.Beside i can also mount the DOM with jffs2 filesystem to other=20
partitions.The question is , how can i using lilo or grub to booting DOM =
that=20
filesystem is jffs2.I find information over internet but can't fount it .=
=20
Does any one who had been successfully using lilo or grub mounting jffs2=20
filesystem????
thanx
--=20
Esoft embedded system
email jimmyc@esoft.com.tw
