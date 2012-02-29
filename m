Received: from nm21-vm7.bullet.mail.ird.yahoo.com ([212.82.109.247])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S2ryo-0004QB-2N
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 22:26:38 +0000
Message-ID: <1330554395.65878.YahooMailClassic@web29011.mail.ird.yahoo.com>
Date: Wed, 29 Feb 2012 22:26:35 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: dedekind1@gmail.com
In-Reply-To: <1330538621.3545.163.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- On Wed, 29/2/12, Artem Bityutskiy <dedekind1@gmail.com> wrote:=0A> Did =
you try to validate your setup=0A> with mtd tests?=0A=0ANo I did not.=0A=0A=
I've just quickly tried the readtest on all mtd partitions and they seemed=
=0Ato pass. A torturetest on a small unused partition reported "retried 3=
=0Atimes, still errors, give-up", but a stresstest on the same partition pa=
ssed.=0A=0AWas there a specific test and set of options I should try?=0AThe=
 hx4700 has NOR flash (Intel StrataFlash) so it looks like at least 4=0Aof =
the tests - pagetest, oobtest, subpagetest, nandecctest - are not=0Aappropr=
iate.
