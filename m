Received: from mout02.rz-online.net ([212.7.160.42])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R0bbd-0005l4-D8
	for linux-mtd@lists.infradead.org; Mon, 05 Sep 2011 16:01:07 +0000
Received: from goemail-server.goerlitz.int (gw2.wuppertal.de [217.146.148.194]
	(may be forged)) (authenticated bits=0)
	by mout02.rz-online.net (8.14.0/8.12.10) with ESMTP id p85G121l020484
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Mon, 5 Sep 2011 18:01:03 +0200
From: Stelling Carsten <Carsten.Stelling@goerlitz.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 5 Sep 2011 18:01:01 +0200
Subject: Security enhancement for UBIFS with secure erase feature
Message-ID: <02855DE82B1CA94A9115CCD637A1325643CBFDDD88@goemail-server.goerlitz.int>
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

Hi everybody,

When building security relevant (embedded) applications, personal privacy
is of major importance.

Therefore it would be nice to have a configuration option to invalidate the
content of a deleted file in UBIFS. This feature shall allow an application=
 to
ensure that, when a file is deleted, its contents are fully erased from the=
 flash.
I.e. that each time a block is marked for erase, this block is written all =
zeros.
Writing zeros without erasing an entire page should be possible by design.

Giving such an option on a file by file basis (ioctl) would be optimal, bec=
ause
wiping out the content of a deleted file is time and resource consuming and
not acceptable for all kinds of applications using UBIFS.

Are there any plans for such a security enhancement in UBIFS?

Regards

Carsten
