Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0COX-0002Q8-2R
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 10:56:53 +0000
Received: by fxm28 with SMTP id 28so6443678fxm.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Oct 2009 03:56:48 -0700 (PDT)
MIME-Version: 1.0
Sender: emmanuel.michon@gmail.com
Date: Tue, 20 Oct 2009 12:56:45 +0200
Message-ID: <81859150910200356i1e80bb4er1b97046f43415938@mail.gmail.com>
Subject: giving room for Linux filesystems on MLC/SLC
From: Emmanuel Michon <emmanuel.michon@polytechnique.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

we're preparing in my company the software for a general purpose (.5K,
2K, 4KB page)
hardware MLC/SLC controller, especially how we're going to
choose the byte offsets of a page+spare for `metadata' and `bad
blocks' (those are excluded by our ECC check hardware).

0                                               4096+epsilon
| metadata | data | bb info | data

Our primary goal is to be compatible with our proprietary filesystem,
but if we can enable Linux family of MTD FS with little effort, let's
prepare it

`bad block' information is a hardware stuff (unconsistently, poorly)
documented to be near the start of spare area.

For some reason we have this 4 byte metadata at the start of each
page. Does this software concept apply to ubifs and friends and should
it be sized differently?

Btw, any success stories about UBIFS+MLC since the FAQ report on this topic=
?

--=20
Tr=E8s sinc=E8rement,

e.m.
