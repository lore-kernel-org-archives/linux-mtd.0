Received: from smtp1-3.goneo.de ([85.220.129.32])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQbLO-0001u8-BP
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 16:31:32 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v2 53/53] kernel-doc: describe the ``literal`` syntax
From: Markus Heiser <markus.heiser@darmarit.de>
In-Reply-To: <5d47c31b59f6c2c7ddce0fcb1be0f85ad39a56fe.1494935649.git.mchehab@s-opensource.com>
Date: Wed, 6 Jun 2018 18:31:05 +0200
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF34D78D-738B-47F4-B188-9777440B7E70@darmarit.de>
References: <cover.1494935649.git.mchehab@s-opensource.com>
 <cover.1494935649.git.mchehab@s-opensource.com>
 <5d47c31b59f6c2c7ddce0fcb1be0f85ad39a56fe.1494935649.git.mchehab@s-opensource.com>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mauro,

> Am 16.05.2017 um 14:16 schrieb Mauro Carvalho Chehab =
<mchehab@s-opensource.com>:
>=20
> changeset b97f193abf83 ("scripts/kernel-doc: fix parser
> for apostrophes") added support for ``literal`` inside
> kernel-doc, in order to allow using the "%" symbol inside
> a literal block, as this is used at printk() description.
>=20
> Document it.
>=20
> Fixes: b97f193abf83 ("scripts/kernel-doc: fix parser for apostrophes")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> ---
> Documentation/doc-guide/kernel-doc.rst | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/doc-guide/kernel-doc.rst =
b/Documentation/doc-guide/kernel-doc.rst
> index b32e4813ff6f..b24854b5d6be 100644
> --- a/Documentation/doc-guide/kernel-doc.rst
> +++ b/Documentation/doc-guide/kernel-doc.rst
> @@ -149,6 +149,16 @@ Domain`_ references.
> ``%CONST``
>   Name of a constant. (No cross-referencing, just formatting.)
>=20
> +````literal````
> +  A literal block that should be handled as-is. The output will use a
> +  ``monospaced font``.

just nitpicking; this is not literal block, this is called an inline =
literal [1]

To be complete: "blocks" are allways indented.

[1] =
http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#inline-=
literals

--- Markus --
