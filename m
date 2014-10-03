Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa8C3-0004wF-QN
 for linux-mtd@lists.infradead.org; Fri, 03 Oct 2014 19:07:08 +0000
Message-ID: <542EF3BF.1070401@nod.at>
Date: Fri, 03 Oct 2014 21:06:39 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
References: <1412029248-22454-1-git-send-email-richard@nod.at>	
 <1412029248-22454-4-git-send-email-richard@nod.at>
 <1412346676.3795.62.camel@sauron.fi.intel.com>
In-Reply-To: <1412346676.3795.62.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 03.10.2014 16:31, schrieb Artem Bityutskiy:
> On Tue, 2014-09-30 at 00:20 +0200, Richard Weinberger wrote:
>> +
>> +	for (i = 0; i < UBI_PROT_QUEUE_LEN; i++) {
>> +		list_for_each_entry(wl_e, &ubi->pq[i], u.list) {
>> +			fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
> 
> Similarly to my other posts, is it possible to not touch the WL-internal
> things like 'ubi->pq[]' from fastmap.c? Can we come up with a function
> at wl.c which fastmap.c could call instead?

Fastmap needs basically access to all internal state of UBI, which lives mostly
within wl.c
It needs to iterate over the used, free, erase, scrub RB-trees, the protection queue, etc. to
collect the exact state of all PEBs.

In C++ or Java I would pass an iterator to fastmap.c using a function in wl.c but I'm not sure
how to do such a thing in a sane way in C.

What about having a wl-fastmap.c file which acts as glue layer between fastmap.c and wl.c?

Thanks,
//richard
