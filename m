Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GjYWq-00062I-Ch
	for linux-mtd@lists.infradead.org; Mon, 13 Nov 2006 04:55:08 -0500
Subject: Re: Kernel oops in jffs2 mount - any ideas?
From: Artem Bityutskiy <dedekind@infradead.org>
To: robin.gilks@tait.co.nz
In-Reply-To: <4557E56F.8070100@tait.co.nz>
References: <4553C6CB.2040207@tait.co.nz> <1163146170.3925.7.camel@sauron>
	<4557E56F.8070100@tait.co.nz>
Content-Type: text/plain; charset=utf-8
Date: Mon, 13 Nov 2006 11:54:43 +0200
Message-Id: <1163411683.3925.31.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: MTD mail list <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2006-11-13 at 16:24 +1300, Robin Gilks wrote:

> [   13.488115] jffs2_scan_eraseblock(): Node at 0x0004aff8 {0x1985,=20
> 0xe001, 0x0000002d) has invalid CRC 0xd7218112 (calculated 0x05000000)
> [   13.514180] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found=20
> at 0x0004b000: 0xd721 instead

This means you are trying to feed trash to JFFS2. How do you copy JFFS2
image to your flash? Do you erase the partition beforehand?

But nevertheless, JFFS2 should not crash because of this and probably
this is not the reason of the crash.

> [   23.751790] JFFS2: Erase block at 0x00290000 is not formatted. It=20
> will be erased
> [   24.009046] Oops: kernel access of bad area, sig: 11 [#1]
> [   24.019240] NIP: C01136A0 LR: C0114294 CTR: C01136A0
> [   24.029096] REGS: c3cabcd0 TRAP: 0300   Not tainted  (2.6.18-buildroot=
)
> [   24.042200] MSR: 00009032 <EE,ME,IR,DR>  CR: 22008028  XER: 0000005F
> [   24.054824] DAR: FF80101B, DSISR: C0000000
> [   24.062957] TASK =3D c036a7c0[280] 'jffs2_gcd_mtd1' THREAD: c3caa000
> [   24.074859] GPR00: 00000000 C3CABD80 C036A7C0 FF800FFF C3C26678=20
> 00000000 C034CA44 F82DD7B0
> [   24.091445] GPR08: 0005CEE4 C01AD99C FF800FFF C01136A0 22008024=20
> 00000000 C3CABE38 00000000
> [   24.108034] GPR16: C3CABE24 C01C0000 C3CABDA8 00000000 C3CABE28=20
> C3C26640 C034CA20 00000000
> [   24.124624] GPR24: 0005CEE4 C3C26640 00000028 00000000 0005CEE4=20
> C3C26678 C03F6C14 C3C26678
> [   24.141559] NIP [C01136A0] put_chip+0xa0/0x2e8

So the crash is somewhere in the CFI code. You should try to dig it and
realize why it oopses.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
