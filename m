Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QJUX0-0004GQ-Up
	for linux-mtd@lists.infradead.org; Mon, 09 May 2011 17:46:07 +0000
Message-ID: <4DC8272F.5040908@wi.rr.com>
Date: Mon, 09 May 2011 12:41:03 -0500
From: Rick Johnson <rick22@wi.rr.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: read_pnode: error -22 reading pnode at XX:YYYYY
References: <4DADF9E6.9010709@wi.rr.com>	 <1303392001.2757.16.camel@localhost>
	<4DC31183.8060807@wi.rr.com> <1304706750.7222.95.camel@localhost>
In-Reply-To: <1304706750.7222.95.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> I do not know by heart, but I think cnext is about the list of nodes
> which should be written to the flash at the next commit. So if ->cnext
> == ->parent this means that our parent is the next in the list. Hmm, and
> I think we dirty nodes in the LPT tree from the bottom up to the root,
> and add them to the commit list (cnext), so cnext == parent should be
> very common.
> 
> But in 'read_pnode()' cnext must be NULL, I think.

That makes sense with what we're seeing.


> Anyway, as I said, that was not my code, so I myself have difficulties
> to deal with it. I asked Adrian to help  - may be he'll take a look at
> this if he has time.

Thank you for passing the word along.

> Sure. I hope you'll nail this. How well is it reproducible? Can you
> reproduce this on nandsim which has equivalent characteristics (PEB
> size, page size, count of PEBs) ?

This is real tough to reproduce.  It happens just enough to give us 
trouble.  We haven't tried nandsim before, but I'll see if we can get 
that going.

Thanks again.

Rick
