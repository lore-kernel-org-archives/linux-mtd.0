Received: from mtagate1.de.ibm.com ([195.212.17.161])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lj9B5-0000D9-1f
	for linux-mtd@lists.infradead.org; Mon, 16 Mar 2009 09:32:27 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate1.de.ibm.com (8.13.1/8.13.1) with ESMTP id n2G9VxAl028862
	for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2009 09:31:59 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.2) with
	ESMTP id n2G9VwTW4407404
	for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2009 10:31:58 +0100
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id n2G9VwtT023933
	for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2009 10:31:58 +0100
To: dedekind@infradead.org
Subject: Re: old and new ubi utilities
References: <1236959822.24755.14.camel@localhost.localdomain>
From: Andreas Arnez <arnez@vnet.ibm.com>
Date: Mon, 16 Mar 2009 10:33:02 +0100
In-Reply-To: <1236959822.24755.14.camel@localhost.localdomain> (Artem
	Bityutskiy's message of "Fri\, 13 Mar 2009 17\:57\:02 +0200")
Message-ID: <m3myblizht.fsf@vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, haver@vnet.ibm.com,
	Sidney Amani <seed95@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind@infradead.org> writes:

> It seems that nowadays the old ubi utilities are unused and
> unmaintained. And I've got a question from Sidney if it would be
> possible to change the MTD repository layout and move the new utilities
> to
> 	mtd-utils/ubi-utils
> and old utilities to
> 	mtd-utils/ubi-utils/old-utils
> just like I have originally done.
>
> So, will you mind if I do this, taking into account that the old
> utilities are not widely used and not maintained?

We can adjust to such restructuring.  We may still stick to the old
utilities for now, because the last time I looked, the new utilities
were lacking some functionality we relied upon.

-- Andreas Arnez

IBM Systems & Technology Group, Systems Software Development
FW FSP Platform Entwicklung

IBM Deutschland
Schoenaicher Str. 220
71032 Boeblingen
Phone: +49-7031-16-3923
E-Mail: arnez@de.ibm.com

IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Martin Jetter
Gesch=C3=A4ftsf=C3=BChrung: Erich Baier
Sitz der Gesellschaft: B=C3=B6blingen
Registergericht: Amtsgericht Stuttgart, HRB 243294
