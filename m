Received: from usa7109mr002.acs-inc.com ([63.101.151.11])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RQH9c-0004RO-2B
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2011 11:26:17 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH 1/3] mtd/nand: fix coding style issue in
 drivers/mtd/nand/fsl_elbc.c
Date: Tue, 15 Nov 2011 11:26:06 -0000
Message-ID: <929D3CED81F34E43887A393170D66FB9053A8C82@GBRSUN01MS002.eu.xerox.net>
In-Reply-To: <1321349355-1639-1-git-send-email-b35362@freescale.com>
References: <1321349355-1639-1-git-send-email-b35362@freescale.com>
From: "Jenkins, Clive" <Clive.Jenkins@xerox.com>
To: <b35362@freescale.com>, <dwmw2@infradead.org>, <Artem.Bityutskiy@nokia.com>
Cc: scottwood@freescale.com, linuxppc-dev@lists.ozlabs.org,
 akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> fix whitespaces,tabs coding style issue and ...

In my opinion this code was already correct, and would display correctly
at any TAB setting. This patch changes it so that it displays
incorrectly
at all TAB settings other than 8.

Example:

Correct:
<tabs>function(arg1,
<tabs><9spaces>arg2

Incorrect:
<tabs>function(arg1,
<tabs>< tab  > arg2

For any TAB setting other than 8, arg1 and arg2 no longer line up.

Clive
