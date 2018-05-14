Received: from mail1.bemta8.messagelabs.com ([216.82.243.209])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIAdo-0007uP-IY
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 10:24:12 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at"
 <richard@nod.at>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "PACKHAM
 Chris" <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: RE: [PATCH v5 0/2] mtd: cfi_cmdset_0002: Changes to retry for flash
 erase
Date: Mon, 14 May 2018 10:23:22 +0000
Message-ID: <TY1PR01MB09546F0017C81BA1AE1046CDDC9C0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB09547A5F4FCDAA1FFB601C74DC9C0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180514091214.35ec45b8@bbrezillon>
 <TY1PR01MB09540ADA613B8D72668B9E64DC9C0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180514114440.54190a34@bbrezillon>
In-Reply-To: <20180514114440.54190a34@bbrezillon>
Content-Language: ja-JP
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

Hi Boris-san,

Thanks for the comments.

> There's still a problem: the patches do not appear as a thread. Can you
> paste the git send-email command you use?

  The command that I used is below.
    git send-email v5-0000-cover-letter.patch v5-0001-mtd-cfi_cmdset_0002-C=
hange-definition-naming-to-r.patch v5-0002-mtd-cfi_cmdset_0002-Change-erase=
-functions-to-ret.patch

  I thought that the patches are listed as a thread as below.
    <http://lists.infradead.org/pipermail/linux-mtd/2018-May/080950.html>

  Is this not mentioned by you probably?

> It seems that nothing has changed, so nothing more to review on my side.

  The changes themselves are not changed basically.

> And I'm still not entirely convinced by the fix, but if nobody complains,=
 I'll apply it.

  Probably my explanation or investigation are not enough for you.
  If needed please let me know them I will do that.
    Note: In my understanding the investigation is enough.

  Anyway thank you so much for your reviewing.

> BTW, the changelog is really not clear, you should have something like:

  Very sorry about this let me list the change logs as below.
  Changes since v5:
  - Just fix the commit message of PATCH v4 2/2.
  - No changes for the source code diff.

  Changes since v4:
  - The patch series are just rebased since the coding style fix has been a=
pplied.

  Changes since v3:
  - Just fix the commit message of patch to retry the chip erase error.
  - Change the definition naming to MAX_RETRIES from MAX_WRITE_RETRIES.

  Changes since v2:
  - Split the v1 patch to separate as below.
    1. Fix coding style
    2. Change the definition naming
    3. Retry the erase error

  Changes since v1:
  - Initial patch to retry the chip erase error.

  Note: If needed I will do resend the patch series with the change log.
        So please let me know about this if so.

Regards,
Ikegami
