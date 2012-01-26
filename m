Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqNtz-0008Gv-Iy
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 11:54:04 +0000
Message-ID: <4F213ED8.2020500@flatfrog.com>
Date: Thu, 26 Jan 2012 12:54:00 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: CONFIG_PREEMPT and JFFS2 oops
References: <4F206213.9070704@flatfrog.com>
 <alpine.DEB.2.00.1201251351500.5324@utopia.booyaka.com>
 <4F2127B8.9000005@flatfrog.com>
In-Reply-To: <4F2127B8.9000005@flatfrog.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/26/2012 11:15 AM, Orjan Friberg wrote:
>>     problem to mysteriously disappear.  Doing this analysis should provide a
>>     good clue as to where to look next.  I personally would be rather
>>     suspicious of that
>>
>> 		ri->data_crc = cpu_to_je32(crc32(0, comprbuf, cdatalen));
>>
>>     in jffs2_write_inode_range().
>
> That is indeed the place where crc32 is called from .  I'll see it I can
> track the use of comprbuf.

Ok, so comprbuf comes from jffs2_compress and becomes NULL for some 
reason (hence the oops).

Initially I had CMODE_FAVOUR_LZO.  With that, things only worked with 
PREEMPT_NONE.  However, when changing to CMODE_PRIORITY or CMODE_NONE 
things do seem to work *with* PREEMPT.

For what it's worth (with PREEMPT on):

CMODE_FAVOUR_LZO with LZO disabled oopses.
CMODE_FAVOUR_LZO with only ZLIB enabled oopses.
CMODE_FAVOUR_LZO with ZLIB/LZO/RTIME/RUBIN disabled does not oops.

Thus, the bug seems to be in the *selection* of compression algorithm 
(when there is at least one algoritm in the list), rather than in the 
specific compression algorithms themselves.


-- 
Orjan Friberg
FlatFrog Laboratories AB
