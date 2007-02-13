Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HH06c-00076o-CA
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 11:02:13 -0500
Subject: Re: [PATCH] UBI: introduce sequential counter
From: Artem Bityutskiy <dedekind@infradead.org>
To: haver@vnet.ibm.com
In-Reply-To: <1171379484.4094.5.camel@localhost.localdomain>
References: <20070208200247.11853.36338.sendpatchset@localhost.localdomain>
	<1170972968.4884.140.camel@zod.rchland.ibm.com>
	<1171012339.10670.33.camel@sauron>
	<1171026729.4884.177.camel@zod.rchland.ibm.com>
	<1171032000.17314.4.camel@sauron>
	<1171379484.4094.5.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Tue, 13 Feb 2007 17:40:01 +0200
Message-Id: <1171381201.17314.60.camel@sauron>
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

On Tue, 2007-02-13 at 16:11 +0100, Frank Haverkamp wrote:
> The 64bit nature could complicate the compare code a little, and
> we are limited to those 4KiB as you know. Mhm. It should be than
> a comparission of a 64bit value instead of a 32bit one.

With current 32 bit versions you have to take care of overflow. For
example, version 1 is newer then version 0xFFFFFFFA. I doubt comparing 2
64-bit variable with _no_ need to look it overflow is more difficult and
takes more code.

These 32 bit overflowing counters really introduce mess.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
