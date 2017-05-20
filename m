Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCAVm-00034G-Qo
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 19:58:05 +0000
Subject: Re: [OpenWrt-Devel] [RFC] Pre-seeded files/directories for UBIFS
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <8f4afb8e-7e98-d59f-abb6-64190ed717f5@nod.at>
 <3dcf8aac-5b84-8ced-fcf1-9fe026861cd6@gmail.com>
 <20170520213654.6b6d18eb@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 LEDE Development List <lede-dev@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Christoph Hellwig <hch@infradead.org>, openwrt-devel@lists.openwrt.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <aa843f51-b037-5a09-28f4-f0b7b5396ce5@nod.at>
Date: Sat, 20 May 2017 21:57:36 +0200
MIME-Version: 1.0
In-Reply-To: <20170520213654.6b6d18eb@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ralph,

Am 20.05.2017 um 21:36 schrieb Ralph Sennhauser:
>>> These days I had an interesting discussion with Christoph about
>>> overlayfs and its burden. The main use-case of overlayfs in
>>> combination with UBIFS is having a squashfs as lower and UBIFS as
>>> upper directory. Such that all changes to the read-only squashfs go
>>> into UBIFS. Upon a factory reset all files within the UBIFS will be
>>> removed  and the merged directory is clean again. Christoph argued
>>> that such a functionality  could be achieved without overlayfs if
>>> the filesystem supported something like pre-seeded  files or
>>> directories. This would lower memory pressure and complexity.  
>>
>> As you may know, OpenWrt/LEDE have been using this scheme for many
>> years now (before it was named overlayfs, this was called mini fanout
>> overlay ~10 yrs ago) with squashfs + jffs2 before on P-NOR flashes.
>> There are still devices like those that benefit from
>> squashfs(ro)+jffs2(rw), so while bringing a similar functionality
>> using UBIFS exclusively would be interesting, it would still make
>> Linux distribution want to support a more generic scheme which is
>> using overlayfs as well.
>>
> 
> There is also the size consideration. Unless a seeded ubifs can get
> close to squashfs in terms of compression there would still be a
> use-case for squashfs with an ubifs overlay. My current root as ubifs
> instead of squashfs is 76.8% bigger.

You seem to misunderstand this feature, the goal is not to void all
uses of squashfs.
I'm pretty sure for the LEDE usecase squashfs is the better choice.

Thanks,
//richard
