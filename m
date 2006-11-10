Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GiRfv-0001b0-0Z
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 03:23:56 -0500
Subject: Re: [PATCH/RFC] remove len/ooblen confusion in MTD/NAND code: respin
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <20061109152617.GB12624@ru.mvista.com>
References: <20061109152617.GB12624@ru.mvista.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 10 Nov 2006 10:23:38 +0200
Message-Id: <1163147018.3925.9.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-11-09 at 18:26 +0300, Vitaly Wool wrote:
> Hello folks,

[dedekind@sauron dedekind-mtd-2.6.git]$ patch -p1 --dry-run
< .dotest/patch
patching file drivers/mtd/inftlcore.c
patching file drivers/mtd/nand/nand_base.c
Hunk #2 succeeded at 1006 (offset -1 lines).
Hunk #4 succeeded at 1260 (offset -1 lines).
Hunk #5 succeeded at 1282 (offset -2 lines).
Hunk #6 succeeded at 1300 (offset -1 lines).
Hunk #7 succeeded at 1321 (offset -2 lines).
Hunk #8 succeeded at 1343 (offset -1 lines).
Hunk #9 FAILED at 1665.
Hunk #10 succeeded at 1724 (offset -3 lines).
Hunk #11 succeeded at 1765 (offset -2 lines).
Hunk #12 succeeded at 1784 (offset -3 lines).
1 out of 12 hunks FAILED -- saving rejects to file
drivers/mtd/nand/nand_base.c.rej
patching file drivers/mtd/mtdchar.c
patching file drivers/mtd/mtdconcat.c
patching file drivers/mtd/nand/nand_bbt.c
patching file drivers/mtd/nftlcore.c
patching file drivers/mtd/ssfdc.c
patching file fs/jffs2/wbuf.c
patching file drivers/mtd/mtdpart.c
patching file include/linux/mtd/mtd.h

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
