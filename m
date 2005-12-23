Received: from web26305.mail.ukl.yahoo.com ([217.146.176.16])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EpkDI-0007IS-HY
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2005 05:31:57 -0500
Message-ID: <20051223103150.72407.qmail@web26305.mail.ukl.yahoo.com>
Date: Fri, 23 Dec 2005 10:31:50 +0000 (GMT)
From: Sreecharan Sivadevuni <mailsreecharan@yahoo.co.uk>
To: linux-mtd@lists.infradead.org
In-Reply-To: <43ABB749.40709@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Re: JFFS2 doesn't detect end of space on flash device instead
	breaks kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
         the kernel I am using is uClinux-2.4.24 and
JFFS2 I am using is version 2.1. It look like my
kernel doesnot support JFFS2 v2.2. I tried to
integrate it but it gives me lot of compilations
errors. 

Thanks
Sreecharan

Thanks
Sreecharan.S


--- "Artem B. Bityutskiy" <dedekind@yandex.ru> wrote:

> Sreecharan Sivadevuni wrote:
>  > Hello,
>  >       The JFFS2 on my flash doesnot report back
> to me
>  > end of space on my flash, instead I get a kernel
> oops
>  > message and sometimes the kernel hangs. This is
> when I
>  > am trying to copy a file which is of larger size
> than
>  > there is space on device.
> Hmm, looks like a bug.
> 
> Could you please enable JFFS2 debugging and send the
> output?
> Which kernel? Which JFFS2? Try the latest please.
> 
> Thanks.
> 
> -- 
> Best Regards,
> Artem B. Bityutskiy,
> St.-Petersburg, Russia.
> 



		
___________________________________________________________ 
Yahoo! Exclusive Xmas Game, help Santa with his celebrity party - http://santas-christmas-party.yahoo.net/
