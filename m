Received: from [207.209.118.131] (helo=msi-ex6.ccm.msyscal.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kvnZ-0007cS-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 23:35:18 +0000
Message-ID: <AEA9DCA73595D411A6D4009027DE9C5E019BFA74@MSI-EX6>
From: Vadim Khmelnitsky <VadimK@m-sys.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, Mark Meade
	 <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: UnitSizeFactor of != 1 yet? 
Date: Tue, 12 Mar 2002 15:46:55 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Can you tell where did you get this info from ?
For Millennium 8M Virtual Unit size is always equal to a physical unit size
.

Vadim

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tue, March 12, 2002 2:59 PM
To: Mark Meade
Cc: linux-mtd@lists.infradead.org
Subject: Re: UnitSizeFactor of != 1 yet? 



mark@lakeshoremicro.com said:
>  1) On line 131 of nftlmount.c, ReplUnitTable is accessed before it is
>  allocated, causing an oops message.  

That one should be fixed.

> 2) A freshly formatted DoC Millennium (with doc504.exb firmware)
> returns a  UnitSizeFactor of 0x00. 

Er, as in "Sorry, we don't support UnitSizeFactor 0x00" ?
I don't think that's legal according to the docs I have. Vadim?



--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
