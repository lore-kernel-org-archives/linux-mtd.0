Received: from vindaloo.ras.ucalgary.ca ([136.159.55.21])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kpJr-00072d-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 16:40:11 +0000
Date: Tue, 12 Mar 2002 09:51:29 -0700
Message-Id: <200203121651.g2CGpTK28931@vindaloo.ras.ucalgary.ca>
From: Richard Gooch <rgooch@ras.ucalgary.ca>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Administrivia. 
In-Reply-To: <15927.1015951511@redhat.com>
References: <200203121640.g2CGeRg28441@vindaloo.ras.ucalgary.ca>
	<200203121605.g2CG54o27683@vindaloo.ras.ucalgary.ca>
	<32074.1015924653@redhat.com>
	<6849.1015949674@redhat.com>
	<15927.1015951511@redhat.com>
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

David Woodhouse writes:
> 
> rgooch@ras.ucalgary.ca said:
> >  Hm. I note that formail tends to look at the From: address, which
> > IMHO is the correct thing to do.
> 
> No. The From address is not the SMTP reverse-path. This message, for
> example, has a From address dwmw2@infradead.org but the SMTP
> reverse-path, to which errors should go, is
> dwmw2@redhat.com. (Unless it goes through the list, in which case
> the reverse-path gets changed to linux-mtd-admin@, so that errors in
> list delivery go to the list admin, not the original sender.)

Um, let me be more clear. If I want to bounce emails which, say, have
a high proportion of high-bit characters (guess why:-), I want them to
go to the From: address (i.e. the original sender), not the list
administrator. I think that's a good thing, since I want to apply the
clue-by-four to the sender, and not the list admin.

And formail looks at the From: address nicely, just the way I like it
:-)

				Regards,

					Richard....
Permanent: rgooch@atnf.csiro.au
Current:   rgooch@ras.ucalgary.ca
