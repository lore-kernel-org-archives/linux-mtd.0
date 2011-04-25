Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEJNb-0006fH-70
	for linux-mtd@lists.infradead.org; Mon, 25 Apr 2011 10:51:03 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>, MTD list
	<linux-mtd@lists.infradead.org>
Date: Mon, 25 Apr 2011 06:51:24 -0400
Subject: RE: [PATCH 4/5] UBIFS: remove strange commentary
Message-ID: <0A40042D85E7C84DB443060EC44B3FD32A694157A2@dekaexchange07.deka.local>
References: <1303651565-18302-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303651565-18302-1-git-send-email-dedekind1@gmail.com>
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


Folks:

> /* 'generic_file_mmap()' takes care of NOMMU case */
>
> I do not understand what it means,

  It sounds like there must be / must have been code
  to handle memory mapping in systems that do not
  have a Memory Management Unit (an MMU providing
  virtual-to-physical address translation).

                         Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Artem Bityutskiy
Sent: Sunday, April 24, 2011 09:26
To: MTD list
Subject: [PATCH 4/5] UBIFS: remove strange commentary

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Remove the following commentary from 'ubifs_file_mmap()':

/* 'generic_file_mmap()' takes care of NOMMU case */

I do not understand what it means, and I could not find anything relater to
NOMMU in 'generic_file_mmap()'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/file.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index adce3b7..5e7fccf 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1541,7 +1541,6 @@ static int ubifs_file_mmap(struct file *file, struct =
vm_area_struct *vma)
 {
        int err;

-       /* 'generic_file_mmap()' takes care of NOMMU case */
        err =3D generic_file_mmap(file, vma);
        if (err)
                return err;
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
