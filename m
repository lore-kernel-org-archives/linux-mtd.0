Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15l4YO-0000yW-00
	for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2001 09:23:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010922160958.5797.qmail@qis> 
References: <20010922160958.5797.qmail@qis> 
To: "Nikolai Vladychevski" <niko@isl.net.mx>
Cc: linux-mtd@lists.infradead.org
Subject: Re: nftl driver 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 23 Sep 2001 09:32:08 +0100
Message-ID: <20004.1001233928@redhat.com>
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

niko@isl.net.mx said:
>  If this problem of writing zeros  is due to the module unloading
> problem, how can I solve it if the driver is  in the kernel and cant
> be reloaded? 

Almost certainly. The driver has lots if internal state about the old NFTL
format cached, and you've gone and changed it all. You should never need to
use nftl_format. If you want new data, just write new data to /dev/nftla. 
You don't need to do a low-level format just to change the data.

--
dwmw2
