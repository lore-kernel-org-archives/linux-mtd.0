Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uG6z-0002YD-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 17:01:21 +0100
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14uG6Y-00008h-00
	for mtd-list@infradead.org; Mon, 30 Apr 2001 17:00:54 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14uG6X-00008b-00
	for mtd@infradead.org; Mon, 30 Apr 2001 17:00:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <004f01c0d188$4688c5e0$88b4b8d1@ShuhIII> 
References: <004f01c0d188$4688c5e0$88b4b8d1@ShuhIII>  <21813.988381415@redhat.com> 
To: "Shuh C. Chang" <schang@3inet.com>
Cc: mtd@infradead.org
Subject: Re: Is DOC Address 0xC8000 Something Special? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 30 Apr 2001 17:00:31 +0100
Message-ID: <2494.988646431@redhat.com>
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

schang@3inet.com said:
>  I would like to ask the developers in this list if any of you have
> ever experienced a DiskOnChip (DOC) problem not being recognized at
> address 0xC8000 ONLY by docprobe. 

There's probably something on your system board mapped at 0xC8000 which 
conflicts with the DiskOnChip at that address.

I'm confused by the observed difference between the behaviour of the two 
eval boards, though. Can you try the timing changes suggested by David 
Griffith a few days ago?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
