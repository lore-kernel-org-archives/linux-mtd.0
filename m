Received: from smtp2e.orange.fr ([80.12.242.111])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfXTd-0007rb-FL
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 11:12:47 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: util-linux-ng@vger.kernel.org
Subject: [PATCH 3/3] blkid: add UBIFS test image to blkid test suite
Date: Mon, 24 Aug 2009 13:11:56 +0200
Message-Id: <1251112316-18971-4-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1251112316-18971-3-git-send-email-corentincj@iksaif.net>
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
	<1251112316-18971-2-git-send-email-corentincj@iksaif.net>
	<1251112316-18971-3-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 tests/expected/blkid/low-probe-ubifs |    5 +++++
 tests/ts/blkid/images/ubifs.img.bz2  |  Bin 0 -> 937 bytes
 2 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 tests/expected/blkid/low-probe-ubifs
 create mode 100644 tests/ts/blkid/images/ubifs.img.bz2

diff --git a/tests/expected/blkid/low-probe-ubifs b/tests/expected/blkid/low-probe-ubifs
new file mode 100644
index 0000000..4164db4
--- /dev/null
+++ b/tests/expected/blkid/low-probe-ubifs
@@ -0,0 +1,5 @@
+ID_FS_TYPE=ubifs
+ID_FS_USAGE=filesystem
+ID_FS_UUID=bafe46c2-5ed9-4405-8e81-7fc317fab8f0
+ID_FS_UUID_ENC=bafe46c2-5ed9-4405-8e81-7fc317fab8f0
+ID_FS_VERSION=w4r0
diff --git a/tests/ts/blkid/images/ubifs.img.bz2 b/tests/ts/blkid/images/ubifs.img.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..efba8f75efa32954d50ab70d6db74c4b9f24de44
GIT binary patch
literal 937
zcmV;a16KS(T4*^jL0KkKSsMma+5iICfB*mg|LyitdfxwWMS1t{-sJOVjvV#GK>U9D
zaUfKCSNXsL6pTYCSq%{ZC+e9;wMJyhdTMN-G|&JIsCh@I8Z-cDkjMr=dYWh&Jx@>u
zntGaJDd_bzGgI`SN+yaE&`lbfO;1syOrD_79;Sz+XaHyc13(P{pfqS200EHD4FC-q
z2$Ygd0000000000000000000000000L6ZnF0ilR8X`?0rFe4_JG&EuiMoa=|&>AuZ
zA*K^djWlQ(GGxFKBoc^Qf<hJ%6;Vluj)jqIOAE<vsQQ-L2v^xnp^L^>PNRERQO%`C
zwTlWhtVpR|JOwF2&d}sYiK>%7dn)8hnADj&F=b~7##s(H+GGoRa8TO-wV~n8ImVDe
zC_?5yosB`gev~p(6EM(m6d@iEd8&YTI5U|7s8m4+naGJz6wited#G1UrB1R0WI~x@
zI7o#=N*RF5ovh^<)$3l>t0se@D9aRFeWY^CfdUvzkS4+kMj$vvfiAVr6jTtq$s)Ng
zl@P5FLPShlE5ZV`_bFXfXoU!k2!(1=s@B+4FAfb-q9kDm30+A=O9Z4tF%<^9f|3bT
z6#s1Z6bgp$Km^!COZ<%IN-k{JvgMOlO$r)cGXi5#OLe^17z~sZRRVOk0*Xjc<<pBr
z22m%eg+`Qzi@cdH<{<$I%77Ux8SF_}vvMqmm}KdLAx=ZukQ@a-xl|aLO8rI>*G}Y$
z?ZG8es$FK9)Sq!^;Z^D`0-`0tqbQd&nUbztO@A9^2!d&1VWfv%t9N+=8T<-ug2?E0
zK@gy@f<|3EJ7Ra8GPf`72Ph%g>J=yi3&?1Eb!nyMI3#8m3mGVQox5uj@WU{HnVHqY
zKevy7sZe|TZ?VCTT#kF*;T-GcW*k;3GL74ri2Q*Ev2nox`l8-Q)rZ0Kx$gX5)ZL7)
z1~hM)M=;h~SqDTu<i^-hSU*1H64G~?&(6zXY;l(YqT@{AJqD1&mfL}AYyH83BRmTV
zSHl+CwSWpRa<vG*TR3JzqAT~<4{AXmgxvHbQ$R?uL2;0P>Oa-}8>e^7D0bgXtzP<K
z;gbc0p*qVl#_-vC4u$HMADYcGfVd7A1vR7>6?`@^I$s%2uu_>3eTYvom#T7wSG}tD
z_-5Krfb;}KP;78%2thyqNBK$us-Vq1n>qL4AfTiDh>7Z`q6(^iqNo5^U;qKr|BJaI
LoG3^QgDPzRZM~1E

literal 0
HcmV?d00001

-- 
1.6.4
