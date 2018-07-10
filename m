Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcs0G-0004k7-Fl
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2018 12:44:27 +0000
Date: Tue, 10 Jul 2018 14:44:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH v6 0/6] mtd: rawnand: support MT29F1G08ABAFAWP-ITE:F
Message-ID: <20180710144401.64ebef79@xps13>
In-Reply-To: <1df9a5d95c44408ab42b34948f956351@SIWEX5A.sing.micron.com>
References: <1df9a5d95c44408ab42b34948f956351@SIWEX5A.sing.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bean,

> I encounter one question as below when I reply the email of linux-mtd, bu=
t If I reply other mail list=20
> Such as scsi mail list, mmc mail list, no any problem. Do you know why?=20
>=20
>=20
> Your mail to 'linux-mtd' with the subject
>=20
>     Re: [PATCH v6 0/6] mtd: rawnand: support MT29F1G08ABAFAWP-ITE:F
>=20
> Is being held until the list moderator can review it for approval.
>=20
> The reason it is being held:
>=20
>     Message has a suspicious header

Linus recently reported to a contributor that one of his patches got
marked as SPAM by the kernel ML because it failed the DKIM signature.
This was caused by a bad handling somewhere of the 'To:' field that
ended-up being empty. While this is an arguable handling from mailman,
it might be related to your problems.

Otherwise you could share the headers, but as this message passed
through the mailing list filter, I suspect it's not a severe issue.

Thanks,
Miqu=C3=A8l
