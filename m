Received: from wx-out-0506.google.com ([66.249.82.230])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HwToV-0000M5-B5
	for linux-mtd@lists.infradead.org; Thu, 07 Jun 2007 22:02:59 -0400
Received: by wx-out-0506.google.com with SMTP id h26so592531wxd
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jun 2007 19:02:54 -0700 (PDT)
Message-ID: <4668B8CC.5010702@gmail.com>
Date: Thu, 07 Jun 2007 21:02:52 -0500
From: Nishanth Menon <menon.nishanth@gmail.com>
MIME-Version: 1.0
To: Mathew Chasan <mathew@exbiblio.com>
Subject: Re: newbie needs help getting onenand to work...
References: <79F7EE04-68BE-48FA-986D-77090A9D597B@exbiblio.com>
In-Reply-To: <79F7EE04-68BE-48FA-986D-77090A9D597B@exbiblio.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mathew Chasan stated on 6/7/2007 3:58 PM:
> Basically i have yet to get anywhere.  I've enabled the MTD and  
> OneNand drivers in the kernel  but thats about it.  Interestingly, i  
> don't see any sort of indication that the OneNand drivers are even  
> getting initialized in any way during kernel boot.
>
>   
try the board files.. something like this was done in omap

http://source.mvista.com/git/gitweb.cgi?p=linux-omap-2.6.git;a=blob;h=1e8492a055acfca974eac62a2bd54628b08ece9e;hb=e0e0c1591b129da1246eaa51b91f040f6dfb2a2e;f=arch/arm/mach-omap2/board-2430sdp-flash.c


the memory map method might be different.. u'd need to do what is
required for freescale.
Regards,
Nishanth Menon
