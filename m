Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GLJY-0000QO-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 15:38:24 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3DE24AA0.9040106@WirelessNetworksInc.com> 
References: <3DE24AA0.9040106@WirelessNetworksInc.com>  <E18243X-0002eo-00@pentafluge.infradead.org> 
To: Herman Oosthuysen <Herman@WirelessNetworksInc.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 Config / FAQ 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 25 Nov 2002 16:08:51 +0000
Message-ID: <4170.1038240531@passion.cambridge.redhat.com>
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

Herman@WirelessNetworksInc.com said:
>  Stupid question of the month: I need to know how many blocks to leave
> for the GC at a minimum.

> One?

There's a reason it's not configurable. Reducing it from its current value 
would require significant effort in fixing the corner cases where the file 
system expands, and then _proving_ it to be correct.


--
dwmw2
