Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pVwK-0000Yg-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 14:54:44 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pVwJ-0000Ya-00
	for mtd@infradead.org; Tue, 17 Apr 2001 14:54:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01041715513200.02005@rob> 
References: <01041715513200.02005@rob>  <002901c0c310$aa21aa80$4d02010a@lrpeople.com> <01041114460500.00396@rob> <19294.987514727@redhat.com> 
To: rob@sysgo.de
Cc: "Alexander Melichenko" <AlexanderM@lrpeople.com>, mtd@infradead.org,
    mark.langsdorf@amd.com
Subject: Re: Elan SC520 - problem with MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Apr 2001 14:54:31 +0100
Message-ID: <20801.987515671@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rob@sysgo.de said:
> On Die, 17 Apr 2001 you wrote:
> > What's the difference between the one in CVS and the one from AMD, other 
> > than the 'interesting' licence on the latter?

>  From a brief look at it, I'd say that it is intended for AMD's
> "Net520" eval board, not the SC520 CDP. The addresses it uses to
> access Flash are not valid on the SC520 CDP, (at least not with the
> configuration established by the General Software BIOS that the board
> comes with).

OK, so the right thing to do would be to import it into CVS with a name 
like 'net520.c' ?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
