Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCJHK-0007bl-Ix
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 10:48:34 -0400
Message-ID: <41597985.3080803@yandex.ru>
Date: Tue, 28 Sep 2004 18:47:33 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jdub@us.ibm.com>
References: <41595913.4040007@yandex.ru>	
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>	
	<41596471.5020108@yandex.ru>	
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>	
	<41596913.6080207@yandex.ru>	
	<1096379132.30942.66.camel@hades.cambridge.redhat.com>	
	<41596DDC.3000506@yandex.ru>	
	<1096380254.30942.77.camel@hades.cambridge.redhat.com>
	<1096381863.17956.12.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1096381863.17956.12.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 an nodes checking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Yes, large files are bad, but aren't the only source of such a time
> delay.  IIRC, the problem is really just a matter of the number of nodes
> per file.  So couldn't you have a small file with a large number of
> writes within that file that has the same effect?  (Until the obsoleted
> nodes are actually deleted that is.)
> 
> I'm thinking of fifos here too...
> 
> josh
> 

I suppose you don't mean the Unix FIFO file type (like block device, 
socket, etc).

Yes, if we have a file with a lot of small nodes, we will read node 
headers anyway.
This case won't be optimized very much if we don't check the data CRC.

But after the GC process this file will be optimized and split on 4K 
pieces :-)


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
