Received: from web51001.mail.yahoo.com ([206.190.38.132])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CrL8G-0004aO-1K
	for linux-mtd@lists.infradead.org; Wed, 19 Jan 2005 14:04:45 -0500
Message-ID: <20050119190435.12763.qmail@web51001.mail.yahoo.com>
Date: Wed, 19 Jan 2005 11:04:35 -0800 (PST)
From: Vahid Fereydunkolahi <fereydunk@yahoo.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1106160821.26551.548.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: some questions regarding the write operation on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> What you say is true -- the data can be written
> partially. This is true
> for all file systems, and doesn't even need a power
> failure -- if you
> ask them to write a certain amount, they may write
> less than that and
> then return.
> 

Does this mean that even a small write which may
bypass one page, can be written partially?

--vahid 


		
__________________________________ 
Do you Yahoo!? 
The all-new My Yahoo! - What will yours do?
http://my.yahoo.com 
