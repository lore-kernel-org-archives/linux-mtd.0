Received: from ip10.savigear.adsl.gxn.net ([195.147.222.170] helo=xerp.secret.org.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1879JK-0002ah-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2002 07:00:10 +0000
From: Simon Evans <spse@secret.org.uk>
To: Norm Legare <normlegare@yahoo.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Is AM29F016 CFI-compliant? 
In-reply-to: Your message of "Wed, 30 Oct 2002 19:07:57 PST."
             <20021031030757.2845.qmail@web13405.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 31 Oct 2002 07:30:23 +0000
Message-Id: <E1879mZ-0008Hh-00@spoinky.renegade.org.uk>
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
>Hello,  
>
>I have searched the archives with this question, and someone has asked
>the same question, but no definitive answer could be found.

AM29F016 should work with the jedec_probe driver. It works fine for
me.

>Thanks,
>Norm
>


># RAM/ROM/Flash chip drivers
>#
>CONFIG_MTD_CFI=y
># CONFIG_MTD_JEDECPROBE is not set

CONFIG_MTD_JEDECPROBE=m   (or y)   is needed.

cheers
si
