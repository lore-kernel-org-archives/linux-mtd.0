Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CESa1-0006VH-If
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 09:08:45 -0400
Message-ID: <41614B2F.8060901@yandex.ru>
Date: Mon, 04 Oct 2004 17:07:59 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jdub@us.ibm.com>
References: <416122A1.4060302@oktetlabs.ru>	
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>	
	<416127B7.3070505@yandex.ru>
	<1096893242.22034.5.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1096893242.22034.5.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Can we extend this to be "files with a large amount of nodes"?  I'm
> thinking of the fifo problem here too...
>
:-)
FIFOs, blk/chr dvice files *always have only one valid node at a time* 
(right?). Thus, when building the inode cache, we may only read the node 
with the highest version (which is found by scanning the correspondent 
node_ref list) and read *only* this node. If it is OK (CRC is right), no 
need to read more. If CRC is bad, read the older one...  Checkpoints 
aren't needed, this is *another* improvement...

How about this scheme?

> 
> eCos doesn't have a GC thread IIRC.  Not a big deal in my opinion, but
> others might care :).
> 
> josh
.....
David Woodhouse:
 > I agree that it shouldn't be left to the GC thread alone -- there isn't
 > one on eCos and it's optional on Linux too.

Hmm, true.
Does eCos support threads (I didn't work with it)? If not, the situation 
is more complicated... I want to use thread (low-priority) in order to 
*not affect the system performance much*.

 >We can write out snapshots
 > in the normal course of garbage collection though, when we have
 > obsoleted a node belonging to the inode in question.
> 
I think the checkpoints shouldn't be created by GC (when it is actually 
garbage collecting) because of it will decrease the JFFS2 performance. 
GC is called on some write request when there is no space (excluding the 
situation when it is called in background by the GC thread). This, it is 
bad to load GC by additional work of creating checkpoints since it is 
long enough process....

What do you think?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
