Received: from mailout.airspan.com ([62.189.116.5])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GiSw1-0002pL-Tn
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 04:44:35 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: mtdconcat +jffs2 +NAND
Date: Fri, 10 Nov 2006 09:44:32 -0000
Message-ID: <31FE7326559B534EA6C03ACF19B25A315FFC26@fs5.airspan.com>
In-Reply-To: <31FE7326559B534EA6C03ACF19B25A315FFC24@fs5.airspan.com>
From: "Neil Wilson" <NWilson@Airspan.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>Is anyone using mtdconcat with JFFS2 + NAND who would be willing to
help me understand if I am attempting to use it correctly ?
>I have a ppc board with 4 * 64MB NAND that I would like to expose as 2
* 128MB filesystems.
>Thanks.

Sorry, forgot to mention that I am using a 2.6.18 kernel and that I can
mount & currently use the NAND devices individually under JFFS2 but
cannot seem to get the mtdconcat right.

Neil
