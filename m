Received: from ip10.savigear.adsl.gxn.net ([195.147.222.170] helo=xerp.secret.org.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18XoTA-0005QC-00
	for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2003 20:12:32 +0000
From: spse@secret.org.uk
To: Federico Ferreres <fferreres@arrancar.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 on block devices 
In-Reply-To: Message from Federico Ferreres <fferreres@arrancar.com>
   of "12 Jan 2003 17:22:05 -0300." <1042402929.12878.10.camel@tp>
References: <1042352498.1998.19.camel@tp> <13805.1042363286@passion.cambridge.redhat.com>  <1042402929.12878.10.camel@tp> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 12 Jan 2003 20:43:22 +0000
Message-Id: <E18Xox1-0004qA-00@spoinky.renegade.org.uk>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

>I am using the kernel version and mount time is about 15 minutes on this
>celeron 433. After mounting, speed and reliability are great. I'll test
>the CVS version today and report back!
>


If you are going to use the latest blkmtd from CVS it *should* be ok 
but note that the only testing I have done on it is to have two
devices mounted (80Meg file via loopback and 80mb disk partition)
then do a loop of 30 kernel rebuilds (with -j2) in parallel
(takes about 24 hours on my laptop)

I would definitely advise that you make a backup of your jffs2 file
somewhere as Im not sure the latest code has been that well tested by
others.


>Regards,
>
>Federico

cheers
si
