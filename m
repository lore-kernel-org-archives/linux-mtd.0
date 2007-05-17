Received: from moutng.kundenserver.de ([212.227.126.177])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hon6I-0000Am-I1
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 17:01:45 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
Date: Thu, 17 May 2007 23:00:20 +0200
References: <20070515151919.GA32510@lazybastard.org>
	<200705171708.53038.arnd@arndb.de>
	<20070517202139.GD15676@lazybastard.org>
In-Reply-To: <20070517202139.GD15676@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200705172300.21694.arnd@arndb.de>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 17 May 2007, J=C3=B6rn Engel wrote:
>=20
> > Why not just store 64 bit nanoseconds? that would avoid the problem
> > with ns overflow and the year-2038 bug. OTOH, that would require
> > a 64 bit integer division when reading the data, so it gets you
> > a runtime overhead.
>=20
> I like the idea. =C2=A0Do conversion function exist both way?
>=20
> What I don't get is the year-2038 bug. =C2=A0Isn't that the 31bit limit,
> while 32bit would last to 2106?

You're right, you don't hit the 2038 bug here, because you use an
unsigned variable. The bug exists elsewhere because time_t tv_sec
is signed.

Just using nanoseconds probably doesn't gain you much after all
then. You could however just have separate 32 bit fields in the
inode for seconds and nanoseconds, that will result in the exact
same layout that you have right now, but won't require a conversion
function.

	Arnd <><
