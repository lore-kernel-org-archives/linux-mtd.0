Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CF7mo-0006II-QJ
	for linux-mtd@lists.infradead.org; Wed, 06 Oct 2004 05:08:42 -0400
Message-ID: <4163B5E3.7070201@yandex.ru>
Date: Wed, 06 Oct 2004 13:07:47 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jdub@us.ibm.com>,
	David Woodhouse <dwmw2@infradead.org>
References: <416122A1.4060302@oktetlabs.ru>	
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>	
	<416127B7.3070505@yandex.ru>	
	<1096893242.22034.5.camel@weaponx.rchland.ibm.com>	
	<41614B2F.8060901@yandex.ru>	
	<1096895892.30942.614.camel@hades.cambridge.redhat.com>	
	<41615BA7.60801@yandex.ru>	
	<1096899817.30942.618.camel@hades.cambridge.redhat.com>	
	<4162AABC.9060809@yandex.ru>	
	<1096994744.30942.905.camel@hades.cambridge.redhat.com>
	<1096996838.24013.3.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1096996838.24013.3.camel@weaponx.rchland.ibm.com>
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

>>>May be we create ICP during GC process, or on iget() call, or on
>>>iput() call? But I have arguments against these...
>>
>>I was thinking of doing it during a normal write to the file, or during
>>garbage collection of a node belonging to the file.
>>
>>But I think we can play with ideas on _when_ to call this once you've
>>actually implemented the functions which does it :)
> 
> 
> Right.  Lots of places it could be done.  Start with one and work from
> there :).
> 
Ok, I got it. I'll try to keep in my mind the possibility to call the 
checkpoint creation function from different places.

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
