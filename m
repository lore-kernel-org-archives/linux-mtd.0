Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dC9Qh-0004JK-8E
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 18:48:45 +0000
Subject: Re: [RFC] Pre-seeded files/directories for UBIFS
To: Florian Fainelli <f.fainelli@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <8f4afb8e-7e98-d59f-abb6-64190ed717f5@nod.at>
 <3dcf8aac-5b84-8ced-fcf1-9fe026861cd6@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 LEDE Development List <lede-dev@lists.infradead.org>,
 openwrt-devel@lists.openwrt.org, Felix Fietkau <nbd@nbd.name>
From: Richard Weinberger <richard@nod.at>
Message-ID: <9b3bd716-0a22-aa28-c169-4ab4d567bb6f@nod.at>
Date: Sat, 20 May 2017 20:48:18 +0200
MIME-Version: 1.0
In-Reply-To: <3dcf8aac-5b84-8ced-fcf1-9fe026861cd6@gmail.com>
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

Florian,

Am 20.05.2017 um 20:39 schrieb Florian Fainelli:
> Hello,
> 
> On 05/20/2017 09:12 AM, Richard Weinberger wrote:
>> Hi!
>>
>> These days I had an interesting discussion with Christoph about overlayfs and
>> its burden. The main use-case of overlayfs in combination with UBIFS is having a
>> squashfs as lower and UBIFS as upper directory. Such that all changes to the
>> read-only squashfs go into UBIFS. Upon a factory reset all files within the
>> UBIFS will be removed  and the merged directory is clean again. Christoph argued
>> that such a functionality  could be achieved without overlayfs if the filesystem
>> supported something like pre-seeded  files or directories. This would lower
>> memory pressure and complexity.
> 
> As you may know, OpenWrt/LEDE have been using this scheme for many years
> now (before it was named overlayfs, this was called mini fanout overlay
> ~10 yrs ago) with squashfs + jffs2 before on P-NOR flashes. There are
> still devices like those that benefit from squashfs(ro)+jffs2(rw), so
> while bringing a similar functionality using UBIFS exclusively would be
> interesting, it would still make Linux distribution want to support a
> more generic scheme which is using overlayfs as well.

UBIFS will still support overlayfs and adding a pre-seed mechanism
to UBIFS will not block generic solutions.
Maybe we can add a generic interface to VFS at some point if other filesystems
support that too. :-)

Thanks,
//richard
