Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQqW5-0003s0-4E
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2018 08:43:34 +0000
Date: Thu, 7 Jun 2018 10:42:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michele Dionisio <michele.dionisio@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: wrong log on NOR
Message-ID: <20180607104250.7b7a18b2@xps13>
In-Reply-To: <CAFwEtmqWOcZ1kSu_N4CmpWMb4Z_cTAQGG6L19AvfBi-K672NWA@mail.gmail.com>
References: <CAFwEtmqWOcZ1kSu_N4CmpWMb4Z_cTAQGG6L19AvfBi-K672NWA@mail.gmail.com>
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

Hi Michele,

On Wed, 6 Jun 2018 14:36:42 +0200, Michele Dionisio
<michele.dionisio@gmail.com> wrote:

> Hi all,
> with version v2.0.2 working on NOR I have not so nice log message that sa=
y:
>=20
> ECCGETLAYOUT ioctl request failed
>=20
> but on NOR is useless to try to read OBB so I suggest to apply the
> attached patch.

Thanks a lot for contributing.

As depicted in Documentation/process/submitting-patches.rst, could you
please re-send your patch inline (no attachments) to ease the review
process?

Don't forget to add a proper title and commit message.

Thank you,
Miqu=C3=A8l
