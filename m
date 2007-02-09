Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFScq-0001mn-GX
	for linux-mtd@lists.infradead.org; Fri, 09 Feb 2007 05:05:57 -0500
Subject: Re: [PATCH] UBI: introduce sequential counter
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
In-Reply-To: <20070209055014.GA21893@lazybastard.org>
References: <20070208200247.11853.36338.sendpatchset@localhost.localdomain>
	<1170972968.4884.140.camel@zod.rchland.ibm.com>
	<20070209055014.GA21893@lazybastard.org>
Content-Type: text/plain; charset=utf-8
Date: Fri, 09 Feb 2007 11:19:56 +0200
Message-Id: <1171012796.16135.2.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: MTDML <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-02-09 at 05:50 +0000, J=C3=B6rn Engel wrote:
> This is an unusual way of looking at time, but it is perfectly valid.
> Whether an LEB is 40 seconds or 40 million years old is completely
> inconsequential.  What matters is not how much wall-clock time has
> passed, but how much other data was written.  "Bytes of data written" is
> a valid unit of time, really, and a very useful one.  Esp. for wear
> leveling decisions.

Yes, and the sequential counter is basically how many eraseblock were
written to, which is close.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
