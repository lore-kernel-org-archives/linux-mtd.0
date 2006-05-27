Received: from lilzmailso02.liwest.at ([212.33.55.24])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fjw5v-0008JP-F9
	for linux-mtd@lists.infradead.org; Sat, 27 May 2006 06:32:38 -0400
Message-ID: <447824AC.8080501@soft.uni-linz.ac.at>
Date: Sat, 27 May 2006 12:06:36 +0200
From: Simon Vogl <vogl@soft.uni-linz.ac.at>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <E76D631A87C2874E895D1639A1CEDB962AF95B@aae-exchange.aaesys.com>	<1147822363.30771.10.camel@shinybook.infradead.org>	<c0c067900605171450u3bbd5292sf61341527d5040e3@mail.gmail.com>	<446ED4ED.80704@soft.uni-linz.ac.at>
	<1148719386.5239.125.camel@localhost.localdomain>
In-Reply-To: <1148719386.5239.125.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Dan Merillat <harik.attar@gmail.com>, Jayasri Sangu <JayasriS@aaesys.com>
Subject: Re: Intel P30 flash support MTD 2.4.16 kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,

>>I found out this minute that this could apply to my pxa271 core (with 
>>on-chip p30 flash!)
>>as well - it reports the sim.op. bit, while the data sheet says no. 
>>Could you tell me what your
>>symptoms were, and your cure (a code snippet, preferrably)?
>>    
>>
>
>The real cure is to replace the chips by working ones. The hack is to
>  
>
I would love to do that, but the flash is wire-bonded to the processor 
in a single package -
My nano-manipulators are on repair at the momen ;)

>mask out the simultaneous ops bit when reading the CFI features.
>
>  
>
Tried that, but did not cure the whole problem: The chip reports read 
errors when accessing certain
addresses (above 0x1000000, i get that ominous 0x00080 reads...). I 
recieved another sample board,
will try if this problem persists  (as a side note: u-boot can access 
the chip perfectly well... )
Simon

>	tglx
>  
>
