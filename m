Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bc7H-0005JJ-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 06:45:07 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <614CC7C21856D1118DA30060B06B487302ACC8D0@SMF-NT-MAIL1> 
References: <614CC7C21856D1118DA30060B06B487302ACC8D0@SMF-NT-MAIL1> 
To: Eric Nelson <eric_n2@verifone.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Alternate to DOC?? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 15 Feb 2002 06:49:56 +0000
Message-ID: <17310.1013755796@redhat.com>
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

eric_n2@verifone.com said:
> We would very much like to use JFFS2 on a project.  However, most
> boards have either CF or DOC.  My understanding of JFFS2 on DOC is
> that you disable the controller on the DOC, and just use the flash.

No, you can use the controller. All it does is ECC. The NFTL stuff was all 
done in software anyway.

> Now, wouldn't it be a good idea for someone to build a device w/ same
> footprint as DOC, but w/ just raw flash?  Maybe we could do this.
> Would this impinge on some patent by M-Systems?  It would make it a
> lot easier for us to use JFFS2 if we could do this. 

The socket and pin layout are standard, I believe. There's no problem with 
making an alternative device to fit.

--
dwmw2
