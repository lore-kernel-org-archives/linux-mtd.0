Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqTXA-00053j-6t
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 17:54:52 +0000
Message-ID: <4F219369.3040208@flatfrog.com>
Date: Thu, 26 Jan 2012 18:54:49 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: Paul Walmsley <paul@pwsan.com>
Subject: Re: CONFIG_PREEMPT and JFFS2 oops
References: <4F206213.9070704@flatfrog.com>
 <alpine.DEB.2.00.1201251351500.5324@utopia.booyaka.com>
 <4F2127B8.9000005@flatfrog.com> <4F213ED8.2020500@flatfrog.com>
 <alpine.DEB.2.00.1201260801410.11174@utopia.booyaka.com>
 <OF645D734B.78418504-ONC1257991.005A101B-C1257991.005A7809@transmode.se>
 <alpine.DEB.2.00.1201260934190.11174@utopia.booyaka.com>
 <alpine.DEB.2.00.1201260936440.11174@utopia.booyaka.com>
 <OF4651C12F.58F763E5-ONC1257991.005C0D05-C1257991.005C4F23@transmode.se>
 <alpine.DEB.2.00.1201260953550.32667@utopia.booyaka.com>
In-Reply-To: <alpine.DEB.2.00.1201260953550.32667@utopia.booyaka.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Purdie <rpurdie@openedhand.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/26/2012 05:57 PM, Paul Walmsley wrote:
>>
>> You just throw away best_buf here, don't you?
>
> You're right.  It's even worse than that.  best_buf will contain the data
> from the last compressor used.  And it will be prematurely freed.  Here's
> a fixed version.

I've tested this version for a while now with the same result as before.

No oopses, no spinlock violations.  I copied a 2MB file from the SD/MMC 
partition to the two JFFS2 partitions and md5summ'ed it a bunch of 
times.  After that I unmounted and remounted both partitions.

I do see a steady memory usage increase when doing continuous testing, 
but whether that's normal I don't know.  I see at least some of it being 
reclaimed when unmounting the JFFS2 partitions (grep jffs2 /proc/slabinfo).

-- 
Orjan Friberg
FlatFrog Laboratories AB
