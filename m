Received: from freesurfmta02.sunrise.ch ([194.230.0.17] helo=freesurfmail.sunrise.ch)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16T0vl-0007Qv-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 13:25:41 +0000
From: Felix Frey <ffrey@freesurf.ch>
To: paolo.supino@harmonicdata.com
Subject: Re: DOC, grub and whatever is in between
Date: Tue, 22 Jan 2002 14:36:26 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Message-Id: <02012214362600.01417@theodul>
Content-Transfer-Encoding: quoted-printable
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

Paolo,

I've no experience in using grub, however, I'm running a system with a DO=
C=20
millenium using lilo v22.1 as bootloader. It runs perfectly, you don't ha=
ve=20
to patch anything, not even the bios part of the DOC (use the original on=
e=20
from m-systems).
Be aware to use the latest lilo version, older ones don't support mtd.

Felix
