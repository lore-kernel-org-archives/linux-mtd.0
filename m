Received: from web63403.mail.re1.yahoo.com ([69.147.97.43])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KduZq-0001Jh-NX
	for linux-mtd@lists.infradead.org; Thu, 11 Sep 2008 22:23:51 +0000
Date: Thu, 11 Sep 2008 15:23:49 -0700 (PDT)
From: Fundu <fundu_1999@yahoo.com>
Subject: Re: Flash Mapping and gpio
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0809111438r1cc7228al892edd621d4f4588@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <565805.47147.qm@web63403.mail.re1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: fundu_1999@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > these are on 2.6 kernel. i'm using 2.4.20.
> 
> didnt realize anyone ran ancient cruft like that anymore. 
> big waste
> of time.  g'luck.
it's really not a possibility to port to 2.6 at this time. 
is there anything else that you can point me at, i would much appreciate it.

how about this error 

MTD do_erase_oneblock(): Wacky!  Unable to decode failure status
MTD do_erase_oneblock(): 0x07f40000(0x00ff00ff): 0x27051956 0x27051956 0x27051956 0x27051956

any ideas here, this hasn't changed much. 
i still get these even after backing out my changes that i mentioned in the original post. 

thanks !
fundu 


      
