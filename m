Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16T40A-0007fi-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 16:42:26 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <173a01c1a356$e3ed01c0$1900000a@v.vmanage.com> 
References: <173a01c1a356$e3ed01c0$1900000a@v.vmanage.com> 
To: "Gad Hayisraeli" <gad@syete.co.il>
Cc: "Linux-mtd List" <linux-mtd@lists.infradead.org>
Subject: Re: BSE MediaEngine - booting from flash problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 22 Jan 2002 16:53:27 +0000
Message-ID: <16324.1011718407@redhat.com>
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

gad@syete.co.il said:
> i'm using mediaEngine with bank0 of 4 mb, and bank 1 of 16 mb flash.
> kernel: 2.4.17-rmk2-bse patch to support mediaEngine. but when the
> kernel boots(nfs boot), i see it recognizes only the first flash bank.
> what shall i do in order to recognize also the second ? (i tried to
> alter sa1100-flash.c partitions but no use.)

You probably need to add another 'map' driver for the second bank, then 
probe and register the flash device(s) in that separately. 

--
dwmw2
