Received: from web40106.mail.yahoo.com ([66.218.78.40])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BjECm-0002fF-Cv
	for linux-mtd@lists.infradead.org; Sat, 10 Jul 2004 05:31:37 -0400
Message-ID: <20040710093131.56688.qmail@web40106.mail.yahoo.com>
Date: Sat, 10 Jul 2004 02:31:31 -0700 (PDT)
From: Mike Wellington <be_a_fanatic@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <200407091608.14442.philt@pioneer-pdt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: JFFS 2 Question
Reply-To: mike@bithead.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Guess I'm the first one to wake up and see this.

Sync "should" work.  Try it and check by doing
 
>  od -x /jffs2 

and then see if your new data is in the dump.

A foolproof way that is overkill - unmout the 
/jffs2 file system and then remount it.  Put 
that pair of commands in a script so you don't 
get tired of typing it.

-mike@bithead.com




-- Patrick Hilt <philt@pioneer-pdt.com> wrote:
> Hi list!
> Is there a way to make sure data is being written to physical flash
> when using 
> JFFS2? In other words, After writing a file on a JFFS2 partition, is
> there 
> anything that can be done to make sure that the data is getting
> written to 
> the flash right away? Would "sync" or "fsync" have that effect?
> 
> Thanks a lot in advance for any input!!!
> 
> Happy weekend,
> 
> Patrick
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
