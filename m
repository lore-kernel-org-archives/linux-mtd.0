Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CETL0-0007ev-Gy
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 09:57:28 -0400
Message-ID: <4161568D.3060605@oktetlabs.ru>
Date: Mon, 04 Oct 2004 17:56:29 +0400
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: Josh Boyer <jdub@us.ibm.com>
References: <416122A1.4060302@oktetlabs.ru>	
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>	
	<4161379C.3070109@oktetlabs.ru>	
	<1096893405.22034.9.camel@weaponx.rchland.ibm.com>	
	<41614F6B.6050802@yandex.ru>
	<1096897195.22034.23.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1096897195.22034.23.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: inode checkpoints
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> 
> I agree that these changes will benefit NAND the most, but they are also
> valuable for all flashes.  
> 
> Say I have a 16 MiB file on my NOR flash.  When a stat or open is done,
> iget is called, which calls readinode, which then goes and reads all the
> nodes off of the flash to build up the inode information.  I've seen
> that take upwards of 2 seconds, just because of the number of data nodes
> that have to be read.
> 
> Now, same situation, but I have a checkpoint node out there.  I don't
> have to read _all_ the data nodes because the checkpoint gives me a
> snapshot of at least some of them, right?
> 
> Or maybe I am extending your idea a bit further than what you
> intended...
> 
> josh
> 
You are right in general. I would like to say that the NAND ICPs idea is 
*superset* for NOR ICP idea, not vice versa... (ICP=inode check point)

But I believe the NOR ICPs shouldn't be implemented together with NAND 
cips since NOR ICPs are much simpler. For example, the need bych simpler 
data structures, algorithms, etc. I dont think it is a good Idea to have 
hunderds of #ifdefs ...

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
