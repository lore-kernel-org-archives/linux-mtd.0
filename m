Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKteE-0001iM-1f
	for <linux-mtd@lists.infradead.org>; Sat, 15 Nov 2003 06:11:06 +0000
Received: from 192.168.1.100 (unknown [192.168.1.100])5B11018B9A
	for <linux-mtd@lists.infradead.org>;
	Sat, 15 Nov 2003 01:13:24 -0500 (EST)
From: Joshua Wise <joshua@joshuawise.com>
To: linux-mtd@lists.infradead.org
Date: Sat, 15 Nov 2003 01:09:38 -0500
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200311150109.39539.joshua@joshuawise.com>
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: JEDEC probing redux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ah, the never-ending search for the working flash chip on the iPAQ h1910. I=
=20
think I know what the problem is now, but I'd like someone else to confirm =
my=20
theory ...

But first, some background. On the iPAQ h1910, we have an LV400BT chip (id=
=20
0001/22B9) that we probe by JEDEC. The chip expects unlock addresses of=20
0x555/0x2AA in word mode.

However, HP had to throw a twist in - they shifted the address lines over o=
ne.=20
A1 on the CPU is connected to A0 on the flash chip, etcetera, so we have to=
=20
left-shift the unlock addresses. I added code to jedec_probe.c to do that i=
n=20
a retry loop not unlike what we do to find the actual unlock addresses, and=
=20
it seemed to detect the chip. However, jedec_match() seems to be failing, a=
s=20
I'm actually left-shifting the unlock addresses in the CFI structure. (IE,=
=20
jedec_match() expects unlock addresses 0x555 0x2AA for this chip, but it's=
=20
seeing 0xAAA 0x554.)

I'm thinking two things here: 1) I'm assuming that the unlock address verif=
y=20
is just paranoia. Can I nuke that? (Will it break anyone's board?) and 2) I=
s=20
there a better way to say that we should be left-shifting all the unlock=20
addresses over?

In the mean time, I'll nuke the unlock address verify in jedec_match, and s=
ee=20
if that solves my problem.

/joshua

(For those who want my evidence, it follows. I've forced the JEDEC code to=
=20
only probe the uaddr_idx that I'm looking for right now, just to save debug=
=20
output. Lines beginning with --- denote my commentary.)

<5>iPAQ flash: probing 16-bit flash bus, window=3Dc4851000 with JEDEC.
<5>uaddr_idx ok, go go go!
=2D --- Alright, our uaddr_idx is ok. We start probing now.
<7>cfi_send_gen_cmd: writing 00F0@00000000
<7>cfi_send_gen_cmd: writing 00FF@00000000
<7>cfi_send_gen_cmd: writing 00AA@00000555
<7>cfi_send_gen_cmd: writing 0055@000002AA
<7>cfi_send_gen_cmd: writing 0090@00000555
=2D --- This is my instrumentation, fwiw. I found it helpful.
=2D --- These would be correct addresses if the chip was straight-through.
=2D --- But it isn't, so later, we left-shift ....
<6>Search for id:(75 ea00) interleave(1) type(2)
<7>cfi_send_gen_cmd: writing 00F0@00000000
<7>cfi_send_gen_cmd: writing 00FF@00000000
<7>cfi_send_gen_cmd: writing 00AA@00000AAA
<7>cfi_send_gen_cmd: writing 0055@00000554
<7>cfi_send_gen_cmd: writing 0090@00000AAA
=2D --- These are what I've really got to write.
<6>Search for id:(01 22b9) interleave(1) type(2)
=2D --- And what do you know, it worked.
<6>MTD jedec_match(): Check fit 0x00000000 + 0x00080000 =3D 0x00080000
<6>MTD jedec_match(): check unlock addrs 0x0aaa 0x0554
<6>MTD jedec_match(): 0x0555 0x02aa did not match
=2D --- ... At least until jedec_match() puked.

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/tcMiPn9tWOqA4LMRAsboAJwNPmh8KBSs9429JwZdQ6KK4NjGLgCdH/qk
OaCN+d/HAgsmpv7cfIAqxLY=3D
=3DKjwV
=2D----END PGP SIGNATURE-----
