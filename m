Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Nagx-000237-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jan 2002 14:23:59 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB84064B0989@srvmail-mtl.montreal.ubisoft.org> 
References: <9A1957CB9FC45A4FA6F35961093ABB84064B0989@srvmail-mtl.montreal.ubisoft.org> 
To: Patrick Allaire <pallaire@gameloft.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to Sync properly ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 07 Jan 2002 14:34:41 +0000
Message-ID: <25494.1010414081@redhat.com>
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
>  Ok, I am using Minix FS ... to minimized space used by the meta data
> (short file name ...)

> What would be the FS suggested to minimize space used ? 

I'd be inclined to modify JFFS2 so that it aligns writes to 8 bytes and 
doesn't mark nodes obsolete. It shouldn't be more more than a one-liner for 
each change, I believe. 

You'll need to make sure your flash chip driver implements writev(). 

--
dwmw2
