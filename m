Received: from p01c11o145.mxlogic.net ([208.65.144.68])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCLGt-0001Dv-K9
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 23:23:24 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>, linux-mtd
	<linux-mtd@lists.infradead.org>
Date: Wed, 12 May 2010 18:23:10 -0500
Subject: RE: Question about flash_info utility
Message-ID: <0D753D10438DA54287A00B0270842697636EF69B58@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B0270842697636EF69B4A@AUSP01VMBX24.collaborationhost.net>
In-Reply-To: <0D753D10438DA54287A00B0270842697636EF69B4A@AUSP01VMBX24.collaborationhost.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, May 12, 2010 4:14 PM, H Hartley Sweeten wrote:
> Hello all,
>=20
> I'm trying to finalize my flash on a new product and have a
> question about the mtd utilities, specifically the 'flash_info'
> utility.

Oops... Misunderstood what flash_info is reporting.

Since all my mtd nodes exist in uniform erase block regions I
guess the "0 erase regions" result is appropriate.

Maybe the message should be changed to reflect this?

Regards,
Hartley=
