From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41614B2F.8060901@yandex.ru>
References: <416122A1.4060302@oktetlabs.ru>
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>
	<416127B7.3070505@yandex.ru>
	<1096893242.22034.5.camel@weaponx.rchland.ibm.com>
	<41614B2F.8060901@yandex.ru>
Content-Type: text/plain
Message-Id: <1096895892.30942.614.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 14:18:13 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-04 at 17:07 +0400, Artem B. Bityuckiy wrote:
> FIFOs, blk/chr dvice files *always have only one valid node at a time* 
> (right?). Thus, when building the inode cache, we may only read the node 
> with the highest version (which is found by scanning the correspondent 
> node_ref list) and read *only* this node. If it is OK (CRC is right), no 
> need to read more. If CRC is bad, read the older one...  Checkpoints 
> aren't needed, this is *another* improvement...
>
> How about this scheme?

Seems sane.
 
> David Woodhouse:
>  > I agree that it shouldn't be left to the GC thread alone -- there isn't
>  > one on eCos and it's optional on Linux too.
> 
> Hmm, true.
> Does eCos support threads (I didn't work with it)?

It can, but it's optional. Like the GC thread in JFFS2 is.

>  If not, the situation  is more complicated... I want to use thread
>  (low-priority) in order to *not affect the system performance much*.

It won't affect the system performance much _anyway_. Write it only when
you're _already_ writing out a node belonging to the inode in question,
and only when any existing snapshot for that inode is old enough that
it's worth writing a new one.
 
> I think the checkpoints shouldn't be created by GC (when it is actually 
> garbage collecting) because of it will decrease the JFFS2 performance. 
> GC is called on some write request when there is no space (excluding the 
> situation when it is called in background by the GC thread). This, it is 
> bad to load GC by additional work of creating checkpoints since it is 
> long enough process....
> 
> What do you think?

Hmmm. Maybe. But we can write a checkpoint node when we GC a previous
checkpoint node perhaps? And we can still write checkpoint nodes when
appropriate from the actual JFFS2 write routines.

-- 
dwmw2
