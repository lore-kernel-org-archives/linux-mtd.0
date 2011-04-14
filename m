Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAJqj-0003PV-P2
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 10:32:34 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>, MTD list
	<linux-mtd@lists.infradead.org>
Date: Thu, 14 Apr 2011 06:32:31 -0400
Subject: RE: [PATCH] UBI: fix typo in a message
Message-ID: <0A40042D85E7C84DB443060EC44B3FD328119F6E86@dekaexchange07.deka.local>
References: <1302770303-3833-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1302770303-3833-1-git-send-email-dedekind1@gmail.com>
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

Artem:

> but should print "do not mark it sa bad".

  Well, hopfully:

  "do not mark it as bad".
                  =3D=3D
                       Atlant


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Artem Bityutskiy
Sent: Thursday, April 14, 2011 04:38
To: MTD list
Subject: [PATCH] UBI: fix typo in a message

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When a PEB passes the torture test, UBI prints
"do not mark it a bad", but should print "do not mark it sa bad".
This patch corrects the typo.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index d58ceb1..8c1b1c7 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -465,7 +465,7 @@ static int torture_peb(struct ubi_device *ubi, int pnum=
)
        }

        err =3D patt_count;
-       ubi_msg("PEB %d passed torture test, do not mark it a bad", pnum);
+       ubi_msg("PEB %d passed torture test, do not mark it as bad", pnum);

 out:
        mutex_unlock(&ubi->buf_mutex);
--
1.7.2.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
