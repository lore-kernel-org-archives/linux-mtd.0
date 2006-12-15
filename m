Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GvDiX-0002Ml-Lx
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 09:07:20 -0500
Subject: Re: UBI error on 64bit Machine
From: Artem Bityutskiy <dedekind@infradead.org>
To: Shiner Chen <shiner.chen@gmail.com>
In-Reply-To: <f9fe74a60612150559x4bcb9eedlfe9675b6be70682@mail.gmail.com>
References: <f9fe74a60612150559x4bcb9eedlfe9675b6be70682@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 15 Dec 2006 16:07:09 +0200
Message-Id: <1166191629.18628.64.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-12-15 at 21:59 +0800, Shiner Chen wrote:
> Dec 15 04:45:33 localhost kernel:UBI:empty MTD device detected
> Dec 15 04:45:33 localhost kernel:UBI:create volume table(copy #1)
> Dec 15 04:45:33 localhost kernel:UBI:create volume table(copy #2)
> Dec 15 04:45:33 localhost kernel:UBI:create volume table(copy #2)
> Dec 15 04:45:33 localhost kernel:UBI:error:ubi_scan_add_volume:two
> LEBs with same version 0

Hmm, this is weird. Why I see 2 "create volume table(copy #2)" messages?
May you please write how you load UBI? as a module? which commands you
use?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
