Received: from mail.aswsp.com ([193.34.35.150])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNLge-0003Jf-L2
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 12:21:38 +0000
Date: Tue, 11 Mar 2014 13:21:09 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: <dedekind1@gmail.com>
Subject: Re: [RFC PATCH] UBIFS: remove check for all(0xff) for empty pages
Message-ID: <20140311132109.4201b0dd@parrot.com>
In-Reply-To: <1394523766.6302.216.camel@sauron.fi.intel.com>
References: <1394518992-26969-1-git-send-email-pekon@ti.com>
 <1394523766.6302.216.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
Cc: Kent Li <Kent.Li@radisys.com>, Stefan Roese <sr@denx.de>,
 HOUR Frderic <frederic.hour@safran-engineering.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Tue, 11 Mar 2014 09:42:46 +0200,
Artem Bityutskiy <dedekind1@gmail.com> a =E9crit :

> On Tue, 2014-03-11 at 11:53 +0530, Pekon Gupta wrote:
>=20
> However, there is one type of corruptions we _did_ want to gracefully
> handle - corruptions caused by power cuts.
>=20
> So in the kernel space we tried to be very very careful in
> distinguishing between power cut corruptions and random corruptions.
>=20
> Now, power cut corruptions have the following properties:
>=20
> 1. Can only happen in journal LEBs.
> 2. Happen only in one single write unit (max_write_size), because UBIFS
> always writes one write unit (or less) at a time.
> 3. The next write unit (the one coming after the corrupted write unit)
> should be empty, never written to. Just because we write unit after unit
> sequentially.
>=20
I think this is not true with MLC flash that Pekon want to handle.

There is the paired page problem [1] and the power cut corruption can
happen in more than one page.



[1]
[NEED WORK] There is another aspect of MLC flashes which may need closer at=
tention: the "paired pages" problem (e.g., see this Power Point presentatio=
n). Namely, MLC NAND pages are coupled in a sense that if you cut power whi=
le writing to a page, you corrupt not only this page, but also one of the p=
revious pages which is paired with the current one. For example, pages 0 an=
d 3, 1 and 4, 2 and 5, 3 and 6 in and so on (in the same eraseblock) may be=
 paired (page distance is 4, but there may be other distances). So if you w=
rite data to, say, page 3 and cut the power, you may end up with corrupted =
data in page 0. UBIFS is not ready to handle this problem at the moment and=
 this needs some work.

UBIFS can handle this problem by avoiding using the rest of free space in L=
EBs after a sync or commit operation. E.g., if start writing to a new journ=
al LEB, and then have a sync or commit, we should "waste" some amount of fr=
ee space in this LEB to make sure that the previous paired page does not co=
ntain synced data. This way we guarantee that a power cut will not corrupt =
the synced or committed data. And the "wasted" free space can be re-used af=
ter that LEB has been garbage-collected. Similar to all the other LEBs we w=
rite to (LPT, log, orphan, etc). This would require some work and would mak=
e UBIFS slower, so this should probably be optional. The way to attack this=
 issue is to improve UBIFS power cut emulation and implement "paired-pages"=
 emulation, then use the integck test for testing. After all the issues are=
 fixed, real power-cut tests could be carried out.
