Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JPwML-0006e9-Kq
	for linux-mtd@lists.infradead.org; Fri, 15 Feb 2008 08:56:02 +0000
Subject: Re: Abnormal behavior with JFFS2 on latest kernel
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <004601c86fa2$201a78d0$1fa9580a@swcenter.sec.samsung.co.kr>
References: <004601c86fa2$201a78d0$1fa9580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Fri, 15 Feb 2008 10:54:07 +0200
Message-Id: <1203065647.23414.6.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-linux-kernel@vger.kernel.org,
	'linux-mtd' <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-02-15 at 16:12 +0900, Kyungmin Park wrote:
> I got following messages.
> INFO: task pdflush:56 blocked for more than 120 seconds.
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>=20
> What are the meanings?
> Too mush running GC in JFFS2 or others?

Hi Kyungmin,

did not look at this, but off the top of my head this might be related
to the latest VFS changes (write_begin()/write_end() instead of
prepare_write()/commit_write()). Just a hint where you might try to
look.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
