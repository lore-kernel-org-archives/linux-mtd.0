Received: from sphere.barak.net.il ([212.150.48.98])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16T4cI-0007ih-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 17:21:50 +0000
Message-ID: <176701c1a36a$be8df600$1900000a@v.vmanage.com>
Reply-To: "Gad Hayisraeli" <gad@syete.co.il>
From: "Gad Hayisraeli" <gad@syete.co.il>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Linux-mtd List" <linux-mtd@lists.infradead.org>
References: <173a01c1a356$e3ed01c0$1900000a@v.vmanage.com>  <16324.1011718407@redhat.com>
Subject: Re: BSE MediaEngine - booting from flash problems 
Date: Tue, 22 Jan 2002 19:32:19 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

could you please add more details , and examples ?
i never did this map before ...

Gad
----- Original Message ----- 
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Gad Hayisraeli" <gad@syete.co.il>
Cc: "Linux-mtd List" <linux-mtd@lists.infradead.org>
Sent: Tuesday, January 22, 2002 6:53 PM
Subject: Re: BSE MediaEngine - booting from flash problems 


> 
> gad@syete.co.il said:
> > i'm using mediaEngine with bank0 of 4 mb, and bank 1 of 16 mb flash.
> > kernel: 2.4.17-rmk2-bse patch to support mediaEngine. but when the
> > kernel boots(nfs boot), i see it recognizes only the first flash bank.
> > what shall i do in order to recognize also the second ? (i tried to
> > alter sa1100-flash.c partitions but no use.)
> 
> You probably need to add another 'map' driver for the second bank, then 
> probe and register the flash device(s) in that separately. 
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
