Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCLAx-0000iP-Ef
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 12:50:07 -0400
Message-ID: <415995EC.8010004@yandex.ru>
Date: Tue, 28 Sep 2004 20:48:44 +0400
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
In-Reply-To: <1096383492.30942.83.camel@hades.cambridge.redhat.com>
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

> Yes, he does. The problem is that each time you access a FIFO you update
> its ctime and mtime on the flash... which leads to a _lot_ of nodes,
> only one of which is non-obsolete. That's a problem on NAND flash.

Things are same for regular files. This is from SUSv3 for write() call:

"Upon successful completion, where nbyte is greater than 0, write() 
shall mark for update the st_ctime and st_mtime fields of the file"

This is from SUSv3 fore read() call:

"Upon successful completion, where nbyte is greater than 0, read() shall 
mark for update the st_atime field of the file, and shall return the 
number of bytes read."

What's special with FIFOs ?

Why that's a problem on NAND flash especially ?


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
