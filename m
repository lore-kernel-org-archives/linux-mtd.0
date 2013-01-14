Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tuhdb-0000zQ-GZ
 for linux-mtd@lists.infradead.org; Mon, 14 Jan 2013 10:51:32 +0000
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
 by tritech.se (8.14.3/8.14.3) with ESMTP id r0EApHYC011748
 for <linux-mtd@lists.infradead.org>; Mon, 14 Jan 2013 11:51:22 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Advice on how to patch linux 2.6.35
Date: Mon, 14 Jan 2013 10:51:17 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C425E9912@post.tritech.se>
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

Hi,=0A=
=0A=
If this has been asked before, I apologize. I just couldn't figure out what=
 to search for...=0A=
=0A=
I'm working with a Linux 2.6.35 kernel using the latest patches from kernel=
.org (i.e. 2.6.35.14).=0A=
My custom board is based on Freescale MPC5125 and Spansion S29GL512S NOR FL=
ASH.=0A=
Unfortunately I seem to have some trouble with power cut's causing corrupti=
on.=0A=
=0A=
In an attempt to find the latest applicable patches for my kernel i cloned =
the 2.6.35 repository of=0A=
Artem Bityutskiy (from git://git.infradead.org/users/dedekind/ubifs-v2.6.35=
.git).=0A=
=0A=
Now I have compared the kernel.org 2.6.35.0 tree with the Artem tree and wi=
th the 2.6.35.14 tree=0A=
and find that some differences (to mtd/ubi related code) are the same, some=
 only exist in=0A=
either tree. Some of the patches I find in the Artem tree corresponds to th=
ings that has been=0A=
discussed in the mailing list as solutions to problems similar to mine.=0A=
=0A=
What I'm trying to ask is; what is the status of the Artem tree? Should I t=
ry to apply the patches=0A=
from this tree to the .14 tree or is there a better/safer way to obtain a b=
etter working 2.6.35?=0A=
=0A=
Your advice is welcome!=0A=
=0A=
BR // Mats=0A=
