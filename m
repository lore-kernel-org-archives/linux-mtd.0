Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgBgD-0002z4-Oq
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 12:03:18 +0000
Message-ID: <1413806574.7906.233.camel@sauron.fi.intel.com>
Subject: Re: UBI_READWRITE constraint when opening volumes to rename
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Mon, 20 Oct 2014 15:02:54 +0300
In-Reply-To: <5444EDA4.9010808@nod.at>
References: <CAPcvp5E=MgV0-f8q9SFuMCzCEt-WVQiEu4XGJXj2QLyf5L1ohw@mail.gmail.com>
 <20141009102546.GA2755@arch.hh.imgtec.org>
 <CAPcvp5FammqUr67rv_LvqWPoPegLsPMLBTT-mkQ2u=VCs2-_8g@mail.gmail.com>
 <54384B11.6080209@nod.at>
 <CAPcvp5H39rdavCr8OENfaeCGmiaYrLeiGzBCrxrOg5n8xud-NQ@mail.gmail.com>
 <5444EDA4.9010808@nod.at>
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

On Mon, 2014-10-20 at 13:10 +0200, Richard Weinberger wrote:
> This is why I need to review all code paths first.
> My initial patch was not supposed to be a final solution, more a base for discussion.
> I.e. to follow the "less talk, more code" rule.

Let me try to summarise.

Exclusive mode - used for volume and LEB update. We do not want someone
to race with these operations on the same LEBs. Indeed, if one performs
a volume or LEB update, we want to guarantee that that the result of the
operation is that the volume/LEB contains the data user sent us.

Read/write - just R/W mode, many users may race

Read-only - when we know we should not write to the volume, and want UBI
to refuse our writes in case we try to write, say, because of a bug in
UBIFS code.

AFAICS, all the modes are useful.

Metaonly - we are not going to change the data, only the meta-data like
the volume name. Seem to be a good idea to me, thanks!
