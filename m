Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QXzee-0007W2-J8
	for linux-mtd@lists.infradead.org; Sat, 18 Jun 2011 17:49:57 +0000
Received: by pzk28 with SMTP id 28so2912479pzk.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Jun 2011 10:49:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DFCD44A.4090909@gmail.com>
References: <4DFB9458.1030304@gmail.com> <20110617210014.GA28332@parrot.com>
	<4DFCD44A.4090909@gmail.com>
Date: Sat, 18 Jun 2011 10:49:52 -0700
Message-ID: <BANLkTinXQ7aPOf7L1tqj362SR+b3TRe-XQ@mail.gmail.com>
Subject: Re: Problem with clean markers/partial writes on Micron 4-bit ECC NAND
From: Kevin Cernekee <cernekee@gmail.com>
To: Peter Barada <peter.barada@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Eric Nelson <eric.nelson@logicpd.com>,
	Peter Barada <peter.barada@logicpd.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 18, 2011 at 9:37 AM, Peter Barada <peter.barada@gmail.com> wrot=
e:
> The issue I have is how can I best tell MTD (and FS layers on top of it)
> that some of the OOB bytes can not be used in partial writes due to those
> bytes perturbing the ECC, or how to change JFFS2 to erase the block after
> writing the cleanmarker when it wants to write data into the block.

FWIW, the product I work on used to utilize JFFS2 and YAFFS2.  We
needed to hack around many of the same OOB/NOP limitations you are
seeing.  (As well as several cases where corrupted filesystem metadata
caused a kernel oops on mount.)

Once UBIFS became a viable alternative, we found that supporting
JFFS2/YAFFS2 on NAND flash was far more trouble than it was worth.

> Why does JFFS2 write a clean marker into the empty block? =C2=A0Is it to =
cover
> some state transition where power could be interrupted?

Here is a good explanation:

http://linux-mtd.infradead.org/faq/jffs2.html#L_clmarker
