Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16NwX8-0003bP-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jan 2002 13:43:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB8406554B24@srvmail-mtl.montreal.ubisoft.org> 
References: <9A1957CB9FC45A4FA6F35961093ABB8406554B24@srvmail-mtl.montreal.ubisoft.org> 
To: Patrick Allaire <pallaire@gameloft.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to Sync properly ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 08 Jan 2002 13:54:09 +0000
Message-ID: <24417.1010498049@redhat.com>
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

pallaire@gameloft.com said:
> I have been told :

> >>> [...] You have to write a complete 8-byte page at a time. You cannot
> write (for example 2 bytes of a page and then write the other 6-bytes
> later) - this hangs up the state machine. [...] <<<

> Is this true ? is there a work around to use properly ST flash ?
> because INTEL flash cost us the double ! 

I don't know - I haven't seen any information about these chips. It 
wouldn't surprise me. It's a shame it's 8 bytes not 4 - 4 would be fine for 
JFFS2. A page size of 8 bytes means you have to change the padding to 8 
bytes, or do the write-behind buffering that we're planning for NAND 
support anyway.

--
dwmw2
