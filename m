Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CETju-0008RX-Lj
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 10:23:02 -0400
Message-ID: <41615C97.9080800@yandex.ru>
Date: Mon, 04 Oct 2004 18:22:15 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jdub@us.ibm.com>
References: <416122A1.4060302@oktetlabs.ru>	
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>	
	<4161379C.3070109@oktetlabs.ru>	
	<1096893405.22034.9.camel@weaponx.rchland.ibm.com>	
	<41614F6B.6050802@yandex.ru>	
	<1096897195.22034.23.camel@weaponx.rchland.ibm.com>	
	<4161568D.3060605@oktetlabs.ru> <416158D4.4050903@yandex.ru>
	<1096899449.22034.28.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1096899449.22034.28.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Ok, good point.  #ifdefs are evil :).  But maybe the functions to access
> them could be commonly named with different implementations depending on
> the config options.  I'm thinking along the lines of how the wbuf stuff
> is handled for NOR in os-linux.h.
> 
> Or maybe that doesn't make sense.  I think I should just wait and see
> what you come up with :).
> 

Yes, I'm fully agree. I believe It would be rather easy to add NOR ICPs if
the NAND ICPs were implemented :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
