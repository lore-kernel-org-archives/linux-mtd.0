Received: from mout02.rz-online.net ([212.7.160.42])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R1fha-0006bx-VF
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2011 14:35:39 +0000
Received: from goemail-server.goerlitz.int (gw2.wuppertal.de [217.146.148.194]
	(may be forged)) (authenticated bits=0)
	by mout02.rz-online.net (8.14.0/8.12.10) with ESMTP id p88EZUsw021834
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Thu, 8 Sep 2011 16:35:34 +0200
From: Stelling Carsten <Carsten.Stelling@goerlitz.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 8 Sep 2011 16:35:29 +0200
Subject: Security enhancement for UBIFS with secure erase feature
Message-ID: <02855DE82B1CA94A9115CCD637A1325643CD9EC4A3@goemail-server.goerlitz.int>
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

< Are there any plans for such a security enhancement in UBIFS?

Hello Atlant,

you're right. Writing zeroes is not applicable to all kinds of flash techno=
logy.

Are there any plans to support privacy in UBIFS?

In my opinion privacy should be guaranteed by the file system, so that any
application can rely on its security features.

There're other solutions, e.g. to encrypt the content of each file with a u=
nique
key stored in the metadata area of that particular file. Although this solu=
tion
needs to secure erase the key associated with the deleted file too.
I see, that might be a real dilemma.

Are there any suggestions?

Regards,

Carsten
