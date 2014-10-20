Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgCJ0-0001UL-G1
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 12:43:23 +0000
Message-ID: <54450352.6000408@nod.at>
Date: Mon, 20 Oct 2014 14:42:58 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBI_READWRITE constraint when opening volumes to rename
References: <CAPcvp5E=MgV0-f8q9SFuMCzCEt-WVQiEu4XGJXj2QLyf5L1ohw@mail.gmail.com>		<20141009102546.GA2755@arch.hh.imgtec.org>		<CAPcvp5FammqUr67rv_LvqWPoPegLsPMLBTT-mkQ2u=VCs2-_8g@mail.gmail.com>		<54384B11.6080209@nod.at>	
 <CAPcvp5H39rdavCr8OENfaeCGmiaYrLeiGzBCrxrOg5n8xud-NQ@mail.gmail.com>	
 <5444EDA4.9010808@nod.at> <1413806574.7906.233.camel@sauron.fi.intel.com>
In-Reply-To: <1413806574.7906.233.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
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

Am 20.10.2014 um 14:02 schrieb Artem Bityutskiy:
> On Mon, 2014-10-20 at 13:10 +0200, Richard Weinberger wrote:
>> This is why I need to review all code paths first.
>> My initial patch was not supposed to be a final solution, more a base for discussion.
>> I.e. to follow the "less talk, more code" rule.
> 
> Let me try to summarise.
> 
> Exclusive mode - used for volume and LEB update. We do not want someone
> to race with these operations on the same LEBs. Indeed, if one performs
> a volume or LEB update, we want to guarantee that that the result of the
> operation is that the volume/LEB contains the data user sent us.
> 
> Read/write - just R/W mode, many users may race
> 
> Read-only - when we know we should not write to the volume, and want UBI
> to refuse our writes in case we try to write, say, because of a bug in
> UBIFS code.
> 
> AFAICS, all the modes are useful.
> 
> Metaonly - we are not going to change the data, only the meta-data like
> the volume name. Seem to be a good idea to me, thanks!

BTW: one corner case is the volume delete operation.
It touches meta data and LEBs. Currently you need exclusive mode for this.
IMHO it makes sense to deny metaonly mode if an UBI volume is opened in exclusive mode.

Thanks,
//richard
