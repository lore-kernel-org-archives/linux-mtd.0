Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgCkA-0008Nn-O3
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 13:11:27 +0000
Message-ID: <1413810620.7906.267.camel@sauron.fi.intel.com>
Subject: Re: UBI_READWRITE constraint when opening volumes to rename
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Mon, 20 Oct 2014 16:10:20 +0300
In-Reply-To: <54450352.6000408@nod.at>
References: <CAPcvp5E=MgV0-f8q9SFuMCzCEt-WVQiEu4XGJXj2QLyf5L1ohw@mail.gmail.com>
 <20141009102546.GA2755@arch.hh.imgtec.org>
 <CAPcvp5FammqUr67rv_LvqWPoPegLsPMLBTT-mkQ2u=VCs2-_8g@mail.gmail.com>
 <54384B11.6080209@nod.at>
 <CAPcvp5H39rdavCr8OENfaeCGmiaYrLeiGzBCrxrOg5n8xud-NQ@mail.gmail.com>
 <5444EDA4.9010808@nod.at> <1413806574.7906.233.camel@sauron.fi.intel.com>
 <54450352.6000408@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Murray <amurray@embedded-bits.co.uk>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-10-20 at 14:42 +0200, Richard Weinberger wrote:
> BTW: one corner case is the volume delete operation.
> It touches meta data and LEBs. Currently you need exclusive mode for this.
> IMHO it makes sense to deny metaonly mode if an UBI volume is opened in exclusive mode.

Oh, yes, the 'delete' semantics is that volume goes away and all the
space it had reserved becomes available, so the data it contained is
thrown away, so the operation does affect the data.

Artem.
