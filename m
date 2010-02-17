Received: from web37607.mail.mud.yahoo.com ([209.191.87.90])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NhZcN-0002uk-TB
	for linux-mtd@lists.infradead.org; Wed, 17 Feb 2010 02:26:28 +0000
Message-ID: <849744.7095.qm@web37607.mail.mud.yahoo.com>
Date: Tue, 16 Feb 2010 18:26:20 -0800 (PST)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Legacy memstick support + FTL questions
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1266364168.13308.35.camel@maxim-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I  mean when controller reads the 'int status' it does
> send a TPC?
> (I am sure that it does)
>=20
> However mine can't do that and int status is read normally
> (yay...)
>=20

There are two things to know:
1. In serial mode, some controllers issue GET_INT TPC automatically
after each command, but only if certain configuration bit is set.

2. In parallel mode, the meaningful bits of the interrupt register
are exposed on the DIO pins of the media at the end of command execution
and can be latched by the controller (this is a suggested behavior).

If you want to write a generic legacy MS support, you must take into
account that this behavior is not there for granted.
=0A=0A=0A      
