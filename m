Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ezHZ-0004jk-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 14:33:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB84044549FE@srvmail-mtl.ubisoft.qc.ca> 
References: <9A1957CB9FC45A4FA6F35961093ABB84044549FE@srvmail-mtl.ubisoft.qc.ca> 
To: Patrick Allaire <pallaire@gameloft.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Now Grub ??? was :RE: lilo and mtd ans doc 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Sep 2001 14:39:26 +0100
Message-ID: <29055.999783566@redhat.com>
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
>  I have in this patch directory some Grub patch ? should I use Grub
> instead ? or do I need both ? 

You don't need both. Grub needs a little more work which should be trivial 
to do - I've had it booting kernels but there's a bug somewhere. 

--
dwmw2
