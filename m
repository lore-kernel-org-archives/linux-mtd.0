Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Barkl-0003cM-4I
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2004 03:56:09 -0400
Received: from yandex.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 70EAB2288A
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Jun 2004 11:56:00 +0400 (MSD)
Message-ID: <40D14E90.5080308@yandex.ru>
Date: Thu, 17 Jun 2004 11:56:00 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <40CD76C2.1080007@inf.u-szeged.hu> <40CDACF2.5040502@yandex.ru>
	<34463.160.114.55.5.1087282322.squirrel@webmail.inf.u-szeged.hu>
In-Reply-To: <34463.160.114.55.5.1087282322.squirrel@webmail.inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: (NAND) JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Frank. Thanks for reply.

Ferenc Havasi wrote:
> About our idea/plan: we would like to modify the mkfs and umount porcess
> to store some extra information (inode_cache). At booting time it is
> enough to read this information to serve the read requests, and the full
> scan process can be done in the background. Write requestes should be
> blocked until this background process finished. If I am right handeld
> devices (but at least the Familiar distribution) uses RAM filesystem for
> /tmp and /var, so the boot process hopefully does not require write
> access.
> 
> Certainly, if this information cannot be found or not valid (there was no
> umount) the original slow full scan method should be processed.
> 
> One possible idea to store this information can be to introduce new types
> of node (with JFFS2_FEATURE_RWCOMPAT_DELETE bitmask). One type to store
> the real information (inode_cache) and an other which is stored on the
> first erase block and contains direct pointers to the previous kind of
> nodes/its eraseblocks. (make it easy for the mount process to find them)
> 
> What are your ideas? Did you tried out them?
> 
> We did not tried this yet, but I hope it is feasable. (David?)
> 
> Regards,
> Ferenc
> 
Very short description of my idea:

I thought about introducing special node type (say, raw_blkdescr) which 
should appear at the beginning of each block and describes some other 
block's layout. The process of writing will be like this: we write node 
on one block and simultaneously write it's description to some another 
free block.

When mounting, we just scan beginnings of flash blocks and construct 
inode_caches. After that we can read/write. Full scan goes in background.

I didn't try this too. More over, this is just an idea for now - I'm not 
even sure that such algorithm is feasible yet.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
