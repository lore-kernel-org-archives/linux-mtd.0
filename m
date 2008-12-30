Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LHgX5-0002pI-78
	for linux-mtd@lists.infradead.org; Tue, 30 Dec 2008 15:29:24 +0000
Subject: Re: ubifs: partition won't mount: duplicate sqnum in replay ???
From: Artem Bityutskiy <dedekind@infradead.org>
To: Cal Page <pagcal@runbox.com>
In-Reply-To: <495A0FE4.4010603@runbox.com>
References: <495A0FE4.4010603@runbox.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 30 Dec 2008 17:29:50 +0200
Message-Id: <1230650990.30332.24.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-12-30 at 07:11 -0500, Cal Page wrote:
> I'm running ubi at 2.6.27.4, ubifs is a mix of that base plus some=20
> 2.6.21 as the vfs interface changed. There are only three mtd calls you=20
> make, so that rev just isn't important. The base kernel, and most of vfs=20
> is at 2.6.19.

You finally gave us some information, although obscure. What I
understood, you have 2.6.19. Then I would expect you to port everything
we have in our ubifs-v2.6.21.git tree to your tree. Never done this
myself.

A do not know what you mean by "rev just isn't important", but the
kernel version does matter a lot. There may be various subtle things
related to core kernel changes.

We do not test back-port trees extensively, so you should do this
yourself. Try to run "integck -n0" for few days for example. Run other
tests which you may find in mtd-utils.git/tests/fs-tests/ or in
ubifs-userspace.git/tests/.

> I did not initialize the nand for the unit in question. It could have=20
> been the problem. I'll re-format it and start again. But, for testing,=20
> we have a 'crasher' device that randomly crashes the file system to=20
> force us into difficult recoveries. In short, for ubifs to be shipped,=20
> it must survive and re-mount AFTER EVERY CRASH, period.
>=20
> The only other problem is that ubifs takes way too much memory. We run=20
> for a few days on our 1 gb nand, and then the oom_killer gets called and=20
> down we go. What exactly was done in later releases to fix this? I need=20
> to back-port a solution before we ship.

I'm not sure if you'll be able to back-port patches which allow
registering the shrinker to your tree. You may try. But what can be don
is you can hack UBIFS and call the shrinker yourself when amount of
znodes becomes larger than a certain limit, so you will prevent TNC from
growing too much.

However, I'm not 100% sure it is TNC who is guilty.=20
Could you please send the output of:
* cat /proc/slabinfo
* cat /proc/slab_allocators
to see RAM which object are there and who allocates them. To have the
latter, you should have 'CONFIG_SLABINFO' enabled.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
