Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kpRi-00073P-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 16:48:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200203121651.g2CGpTK28931@vindaloo.ras.ucalgary.ca> 
References: <200203121651.g2CGpTK28931@vindaloo.ras.ucalgary.ca>  <200203121640.g2CGeRg28441@vindaloo.ras.ucalgary.ca> <200203121605.g2CG54o27683@vindaloo.ras.ucalgary.ca> <32074.1015924653@redhat.com> <6849.1015949674@redhat.com> <15927.1015951511@redhat.com> 
To: Richard Gooch <rgooch@ras.ucalgary.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Administrivia. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Mar 2002 16:59:35 +0000
Message-ID: <17407.1015952375@redhat.com>
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

rgooch@ras.ucalgary.ca said:
>  Um, let me be more clear. If I want to bounce emails which, say, have
> a high proportion of high-bit characters (guess why:-), I want them to
> go to the From: address (i.e. the original sender), not the list
> administrator. I think that's a good thing, since I want to apply the
> clue-by-four to the sender, and not the list admin.

> And formail looks at the From: address nicely, just the way I like it
> :-) 

In that case, it makes some sense, yes. Unless you also obey Reply-To and 
encounter a list which stupidly sets the Reply-To header to go back to the 
list - another common combination of idiocies.

As long as you don't respond to messages with _NULL_ reverse-path (i.e. 
error messages), that is.

--
dwmw2
