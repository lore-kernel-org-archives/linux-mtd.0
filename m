Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by pentafluge.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CEq4n-0005RX-Qi
	for linux-mtd@lists.infradead.org; Tue, 05 Oct 2004 15:14:03 +0100
Message-ID: <4162AABC.9060809@yandex.ru>
Date: Tue, 05 Oct 2004 18:07:56 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
	Josh Boyer <jdub@us.ibm.com>
References: <416122A1.4060302@oktetlabs.ru>	
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>	
	<416127B7.3070505@yandex.ru>	
	<1096893242.22034.5.camel@weaponx.rchland.ibm.com>	
	<41614B2F.8060901@yandex.ru>	
	<1096895892.30942.614.camel@hades.cambridge.redhat.com>	
	<41615BA7.60801@yandex.ru>
	<1096899817.30942.618.camel@hades.cambridge.redhat.com>
In-Reply-To: <1096899817.30942.618.camel@hades.cambridge.redhat.com>
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

Hello David, Josh. What did we decided about the GC thread?

I offered to create checkpoints from the GC thread. Are there some 
reasons not to do so? There was one - the GC thread isn't always 
enabled. But we may require it be enabled if checkpoints are enabled...

What do you think?

Or may be its better to use distinct thread ?

May be we create ICP during GC process, or on iget() call, or on iput() 
call? But I have arguments against these...

Are there some comments/advices?


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
