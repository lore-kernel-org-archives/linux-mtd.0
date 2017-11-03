Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eAXzF-0001LL-G3
 for linux-mtd@lists.infradead.org; Fri, 03 Nov 2017 09:10:04 +0000
Received: from localhost (localhost [127.0.0.1])
 by bastet.se.axis.com (Postfix) with ESMTP id F325918945
 for <linux-mtd@lists.infradead.org>; Fri,  3 Nov 2017 10:09:34 +0100 (CET)
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
 by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id lD7WuaxOdKFF for <linux-mtd@lists.infradead.org>;
 Fri,  3 Nov 2017 10:09:26 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
 by bastet.se.axis.com (Postfix) with ESMTPS id E51C41894B
 for <linux-mtd@lists.infradead.org>; Fri,  3 Nov 2017 10:09:26 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D34931E0E1
 for <linux-mtd@lists.infradead.org>; Fri,  3 Nov 2017 10:09:26 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C43841E0E0
 for <linux-mtd@lists.infradead.org>; Fri,  3 Nov 2017 10:09:26 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
 by boulder03.se.axis.com (Postfix) with ESMTP
 for <linux-mtd@lists.infradead.org>; Fri,  3 Nov 2017 10:09:26 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
 by seth.se.axis.com (Postfix) with ESMTP id B81F825FB
 for <linux-mtd@lists.infradead.org>; Fri,  3 Nov 2017 10:09:26 +0100 (CET)
From: Olle Blomgren <olle.blomgren@axis.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: jffs2: No space for garbage collection. Aborting GC thread
Date: Fri, 3 Nov 2017 09:09:26 +0000
Message-ID: <cf5af9b7bd0d4fdea9902b200b04d016@XBOX02.axis.com>
Content-Language: en-US
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

Hi,=20
=20
I'm running load tests on an embedded device using NAND flash and jffs2. Af=
ter 3-4 weeks of running the system under heavy load, the following occasio=
nally occurs:
1)
CRC calc of a node fails.
2)
The daemon experiencing the write failure aborts. This is by design, nothin=
g strange.
3)
JFFS2 reports ENOSPC and claims that the garbage collection is broken and a=
borts.
=20
My Linux kernel version is 4.4.27.

A system log follows:
=20
kernel 04 kern.warning [4927999.241539] jffs2: Data CRC 961e0790 !=3D calcu=
lated CRC 2e43ceec for node at 020a38e0
pacsd 0b user.err 11:20:57.793040 (0xa55800) Failed to clear table: Credent=
ial
kernel 06 kern.info [4927999.843684] potentially unexpected fatal signal 5.
kernel 04 kern.warning [4927999.843741]=20
kernel 04 kern.warning [4927999.843741] Code: 8c658bd8  240210aa  0000000c =
<14e00003> 00000000  03e00008  00000000  7c03e83b  00602021=20
kernel 04 kern.warning [4927999.843864] CPU: 0 PID: 984 Comm: GMain Tainted=
: G           O    4.4.27 #1
kernel 04 kern.warning [4927999.843911] task: 8d710248 ti: 8b15a000 task.ti=
: 8b15a000
kernel 04 kern.warning [4927999.843941] $ 0   : 00000000 10800108 00000000 =
76931880
kernel 04 kern.warning [4927999.843990] $ 4   : 000003d7 000003d8 00000005 =
00000000
kernel 04 kern.warning [4927999.844037] $ 8   : 7692995c 77698000 77696d24 =
f0000000
kernel 04 kern.warning [4927999.844085] $12   : 00000000 00000001 00000000 =
76929878
kernel 04 kern.warning [4927999.844134] $16   : 00000000 00000000 77116050 =
00000004
kernel 04 kern.warning [4927999.844180] $20   : 77116030 00000000 00000004 =
00000006
kernel 04 kern.warning [4927999.844230] $24   : 00000726 76fb4010          =
       =20
kernel 04 kern.warning [4927999.844278] $28   : 76fd1020 76929a20 00000002 =
77029170
kernel 04 kern.warning [4927999.844329] Hi    : 00000328
kernel 04 kern.warning [4927999.844359] Lo    : 00001deb
kernel 04 kern.warning [4927999.844400] epc   : 76fb4048 0x76fb4048
kernel 04 kern.warning [4927999.844439] ra    : 77029170 0x77029170
kernel 04 kern.warning [4927999.844465] Status: 01006313    USER EXL IE=20
kernel 04 kern.warning [4927999.844508] Cause : 10800020 (ExcCode 08)
kernel 04 kern.warning [4927999.844541] PrId  : 01019550 (MIPS 34Kc)
kernel 04 kern.warning [4928006.637086] jffs2: Data CRC 961e0790 !=3D calcu=
lated CRC 2e43ceec for node at 020a38e0
kernel 04 kern.warning [4928006.637144] jffs2: read_cache_page() returned e=
rror: -5
kernel 03 kern.err [4928006.637166] jffs2: Error garbage collecting node at=
 020a38e0!
kernel 05 kern.notice [4928006.637577] jffs2: No space for garbage collecti=
on. Aborting GC thread
kernel 04 kern.warning [4928006.964636] jffs2: Data CRC 961e0790 !=3D calcu=
lated CRC 2e43ceec for node at 020a38e0
kernel 04 kern.warning [4928006.964694] jffs2: read_cache_page() returned e=
rror: -5
kernel 03 kern.err [4928006.964717] jffs2: Error garbage collecting node at=
 020a38e0!
kernel 04 kern.warning [4928006.967060] jffs2: Data CRC 961e0790 !=3D calcu=
lated CRC 2e43ceec for node at 020a38e0
kernel 04 kern.warning [4928006.967109] jffs2: read_cache_page() returned e=
rror: -5
kernel 03 kern.err [4928006.967132] jffs2: Error garbage collecting node at=
 020a38e0!
                                                               :
                                              ...goes on forever...
=20
Questions:
Has anyone seen this before?
Does anyone have any wild guesses as to under what circumstances JFFS2 woul=
d run out of memory?
=20
Thanks!
/Olle
