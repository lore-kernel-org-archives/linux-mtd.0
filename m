Received: from web9603.mail.yahoo.com ([216.136.129.182])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Cnld-0004Zm-6X
	for <linux-mtd@lists.infradead.org>; Mon, 05 May 2003 22:45:01 +0100
Message-ID: <20030505214515.9459.qmail@web9603.mail.yahoo.com>
Date: Mon, 5 May 2003 14:45:15 -0700 (PDT)
From: Mike Kelly <mgkelly59@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1052160051.2446.18.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: Need help understanding jffs2 mount activity
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- David Woodhouse <dwmw2@infradead.org> wrote:
> The real answer, though, is to simply avoid checking
> all those CRCs at
> mount time, and to postpone the checking till later.
> That's implemented
> in the latest code in CVS -- updating to that should
> give you a fairly
> dramatic improvement, especially if you also
> implement the 'point'
> method in your board's map driver. 
> 
I hate to reveal my lack of knowledge, but what is
this 'point' method? 

thanks,
mike


__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
