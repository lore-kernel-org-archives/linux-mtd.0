Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eMGX-00052k-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 21:58:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200208111908.06874.mtd@mcmen.demon.co.uk> 
References: <200208111908.06874.mtd@mcmen.demon.co.uk> 
To: adr <mtd@mcmen.demon.co.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Help with Dreamcast flash devices 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 12 Aug 2002 21:58:15 +0100
Message-ID: <18431.1029185895@redhat.com>
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

mtd@mcmen.demon.co.uk said:
>  Well, the long and the short of it is that I am somewhat at sea here.
> Are  there any similar mtd devices I can look at?

> Is there an explanation anywhere of how mapping works and how to
> 'virtual' map  something which isn't in the physical map at all? 

Your map functions must read and write words to the flash, and provide 
methods for copying chunks of data from the flash. That's about it.

They may not sleep. Is that a problem?

--
dwmw2
