Received: from mx.artech.at ([188.21.106.106] helo=mail.artech.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b70ve-0006FR-JU
 for linux-mtd@lists.infradead.org; Sun, 29 May 2016 13:38:55 +0000
From: Matthias Auchmann <m.auchmann@artech.at>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Sun, 29 May 2016 15:38:28 +0200
Subject: mtd locking
Message-ID: <566B344A0B1AB14EB2486D887B6FF9E0331F3DB470@SRV01.ARTech.local>
Content-Language: de-DE
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

Hi all!

I have a question - sorry if it turns out to be a beginner's question. I'm =
using kernel version 3.17, but as far as I can tell my question still appli=
es.

My question is how locking is ensured with MTD. I understand that usually t=
here would only be one file system attached to one mtd partition, but what =
if I concurrently ran multiple instances of nanddump from userspace? Is MTD=
 thread-safe?

I'm asking since I had an issue where when I called nanddump on two partiti=
ons of the same NAND flash simultaneously, the ECC errors would count up fo=
r both nanddumps although only one partition had ECC errors. Experimentally=
 adding a mutex to mtdpart.c's part_read() function solved the issue.

I then noticed that quite frequently in the MTD code, ecc_stats are saved, =
then some reads are performed, and then ecc_stats are compared. No mutex or=
 spinlock or whatever protection is used. Given that the ECC errors can res=
ult in -EUCLEAN or a positive bitflip count (then resulting in scrubbing fo=
r UBI for example)... I started to feel a little uncomfortable about the wh=
ole MTD locking issue.

This is where the question comes from... could anyone shed light on this?

Thanks!
