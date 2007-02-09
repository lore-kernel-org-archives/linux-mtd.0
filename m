Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFXAN-0003u8-0j
	for linux-mtd@lists.infradead.org; Fri, 09 Feb 2007 09:56:01 -0500
Subject: Re: [PATCH] UBI: introduce sequential counter
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1171032618.4884.196.camel@zod.rchland.ibm.com>
References: <20070208200247.11853.36338.sendpatchset@localhost.localdomain>
	<1170972968.4884.140.camel@zod.rchland.ibm.com>
	<1171012339.10670.33.camel@sauron>
	<1171026729.4884.177.camel@zod.rchland.ibm.com>
	<1171032000.17314.4.camel@sauron>
	<1171032618.4884.196.camel@zod.rchland.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 09 Feb 2007 16:54:11 +0200
Message-Id: <1171032851.17314.8.camel@sauron>
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

On Fri, 2007-02-09 at 08:50 -0600, Josh Boyer wrote:
> Having them generate a unique number for seqnum isn't _required_ though
> right?  UBI will see them all as 0 and still work if I understand
> correctly.

Yes. I is not required to be done immediately. But in order to be able
to smoothly remove legacy stuff, it should be done better sooner then
later.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
