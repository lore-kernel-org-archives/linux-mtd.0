Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OAUQQ-0001u4-JS
	for linux-mtd@lists.infradead.org; Fri, 07 May 2010 20:45:35 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "Arno Steffen" <arno.steffen@googlemail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 7 May 2010 13:45:14 -0700
Subject: RE: <4>mtd->read(x bytes from y) returned ECC error / Node
	header CRC failed / READ error
Message-ID: <B125D8217ABC4B43826503DE00A2D44910FDF52118@SJEXCHCCR01.corp.ad.broadcom.com>
References: <i2z804f0d21005060530qb2a65906j62e68c9f6f5e90bc@mail.gmail.com>
	<B125D8217ABC4B43826503DE00A2D44910FDF51E19@SJEXCHCCR01.corp.ad.broadcom.com>
	<r2m804f0d21005070245p46f7ab7aoa182a1c5316f7b3f@mail.gmail.com>
In-Reply-To: <r2m804f0d21005070245p46f7ab7aoa182a1c5316f7b3f@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> For the first I have mounted the jffs2 (rootfs) as read only
> (confirmed by a "VFS: Mounted root (jffs2 filesystem) readonly
> message").
> The behaviour is still the same. So does it makes a difference to set
> WriteProtection?
> The other question - if this is some selfhealing issue (as messages
> dissapear in next boot), why it will not try to heal itself right on
> time? Is it possible to force this?
> I cound't found a fitting option in kernel config (at least not one I
> would understood).

Sorry, I missed that. My comment was for writable file systems.=20

>=20
