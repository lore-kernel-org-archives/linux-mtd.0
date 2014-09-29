MIME-Version: 1.0
In-Reply-To: <CACna6rx=GyZ-4JpDix==WKszABseQXK6qCCkfiKCm9-WzBmM3A@mail.gmail.com>
References: <1410714624.3040.38.camel@decadent.org.uk>
 <1410714670.3040.39.camel@decadent.org.uk>
 <20140928222150.GC3248@norris-Latitude-E6410>
 <CACna6rx=GyZ-4JpDix==WKszABseQXK6qCCkfiKCm9-WzBmM3A@mail.gmail.com>
Date: Mon, 29 Sep 2014 11:53:14 +0200
Message-ID: <CACna6ry91b3wcHsG4C-td+STPuiaH7oaAcQuKiKdhud+jctUeA@mail.gmail.com>
Subject: Re: [PATCH 1/5] m25p80,spi-nor: Fix module aliases for m25p80
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 Huang Shijie <shijie8@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ian Campbell <ijc@hellion.org.uk>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29 September 2014 08:36, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrot=
e:
> 1) The main urgent issue: broken auto-loading
> Tracked in the thread: http://www.spinics.net/lists/linux-spi/msg01726.ht=
ml
> Problem: m25p80.c references spi_nor_ids (from external file)
> Short-term solution: duplicate IDs in the m25p80.c
>
> Ben: just like Brian, I think the patch like this one (
> [PATCH 1/5] m25p80,spi-nor: Fix module aliases for m25p80
> ) is the way to go. However few comments:

I started wondering... would this be possible to fix all m25p80 users
instead? Make them always specify modalias as "m25p80" and then
provide platform_data if needed?

Has anyone checked in how many places we use "wrong" (or should I say
"weird") modaliases? I guess some would need to grep kernel for all
possible names.
