Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4V3p-0004YX-HV
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2013 11:59:22 +0000
Received: from localhost (localhost [127.0.0.1])
 by co202.xi-lite.net (Postfix) with ESMTP id 1A977481AD2
 for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2013 13:58:57 +0200 (CEST)
Received: from co202.xi-lite.net ([127.0.0.1])
 by localhost (fw.aswsp.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBDIJtho0hqJ for <linux-mtd@lists.infradead.org>;
 Wed, 31 Jul 2013 13:58:57 +0200 (CEST)
Received: from ONYX.xi-lite.lan (unknown [193.34.35.244])
 by co202.xi-lite.net (Postfix) with ESMTPS id 080C548093A
 for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2013 13:58:57 +0200 (CEST)
Date: Wed, 31 Jul 2013 13:58:53 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: mm/slab: ppc: ubi: kmalloc_slab WARNING / PPC + UBI driver
Message-ID: <20130731135853.1c210083@parrot.com>
In-Reply-To: <51F8F827.6020108@gmail.com>
References: <51F8F827.6020108@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Wed, 31 Jul 2013 12:42:31 +0100,
Wladislav Wiebe <wladislav.kw@gmail.com> a =E9crit :

> CPU: 0 PID: 900 Comm: hexdump Tainted: G           O
> 3.10.0-0-sampleversion-fcmd #40 task: cf3e7280 ti: ccd3a000 task.ti:
> ccd3a000 NIP: c0099fec LR: c0099fd4 CTR: c018b0dc
> REGS: ccd3bdb0 TRAP: 0700   Tainted: G           O
> (3.10.0-0-sampleversion-fcmd) MSR: 00029000 <CE,EE,ME>  CR: 22000442
> XER: 20000000
>=20
> GPR00: c0099fd4 ccd3be60 cf3e7280 00000000 d100e501 00000005 00000000
> c0372ac0 GPR08: 00000004 00000001 00000000 ccd3be20 22000444 100a24dc
> 00000000 00000000 GPR16: 10076b54 00000000 fffff000 00000000 ccd3bea0
> 00000000 00000001 00000400 GPR24: 00000000 00000000 4801c000 c00d46f4
> ccd3bf18 000000d0 00800000 000000d0 NIP [c0099fec]
> kmalloc_slab+0x60/0xe8 LR [c0099fd4] kmalloc_slab+0x48/0xe8
> Call Trace:
> [ccd3be60] [c0099fd4] kmalloc_slab+0x48/0xe8 (unreliable)
> [ccd3be70] [c00ae650] __kmalloc+0x20/0x1b4
> [ccd3be90] [c00d46f4] seq_read+0x2a4/0x540
> [ccd3bee0] [c00fe09c] proc_reg_read+0x5c/0x90
Aren't you doing a hexdump on a proc file ?


Matthieu
