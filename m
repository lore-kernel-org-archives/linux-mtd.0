Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16c296-0006pp-00
	for <linux-mtd@lists.infradead.org>; Sat, 16 Feb 2002 10:32:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0202161133340.17237-100000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0202161133340.17237-100000@dagobert.svc.sysgo.de> 
To: Robert Kaiser <rob@sysgo.de>
Cc: linux-mtd@lists.infradead.org,
    J?rn Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: MTD concat layer 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 16 Feb 2002 10:43:57 +0000
Message-ID: <24247.1013856237@redhat.com>
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

rob@sysgo.de said:
> OK, just to be clear about this: If my erase function is asked to
> erase -say-  1.5 blocks, what should it do: 

-EINVAL.

--
dwmw2
