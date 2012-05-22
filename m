Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWggK-0001b2-Mn
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 04:26:49 +0000
From: "Mohammed, Afzal" <afzal@ti.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: RE: [PATCH 0/3] GPMC NAND isr using standard API
Date: Tue, 22 May 2012 04:26:32 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E98EE28@DBDE01.ent.ti.com>
References: <cover.1337090835.git.afzal@ti.com>
 <20120519125018.GA2407@parrot.com>
In-Reply-To: <20120519125018.GA2407@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ivan,

On Sat, May 19, 2012 at 18:20:18, Ivan Djelic wrote:

> Hi Afzal,
>=20
> I tried to take your series of patches, but I had issues with the
> first [1] (I did not try the others): it depends on the following patch,
> which is not in the l2-mtd-2.6 tree:
>=20
> http://www.mail-archive.com/linux-omap@vger.kernel.org/msg68258.html
>=20
> and it does not apply anyway to l2-mtd-2.6 because of (at least) the
> following patches:
>=20
> http://lists.infradead.org/pipermail/linux-mtd/2012-April/040631.html
> http://lists.infradead.org/pipermail/linux-mtd/2012-April/040724.html
>=20
> So, do you think you could rebase your series on l2-mtd-2.6 ?
> And maybe merge the 3 series into a single one, if they have circular
> dependencies ?

I am not sure what the workflow should be here, all patch series were
made over omap tree, if it is generated over mtd tree, similar issue
would happen for omap platform patches.=20

In any case, for your reference, the 3 series of patches of had been
rebased over mtd tree, and is available,

git@gitorious.org:x0148406-public/linux-kernel.git gpmc-mtd.

To prevent confusion the 3 patch series has not been posted.

Tony, Artem, how should the conflict between omap & mtd trees be handled
for patch series ?

I believe it is better to send the 3 patch series into one as mentioned
by Ivan, and planning to do so, but in that case over which tree should
it be based ?

Regards
Afzal
