Received: from mail.comet.ch ([193.135.218.122])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbADB-00076G-Gp
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2015 16:00:50 +0000
From: "Morand, Guy" <Guy.Morand@comet.ch>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBIFS corruption and UBI + unstable bit questions
Date: Thu, 26 Mar 2015 16:00:27 +0000
Message-ID: <68AC191B3EB2874F99C36CD9CA3A6D42195CB0@cgpmbx01.comet.ch>
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

Hello UBI developers,

I was wondering what happens to the UBI volume if an UBIFS partition gets=20
corrupted:
* Is only the partition corrupted?
* Is the whole volume corrupted?

Moreover, about this "Unstable bit issue" ...=20
* Does it still make sense to use UBI/UBIFS as it doesn't seem to be fully=
=20
  power cut failsafe?
* Have you planned to fix this issue?

Best regards,

Guy
