Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 186rZW-0000Vw-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 12:03:42 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 186XRc-0005sw-00
	for linux-mtd@lists.infradead.org; Tue, 29 Oct 2002 14:34:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20021027195318.GB4634@wohnheim.fh-wedel.de> 
References: <20021027195318.GB4634@wohnheim.fh-wedel.de>  <5.1.0.14.2.20021023101434.021da080@mail.attbi.com> 
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: Eugene Surovegin <ebs@innocent.com>, linux-mtd@lists.infradead.org
Subject: Re: mtdblock_ro and ext2 yields panic: block not locked 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 29 Oct 2002 14:28:45 +0000
Message-ID: <12338.1035901725@passion.cambridge.redhat.com>
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

joern@wohnheim.fh-wedel.de said:
>  Hmm. David appears to be _very_ unavaillable currently. Does anyone
> know what is causing it? 

Life. :)

The fact that Red Hat have actually been expecting me to _work_ recently 
rather than just playing all the time doesn't help either. I hope to find 
the time to clean up the current CVS and submit it to Linus and Marcelo 
fairly soon, and then I want to merge the new partition code too.

Eugene -- please could you send me a SSH public key; I'll give you an 
account and you can commit the patch. It looked sane to me IIRC and if you 
commit it yourself I know who to blame anyway if it's not :)

--
dwmw2
