Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U59AL-0007EX-Qi
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2013 06:16:31 +0000
Received: from dbdp20.itg.ti.com ([172.24.170.38])
 by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1C6GQwv015958
 for <linux-mtd@lists.infradead.org>; Tue, 12 Feb 2013 00:16:26 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
 by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1C6GPJ7022045
 for <linux-mtd@lists.infradead.org>; Tue, 12 Feb 2013 11:46:25 +0530 (IST)
From: "Gupta, Pekon" <pekon@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: queries regarding sub-page support
Date: Tue, 12 Feb 2013 06:16:24 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E99734D@DBDE01.ent.ti.com>
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

Hi,

I had few queries regarding sub-page support

(1)
With reference to following description, both Read & Write operations are a=
llowed for sub-page accesses.=20
http://www.linux-mtd.infradead.org/doc/ubi.html#L_subpage
However I could not find place-holder for '*write_subpage()' in  'struct na=
nd_ecc_ctrl' .
Is there a particular reason for not including *(wrire_subpage)() ? Am I mi=
ssing something ?=20

(2)
As per ONFI spec 3.1, the 'partial-page' parameter present in 'NAND's param=
eter page structure' is not deprecated.=20
>>111    Obsolete - Partial programming attributes=20
Is there any other way to know, whether NAND device supports sub-page acces=
ses ?

(3)
Is there any existing reference code to see the sub-page related changes ?


Thanks for help..
With regards, pekon
