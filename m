Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCIBU-0006QD-Mx
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 09:38:28 -0400
Message-ID: <41596913.6080207@yandex.ru>
Date: Tue, 28 Sep 2004 17:37:23 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <41595913.4040007@yandex.ru>	
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>	
	<41596471.5020108@yandex.ru>
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>
In-Reply-To: <1096377761.30942.58.camel@hades.cambridge.redhat.com>
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
> On Tue, 2004-09-28 at 17:17 +0400, Artem B. Bityuckiy wrote:
> 
>>Ok. But what if we check only last node (with the highest version) and 
>>if it is OK, don't check anything more? If it is bad, check previous, 
>>and so on. It seems for me, these checks are enough. We cover the 
>>situation with unexpected power losses.
> 
> 
> There's no reason to presume that the only node with broken CRC will be
> the _latest_ node, especially on NAND flash.
> 
If this isn't last node, the reason is media errors. And it isn't JFFS2 
deal to restore data. Moreover, this isn't guarantied in the current 
implementation - the previous node(s) may have been already Garbage 
Collected.

Another possibility is to teach the GC not to delete obsolete nodes for 
not yet checked inodes. And the fall-back procedure must be done if the 
bad node is read after the file was opened but its data wasn't checked 
(iput() and iget() again).

Comments?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
