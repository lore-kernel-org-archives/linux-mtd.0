Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AWMg-0007tk-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 14:41:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EFEAIMDCOOOHIEPHDNFJCEMIDPAA.stefan.roese@esd-electronics.com> 
References: <EFEAIMDCOOOHIEPHDNFJCEMIDPAA.stefan.roese@esd-electronics.com> 
To: "Stefan Roese" <stefan.roese@esd-electronics.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: SST Flash Support (SST39VF160) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 22 May 2002 14:41:17 +0100
Message-ID: <7988.1022074877@redhat.com>
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

stefan.roese@esd-electronics.com said:
>  OK, I added the defines in jedec_probe.c, but I can't get linux to
> use the "jedec_probe_chip()" routine. Even with further debug code,
> this routine doesn't seem to get called :-(. 

Are you calling do_map_probe("jedec_probe",..) from your map driver?

--
dwmw2
