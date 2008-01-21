Received: from an-out-0708.google.com ([209.85.132.245])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JH4yu-0006v0-LC
	for linux-mtd@lists.infradead.org; Mon, 21 Jan 2008 22:19:12 +0000
Received: by an-out-0708.google.com with SMTP id c3so483581ana.99
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Jan 2008 14:19:03 -0800 (PST)
Date: Mon, 21 Jan 2008 16:16:12 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: =?UTF-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080121161612.3ca2f093@zod.rchland.ibm.com>
In-Reply-To: <20080121212555.GA14472@lazybastard.org>
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
	<20080117114353.0bc71dac@zod.rchland.ibm.com>
	<479073D1.5010406@parrot.com>
	<20080118064852.026b0c82@zod.rchland.ibm.com>
	<4790D11E.6060201@parrot.com>
	<20080118115531.2deef9fb@zod.rchland.ibm.com>
	<20080118181744.GA15039@lazybastard.org>
	<4794C107.7070600@parrot.com>
	<20080121212555.GA14472@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 21 Jan 2008 22:25:56 +0100
J=C3=B6rn Engel <joern@logfs.org> wrote:

> On Mon, 21 January 2008 16:57:59 +0100, Matthieu CASTET wrote:
> >
> > What's the status of logfs on NAND ?
> >=20
> > Last time I check, it didn't manage badblock.
>=20
> Is that the only thing stopping you from using logfs?
>=20
> mklogfs handles bad blocks.  Blocks rotting during lifetime are handled
> half-heartedly.  If that is a real problem for you I wouldn't be
> surprised if you caught logfs on the wrong foot once or twice.

Wait... you're writing a flash filesystem that doesn't really deal with
bad blocks?

josh
