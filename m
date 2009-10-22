Received: from smtp-out112.alice.it ([85.37.17.112])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N15np-0001aQ-M1
	for linux-mtd@lists.infradead.org; Thu, 22 Oct 2009 22:06:41 +0000
Date: Fri, 23 Oct 2009 00:05:33 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: linux-mtd@lists.infradead.org
Subject: [BUG] cfi_cmdset_0001.c: possible recursive locking detected
Message-Id: <20091023000533.57893593.ospite@studenti.unina.it>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__23_Oct_2009_00_05_33_+0200_vjShmSVE=Qf+755c"
Cc: openezx-devel@lists.openezx.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Fri__23_Oct_2009_00_05_33_+0200_vjShmSVE=Qf+755c
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I am attaching a trace of a possible recursive locking in
cfi_cmdset_0001.c

The problem shows up at shutdown, with
CONFIG_MTD_CFI_INTELEXT=3Dy
CONFIG_MTD_PXA2XX=3Dy

Platform is armv5te (Motorola A780 smartphone), but I guess this doesn't
matter. If you think it does, let me know and I'll provide more
information about board code and config.

Thanks,
   Antonio Ospite

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ INFO: possible recursive locking detected ]
2.6.32-rc2-ezxdev #39
---------------------------------------------
halt/785 is trying to acquire lock:
 (&chip->_spinlock){+.+...}, at: [<c01801e0>] get_chip+0xe4/0x1e0

but task is already holding lock:
 (&chip->_spinlock){+.+...}, at: [<c01801a4>] get_chip+0xa8/0x1e0

other info that might help us debug this:
2 locks held by halt/785:
 #0:  ((reboot_notifier_list).rwsem){.+.+..}, at: [<c005d2d0>] __blocking_n=
otifier_call_chain+0x30/0x64
 #1:  (&chip->_spinlock){+.+...}, at: [<c01801a4>] get_chip+0xa8/0x1e0

stack backtrace:
[<c002fd44>] (unwind_backtrace+0x0/0xe0) from [<c00683a8>] (validate_chain+=
0x5b0/0xdd8)
[<c00683a8>] (validate_chain+0x5b0/0xdd8) from [<c0069410>] (__lock_acquire=
+0x840/0x910)
[<c0069410>] (__lock_acquire+0x840/0x910) from [<c006a3b4>] (lock_acquire+0=
x60/0x74)
[<c006a3b4>] (lock_acquire+0x60/0x74) from [<c02a2cb4>] (_spin_lock+0x40/0x=
50)
[<c02a2cb4>] (_spin_lock+0x40/0x50) from [<c01801e0>] (get_chip+0xe4/0x1e0)
[<c01801e0>] (get_chip+0xe4/0x1e0) from [<c0180314>] (cfi_intelext_reset+0x=
38/0x90)
[<c0180314>] (cfi_intelext_reset+0x38/0x90) from [<c0180400>] (cfi_intelext=
_reboot+0x10/0x1c)
[<c0180400>] (cfi_intelext_reboot+0x10/0x1c) from [<c005d0ac>] (notifier_ca=
ll_chain+0x2c/0x70)
[<c005d0ac>] (notifier_call_chain+0x2c/0x70) from [<c005d2ec>] (__blocking_=
notifier_call_chain+0x4c/0x64)
[<c005d2ec>] (__blocking_notifier_call_chain+0x4c/0x64) from [<c005d31c>] (=
blocking_notifier_call_chain+0x18/0x20)
[<c005d31c>] (blocking_notifier_call_chain+0x18/0x20) from [<c00525a4>] (ke=
rnel_shutdown_prepare+0x20/0x38)
[<c00525a4>] (kernel_shutdown_prepare+0x20/0x38) from [<c00525cc>] (kernel_=
power_off+0x10/0x44)
[<c00525cc>] (kernel_power_off+0x10/0x44) from [<c0053844>] (sys_reboot+0x1=
18/0x1d8)
[<c0053844>] (sys_reboot+0x118/0x1d8) from [<c0029f20>] (ret_fast_syscall+0=
x0/0x34)

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Fri__23_Oct_2009_00_05_33_+0200_vjShmSVE=Qf+755c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrg1y0ACgkQ5xr2akVTsAEf4ACZAaWenzB/6vNcyikEpkQG1Zkz
z94AnjNxANBUiwgQX7rJ06mqBS47Iwup
=AxJ/
-----END PGP SIGNATURE-----

--Signature=_Fri__23_Oct_2009_00_05_33_+0200_vjShmSVE=Qf+755c--
