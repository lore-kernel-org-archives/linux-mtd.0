Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MXSM-0003fk-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 16:44:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020104085040.A48397@idiom.com> 
References: <20020104085040.A48397@idiom.com>  <E16MWkI-0003Z1-00@pentafluge.infradead.org> 
To: Geoffrey Espin <espin@idiom.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: linux-mtd digest, Vol 1 #323 - 3 msgs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 04 Jan 2002 16:54:52 +0000
Message-ID: <11680.1010163292@redhat.com>
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

espin@idiom.com said:
>  Under linux/drivers/mtd/maps/ you must create your myboard-flash.c
> (and add to Makefile), which has the partition table in it, e.g.: 

Useful explanation, thanks - except that you omitted the step where if it's 
a commonly available board, they should send me the appropriate 
myboard-flash.c too :)

--
dwmw2
