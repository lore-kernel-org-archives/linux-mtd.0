Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xu1hs-0005AH-2d
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 16:14:13 +0000
Message-ID: <54774DB7.5090200@nod.at>
Date: Thu, 27 Nov 2014 17:13:43 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 2/6] UBI: Fastmap: Ensure that only one fastmap work is
 scheduled
References: <1416835236-25185-1-git-send-email-richard@nod.at>	
 <1416835236-25185-3-git-send-email-richard@nod.at>
 <1417102042.5858.102.camel@sauron.fi.intel.com>
In-Reply-To: <1417102042.5858.102.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 27.11.2014 um 16:27 schrieb Artem Bityutskiy:
> On Mon, 2014-11-24 at 14:20 +0100, Richard Weinberger wrote:
>> If the WL pool runs out of PEBs we schedule a fastmap write
>> to refill it as soon as possible.
>> Ensure that only one at a time is scheduled otherwise we might end in
>> a fastmap write storm because writing the fastmap can schedule another
>> write if bitflips are detected.
> 
> Could you please provide some more details about the "write storm". Does
> it happen when there are 2 fastmap works in the queue? Or if they run
> simultaneously? Why the storm happens and white kind of "writes" it
> consists of?

If UBI needs to write a new fastmap while wear leveling (by using get_peb_for_wl())
a fastmap work is scheduled.
We cannot write a fastmap in this context because we're in atomic context.
At this point one fastmap write is scheduled. If now get_peb_for_wl() is executed
a second time it will schedule another fastmap work because the pools are still not refilled.
This will go on until finally a fastmap got written. Either by the the kworker or
ubi_wl_get_peb().
As now a lot of fastmap works are scheduled they all will be issues in series.
Hence, a write storm. :)

Thanks,
//richard
