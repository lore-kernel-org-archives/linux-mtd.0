Received: from anubis.se.axis.com ([195.60.68.12])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SX6hr-0003Wt-K2
 for linux-mtd@lists.infradead.org; Wed, 23 May 2012 08:14:08 +0000
From: Johan Gunnarsson <johan.gunnarsson@axis.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Date: Wed, 23 May 2012 10:14:00 +0200
Subject: RE: [PATCH 2/2] mtd: nand: use hrtimer to measure timeout in
 nand_wait{_ready, }
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7534B6687F4@xmail3.se.axis.com>
References: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
 <1337589758-8775-3-git-send-email-johan.gunnarsson@axis.com>
 <1337673190.2483.115.camel@sauron.fi.intel.com>
 <A612847CFE53224C91B23E3A5B48BAC7534B129D18@xmail3.se.axis.com>
 <20120522171023.GA2372@parrot.com>
In-Reply-To: <20120522171023.GA2372@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jesper Nilsson <jespern@axis.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Why not simplify and just use a single 1s (1000ms) timeout ?
>=20
> Johan,
> with such a timeout value, your bug would manifest itself only if
> interrupts are blocked for nearly a second: would that be acceptable ?

That indeed would be acceptable from my side.
