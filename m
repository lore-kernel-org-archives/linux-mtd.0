Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ztttg-000820-3m
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 08:58:24 +0000
Message-ID: <1446627479.20949.47.camel@gmail.com>
Subject: Re: master node can not be recovered
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, Bean Huo
 =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?= "\"(beanhuo)\""
 <beanhuo@micron.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Date: Wed, 04 Nov 2015 10:57:59 +0200
In-Reply-To: <20151104094049.123e87b8@bbrezillon>
References: <A765B125120D1346A63912DDE6D8B6310BF4FB2A@NTXXIAMBX02.xacn.micron.com>
 <5637934D.5000503@nod.at> <1446541937.6126.125.camel@gmail.com>
 <A765B125120D1346A63912DDE6D8B6310BF4FE9E@NTXXIAMBX02.xacn.micron.com>
 <5639BBDE.5000604@nod.at> <1446625250.20949.26.camel@gmail.com>
 <20151104094049.123e87b8@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2015-11-04 at 09:40 +0100, Boris Brezillon wrote:
> The question is, what should we do in this case? Should we drop all
> the
> pages following the corrupted page in the LEB? Should we only drop
> the
> faulty page and parse the nodes in the valid pages we can find after
> this corruption (I don't know if it can be the case, but if some
> nodes
> depend on other nodes, doing that may not work)? Any other option?

To recap my opinion expressed in the other thread.

1. We only care about paired pages in the power cut context.
2. This means that we care about paired pages in the same places where
we care about losing data or metadata.
3. UBIFS has a number of places where it cares about data and metadata,
and paired pages story should boil down to changes those places.
Examples of the places would be: wbuf sync, the log, the master nodes,
LPT.
4. The strategy seems to be pretty simple: skipping enough pages. And
UBIFS already has the "padding" mechanism which does this.

Or in other words, whenever we have to make sure the data does not get
affected by a power cut, we skip pages. This happens when user
syncs/fsyncs/unmounts/etc, when we commit, when we write the master
node or a log nod, etc. All are limited number of places, where we
already explicitly care about power cuts.
