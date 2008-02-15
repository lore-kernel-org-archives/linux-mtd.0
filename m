Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JPwaS-0005zS-8i
	for linux-mtd@lists.infradead.org; Fri, 15 Feb 2008 09:10:34 +0000
Subject: RE: Abnormal behavior with JFFS2 on latest kernel
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <005601c86fb1$7c79f100$1fa9580a@swcenter.sec.samsung.co.kr>
References: <004601c86fa2$201a78d0$1fa9580a@swcenter.sec.samsung.co.kr>
	<1203065647.23414.6.camel@sauron>
	<005601c86fb1$7c79f100$1fa9580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Fri, 15 Feb 2008 11:08:58 +0200
Message-Id: <1203066538.23414.11.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: 'linux-mtd' <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-02-15 at 18:02 +0900, Kyungmin Park wrote:
> > On Fri, 2008-02-15 at 16:12 +0900, Kyungmin Park wrote:
> > > I got following messages.
> > > INFO: task pdflush:56 blocked for more than 120 seconds.
> > > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mess=
age.
> > >
> > > What are the meanings?
> > > Too mush running GC in JFFS2 or others?
> >=20
> > Hi Kyungmin,
> >=20
> > did not look at this, but off the top of my head this might be related
> > to the latest VFS changes (write_begin()/write_end() instead of
> > prepare_write()/commit_write()). Just a hint where you might try to
> > look.
> >=20
>=20
> Then can I use the ubifs? I mean ubifs is already changed for latest VFS =
changes.
> Now I just want to test new driver with latest kernel.

No, in opposite, we have not changed it yet. The old calls were not
removed from VFS and will be kept there for few releases. So we still
use them - this helps to use the same UBIFS sources for older kernels.
But later we'll switch to newer calls which are in fact much better for
UBIFS then the old ones.

But yes, you of course can use UBIFS.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
