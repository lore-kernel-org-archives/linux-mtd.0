Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EmRIL-0001H1-B8
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2005 02:43:34 -0500
Message-ID: <439FBEDF.7000506@yandex.ru>
Date: Wed, 14 Dec 2005 09:42:39 +0300
From: Artem Bityutskiy <dedekind@yandex.ru>
MIME-Version: 1.0
To: "zhao, forrest" <forrest.zhao@intel.com>
References: <439C33D2.506@yandex.ru>	
	<1134367675.3152.9.camel@localhost.localdomain>	
	<439D5159.4030704@yandex.ru>	
	<1134455209.7346.12.camel@localhost.localdomain>	
	<20051213114752.GA9165@angel.research.nokia.com>
	<1134545396.27194.11.camel@localhost.localdomain>
In-Reply-To: <1134545396.27194.11.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>, tglx@linutronix.de,
	Jarkko Lavinen <jarkko.lavinen@nokia.com>
Subject: Re: JFFS2 CVS broken after 2005/11/14
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao, forrest wrote:

>Hi, Artem
>
>I would change the mail subject to avoid the confusion.
>
>I did a lot of regression test today.......
>1 I checked in the EBH patch on 2005/11/04, so I checked out
>CVS snapshot of 2005/11/05. It works very well.
>2 I checked in the 1:1 mapping patch on 2005/11/11, so I checked
>out CVS snapshot of 2005/11/12. It works very well.
>3 I checked out CVS snapshot of 2005/11/13. It works very well.
>4 I checked out CVS snapshot of 2005/11/14. There're error 
>messages like the below posted by Jarkko.
>  
>
Actually even without that patch JFFS2 doesn't work. I don't know which 
regression tests you did, but JFFS2 fails to do simle a thing:

mount
copy a file
unmount
mount

and it is reproducable on nandsim.

Artem.
