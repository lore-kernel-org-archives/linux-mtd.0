Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kiO9-0000TG-7Y
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 11:52:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Marcos Lois =?ISO-8859-1?Q?Berm=FAdez?= <securez@teleline.es>
In-Reply-To: <5.2.1.1.2.20030807101847.00bfc310@pop3.iqc-services.com>
References: <5.2.1.1.2.20030807101847.00bfc310@pop3.iqc-services.com>
Message-Id: <1060253567.25209.56.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 07 Aug 2003 11:52:48 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: I have a NOR and NAND flash chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-07 at 09:22, Marcos Lois Berm=C3=BAdez wrote:
> Can i setup mtd to work with both types of memories NOR and NAND, there a=
re=20
> any example to do this?

Yes. You don't have to do anything special -- just have drivers for any
and all flash devices found in the system. You just have to be aware
that they'll get assigned numbers in the order they get registered,
that's all.

> How i can implement the SmartMedia slot, to allow hot plug of the=20
> smartmedia cards?


That one's slightly harder. I suppose you just need to redirect all the
read/write/erase functions to something which returns -EIO when it's
hot-unplugged while it's in use.

--=20
dwmw2
