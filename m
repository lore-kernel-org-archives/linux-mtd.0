Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CESyA-00074h-Ta
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 09:33:42 -0400
Message-ID: <41615109.7070303@yandex.ru>
Date: Mon, 04 Oct 2004 17:32:57 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <416122A1.4060302@oktetlabs.ru>	
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>	
	<416127B7.3070505@yandex.ru>	
	<1096893242.22034.5.camel@weaponx.rchland.ibm.com>	
	<41614B2F.8060901@yandex.ru>
	<1096895892.30942.614.camel@hades.cambridge.redhat.com>
In-Reply-To: <1096895892.30942.614.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

David Woodhouse wrote:
> On Mon, 2004-10-04 at 17:07 +0400, Artem B. Bityuckiy wrote:
> 
>>FIFOs, blk/chr dvice files *always have only one valid node at a time* 
>>(right?). Thus, when building the inode cache, we may only read the node 
>>with the highest version (which is found by scanning the correspondent 
>>node_ref list) and read *only* this node. If it is OK (CRC is right), no 
>>need to read more. If CRC is bad, read the older one...  Checkpoints 
>>aren't needed, this is *another* improvement...
>>
>>How about this scheme?
> 
> 
> Seems sane.
>
So, this isn't the subject of my improvement. But it is nice we 
discussed this too - somebody could implement this. :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
