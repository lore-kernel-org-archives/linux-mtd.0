Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgNdn-0000my-II
	for linux-mtd@lists.infradead.org; Fri, 02 Jul 2004 08:59:43 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.60.0407020819380.5155@localhost.localdomain>
References: <Pine.LNX.4.60.0407020819380.5155@localhost.localdomain>
Content-Type: text/plain
Message-Id: <1088773179.14216.4373.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 02 Jul 2004 13:59:39 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: adding cmd-line partitioning to rpxlite.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-07-02 at 08:26 -0400, Robert P. J. Day wrote:
> these name values have embedded spaces.  how exactly does that work in 
> trying to use command-line partitioning here?  or did i misread how to
> specify the <mtddef> field on the the command line?
> 
> or, to be more brief, how would one use command-line partitioning for 
> lubbock-flash.c?  i'm going to do a more careful re-reading of 
> cmdlinepart.c to see what i missed.  thanks.

I don't know if or how it work. Perhaps there's a way to escape stuff on
the command line, or perhaps it just doesn't work.

-- 
dwmw2
