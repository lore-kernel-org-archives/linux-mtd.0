Received: from mail1.frequentis.com ([195.20.158.50])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAHia-0006Go-S8
 for linux-mtd@lists.infradead.org; Mon, 03 Feb 2014 11:29:38 +0000
From: BRUNMAYR Peter <Peter.BRUNMAYR@frequentis.com>
To: Andrea Adami <andrea.adami@gmail.com>
Subject: RE: [PROBLEM] buffer write error (status timeout) due to unexpected
 behavior of P30 Micron flashes during state change "erase -> erase suspend"
Date: Mon, 3 Feb 2014 11:27:04 +0000
Message-ID: <5FAE9987B8383445A4ECA479C08AC4816BBBFD85@vie197nt>
References: <5FAE9987B8383445A4ECA479C08AC4816BBBD81A@vie197nt>
 <1391191243.2501.3.camel@mizar.localdomain>
In-Reply-To: <1391191243.2501.3.camel@mizar.localdomain>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi Peter,
>=20
> I experience similar issues. See actual patches still work in progress
> [1]
>=20
> you are surely aware of
> http://www.micron.com/~/media/Documents/Products/Technical%20Note/
> NOR%
> 20Flash/tn1206_p30_p33_j3_linux.pdf
>=20
> Check out the specific fixes.
> I've tested that on my NOR but w/out much luck...
>=20
> One question: do you force CFI detection or does it 'just work'?

Hi Andrea!

Thank you for your reply. Yes, I am aware of the technical note from Micron=
 and unfortunately none of the mentioned patches fixes my problem.
The CFI detection worked in our system out of the box!

Best regards,
Peter
