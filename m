Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MXRX-0003fL-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 16:43:43 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB8406456E99@srvmail-mtl.montreal.ubisoft.org> 
References: <9A1957CB9FC45A4FA6F35961093ABB8406456E99@srvmail-mtl.montreal.ubisoft.org> 
To: Patrick Allaire <pallaire@gameloft.com>
Cc: =?iso-8859-1?Q?Bj=F6rn_Eriksson?= <mdeans@algonet.se>,
    linux-mtd@lists.infradead.org
Subject: Re: From 2.4.9 to CVS ??? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 04 Jan 2002 16:54:27 +0000
Message-ID: <11638.1010163267@redhat.com>
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

pallaire@gameloft.com said:
>  No I dont have 'bad cramfs magic' !!! I tought it could be the case
> ... but I looked at the mkcramfs.c from the 2.4.9 and 2.4.17 version
> and there is no difference So the generated code should be the same. 

P'raps we started paying attention to execute bits on libraries between 
2.4.9 and 2.4.17? I thought we did that a long time ago though. 

Put a statically linked shell in the cramfs and boot with that as init. 
Then try running /sbin/init and see what errors you get.


--
dwmw2
