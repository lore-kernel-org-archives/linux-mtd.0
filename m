Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CETAw-0007Sp-K1
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 09:46:56 -0400
Message-ID: <41615422.8060909@yandex.ru>
Date: Mon, 04 Oct 2004 17:46:10 +0400
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

>>I think the checkpoints shouldn't be created by GC (when it is actually 
>>garbage collecting) because of it will decrease the JFFS2 performance. 
>>GC is called on some write request when there is no space (excluding the 
>>situation when it is called in background by the GC thread). This, it is 
>>bad to load GC by additional work of creating checkpoints since it is 
>>long enough process....
>>
>>What do you think?
> 
> 
> Hmmm. Maybe. But we can write a checkpoint node when we GC a previous
> checkpoint node perhaps? And we can still write checkpoint nodes when
> appropriate from the actual JFFS2 write routines.
> 
I have the following reasons why it is bad to include checkpoint 
writings when garbage collecting:

1. If there is no (or few) space and the GC is called, it is better to 
*obsolete* checkpoints, not to create new ones. :-) So, if there are no 
threads, I don't know how to create checkpoints from GC... In this case 
it is better to create them while writing... But this is additional 
delay for write operations...

So, I propose either:
1. Introduce the option which enables the checkpoint support and 
automatically enables the GC thread.
2. Just use distinct thread for checkpoints.

Do you have other ideas?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
