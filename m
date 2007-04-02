Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HYKFD-0001Fp-AG
	for linux-mtd@lists.infradead.org; Mon, 02 Apr 2007 06:58:41 -0400
Subject: Re: [RFC] [PATCH] UBI: refine wear leveling logic
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200703301640.07170.alexs@linux.vnet.ibm.com>
References: <200703281547.18851.alexs@linux.vnet.ibm.com>
	<200703291359.25593.alexs@linux.vnet.ibm.com>
	<460D015F.6080305@nokia.com>
	<200703301640.07170.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Apr 2007 13:53:25 +0300
Message-Id: <1175511205.19966.42.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-03-30 at 16:40 +0200, Alexander Schmidt wrote:
> In the current code, wl_get_peb() calls produce_free_peb() if the
> free tree is empty and thereby performs a synchronous work (even if the
> bgt is enabled). This is what I meant with "mixing" sync/async.

OK, what's wring with this? We do not have eraseblocks, we produce them
synchronously.

We cannot rely on the thread - what if it was killed or its priority is
too low, but the requesting task needs eraseblocks ASAP.

> So I think making the user thread wait for the wl thread to free a peb
> (e.g. by sleeping while waiting for a semaphore) could lead to a better
> performance as the wl thread will likely finish its work before the user
> thread has performed a whole work.

Not necessarily. The current approach is safer.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
