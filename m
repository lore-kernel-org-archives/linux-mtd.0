Received: from nm13-vm0.bullet.mail.ird.yahoo.com ([77.238.189.195])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5HYo-0008LK-2k
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 14:09:47 +0000
Message-ID: <1331129384.28469.YahooMailClassic@web29020.mail.ird.yahoo.com>
Date: Wed, 7 Mar 2012 14:09:44 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: [PATCH 0/6] mtd: Fix unnecessary flash erase and write errors
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, joakim.tjernlund@transmode.se, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The problem:=0A=0AAn HP iPAQ hx4700 consistently reports flash erase and wr=
ite errors when running=0ALinux:=0A=0Ablock erase failed at 0x02c00000: sta=
tus 0xa000a0. Retrying...=0Ablock erase failed at 0x02c00000: status 0xa000=
a0. Retrying...=0Ablock erase failed at 0x02c00000: status 0xa000a0. Retryi=
ng...=0ASR.4 or SR.5 bits set in buffer write (status a000a0). Clearing.=0A=
=0Ablock erase failed at 0x02c40000: status 0xa000a0. Retrying...=0Ablock e=
rase failed at 0x02c40000: status 0xa000a0. Retrying...=0Ablock erase faile=
d at 0x02c40000: status 0xa000a0. Retrying...=0Aphysmap-flash: block erase =
failed at 0x02c40000 (status 0xa000a0)=0A=0Ablock erase failed at 0x0044000=
0: status 0xa000a0. Retrying...=0Ablock erase failed at 0x00440000: status =
0xa000a0. Retrying...=0Ablock erase failed at 0x00440000: status 0xa000a0. =
Retrying...=0Aphysmap-flash: block erase error: (bad VPP)=0Aphysmap-flash: =
buffer write error (status 0xd000d0)=0A=0AThe cause:=0A=0AThe flash program=
/erase voltage (vpp) is turned off by the MTD CFI driver while=0Aerase oper=
ations are in progress or suspended. This kills the erase operations.=0A=0A=
The culprit:=0A=0A./drivers/mtd/chips/cfi_cmdset_0001.c contains two functi=
ons, get_chip() and=0Aput_chip(), which are called before and after every f=
lash operation.=0AThe intention seems to be that if one thread is waiting f=
or a Block Erase to=0Afinish, another thread wanting to perform a concurren=
t operation within the same=0Apartition will suspend the erase in get_chip(=
) and resume it in put_chip(),=0Awithout disturbing vpp.=0AIf the other thr=
ead wants to perform a concurrent operation within a different=0Apartition,=
 no suspend/resume is performed but put_chip() will call DISABLE_VPP()=0Ato=
 turn vpp off.=0AThat is exactly what happens: a pending Block Erase in one=
 partition expects vpp=0Ato remain on, but a Read Array in another partitio=
n turns vpp off.=0A=0AThe fix:=0A=0A1. Ensure that only those flash operati=
ons which call ENABLE_VPP() can then call=0ADISABLE_VPP(). Other operations=
 should never call DISABLE_VPP().=0A=0AConsequently...=0A=0A2. Ensure that =
calls to ENABLE_VPP() / DISABLE_VPP() (i.e. set_vpp()) can nest.=0AThis req=
uirement is already stated in ./include/linux/mtd/map.h:=0A=0A        /* se=
t_vpp() must handle being reentered -- enable, enable, disable=0A          =
 must leave it enabled. */=0A        void (*set_vpp)(struct map_info *, int=
);=0A=0Aand a method for doing so is suggested in ./drivers/mtd/chips/cfi_c=
mdset_0001.c:=0A=0A        /* We should really make set_vpp() count, rather=
 than doing this */=0A        DISABLE_VPP(map);=0A=0ABut only 1 of the 5 MT=
D map drivers which provide a set_vpp() implementation=0Aincludes a referen=
ce counter.=0A=0AThe patch set:=0A=0A[PATCH 1/6] mtd: chips: cfi_cmdset_000=
1: Match ENABLE_VPP()/DISABLE_VPP() calls=0A[PATCH 2/6] mtd: chips: cfi_cmd=
set_0002: Match ENABLE_VPP()/DISABLE_VPP() calls=0A[PATCH 3/6] mtd: maps: p=
hysmap: Add reference counter to set_vpp()=0A[PATCH 4/6] mtd: maps: l440gx:=
 Add reference counter to set_vpp()=0A[PATCH 5/6] mtd: maps: pcmciamtd: Add=
 reference counter to set_vpp()=0A[PATCH 6/6] mtd: maps: sa1100-flash: Add =
reference counter to set_vpp()=0A=0APatches 1 and 3 completely eliminate al=
l erase and write errors from the hx4700.=0A=0APatches 2, 4, 5 and 6 apply =
the same fix to other permutations of CFI command=0Aset and MTD map driver.=
 A 5th MTD map driver - dilnetpc - already includes a=0Aset_vpp() reference=
 counter.
