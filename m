Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCLat-0001GQ-2s
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 13:16:56 -0400
Message-ID: <41599C42.4030507@yandex.ru>
Date: Tue, 28 Sep 2004 21:15:46 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <41595913.4040007@yandex.ru>	
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>	
	<41596471.5020108@yandex.ru>	
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>	
	<41596913.6080207@yandex.ru>	
	<1096379132.30942.66.camel@hades.cambridge.redhat.com>	
	<41596DDC.3000506@yandex.ru>	
	<1096380254.30942.77.camel@hades.cambridge.redhat.com>	
	<1096381863.17956.12.camel@weaponx.rchland.ibm.com>	
	<41597985.3080803@yandex.ru>	
	<1096383492.30942.83.camel@hades.cambridge.redhat.com>	
	<415995EC.8010004@yandex.ru>
	<1096390699.30942.110.camel@hades.cambridge.redhat.com>
In-Reply-To: <1096390699.30942.110.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 an nodes checking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



David Woodhouse wrote:
> Yeah, but we _know_ we're going to write to the flash when we write to
> regular files. That's not necessarily intuitively true for FIFOs. You
> expect your data to get to the other end of the FIFO... you don't
> necessarily expect anything to be written to the flash.
 >
Josh Boyer wrote:
 > Fifos don't really hold data, they are just named pipes.  When you write
 > to it, it's mostly handled by the VFS.  The actual data isn't written
 > out by JFFS2.  Except that we have to update st_ctime and st_mtime,
 > which causes more nodes.
Yes.. I thought in contents of the optimization I spoke about and tried 
to understand this problem in that context. I spoke about iget() delay. 
But the FIFO issue is another. Ok, thanks for reply!

David Woodhouse wrote:
 > On NOR we can scribble over the old nodes with the old mtime/ctime. On
 > NAND we can't so we end up with lots of nodes which are _potentially_
 > valid and which all have to be compared.
Josh Boyer wrote:
 > Because you can't directly obsolete a node on NAND flash (and some weird
 > versions of NOR flash as well).  So obsolete nodes are actually written
 > out to flash instead of just flipping a bit in the existing node.

Yes, I must have guess this myself. :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
