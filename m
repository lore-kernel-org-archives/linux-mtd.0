Received: from tritech.se ([46.59.120.190])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZfMN-0002fY-F5
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 11:47:36 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Artem
 Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 0/2] mtd-utils: integck: Makefile fix and new option
Date: Mon, 14 Apr 2014 11:46:58 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3D11E5@post.tritech.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

I had a discussion with Artem a while ago regarding a new feature for the=
=0A=
integck testing utility [1]. The issue was dropped because of lack of time=
=0A=
(on both sides I guess) so I'm making a new attempt now.=0A=
=0A=
Cleaned up and rebased on top of master.=0A=
=0A=
The problem with remounts and error 16 (Device or resource busy) that I=0A=
had back then persists on the same build-host / kernel as then but I have=
=0A=
not seen this problem on target using FLASH, nor using mtd-ram driver=0A=
(kernel 3.2 and 3.12).=0A=
=0A=
[1] http://lists.infradead.org/pipermail/linux-mtd/2013-August/048178.html=
