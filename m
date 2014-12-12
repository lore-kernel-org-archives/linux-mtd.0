Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzLJ1-0004hi-FY
 for linux-mtd@lists.infradead.org; Fri, 12 Dec 2014 08:10:32 +0000
MIME-Version: 1.0
Message-ID: <trinity-a1228aa8-8eaa-4950-9c14-5d6b6db5f3d7-1418371801058@3capp-1and1-bs02>
From: "markus.heininger@online.de" <markus.heininger@online.de>
To: linux-mtd@lists.infradead.org
Subject: UBIFS: Is it possible to get the compressed size of a file?
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Dec 2014 09:10:01 +0100
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
=C2=A0
when using compression along with UBIfs, fstat reports the uncompressed fi=
le size
(as it should do). Is there a simple way to get the compressed file size, =
thus the real space
a single file needs on the flash memory?
=C2=A0
Many thanks,
Markus
