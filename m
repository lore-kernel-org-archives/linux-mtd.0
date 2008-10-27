Subject: Re: [PATCH][nandsim] FIX RAM wasting via kmalloc
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <alpine.LFD.1.10.0810221611550.30499@casper.infradead.org>
References: <alpine.LFD.1.10.0810221611550.30499@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Mon, 27 Oct 2008 09:18:46 +0200
Message-Id: <1225091926.3833.2.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexey,

On Wed, 2008-10-22 at 16:33 +0100, Alexey Korolev wrote:
> Nandsim consumes ~2x more RAM than the density of simulated device.=20
> It becomes critical if we need to simulate 256MB NAND and run stress test=
s=20
> on it.

I'm applying your patch to our local tree, just to test it. But there
is a trailing white-space.

[dedekind@gollum ubifs-2.6]$ git-am nandsim
Applying FIX RAM wasting via kmalloc
.dotest/patch:64: trailing whitespace.
                 * then kernel memory alloc runs writeback which goes to
the FS
warning: 1 line adds whitespace errors.

:-)

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
