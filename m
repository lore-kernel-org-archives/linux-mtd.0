Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ARr6-0007ST-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 09:52:24 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EFEAIMDCOOOHIEPHDNFJOEMCDPAA.stefan.roese@esd-electronics.com> 
References: <EFEAIMDCOOOHIEPHDNFJOEMCDPAA.stefan.roese@esd-electronics.com> 
To: "Stefan Roese" <stefan.roese@esd-electronics.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: SST Flash Support (SST39VF160) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 22 May 2002 09:52:22 +0100
Message-ID: <27222.1022057542@redhat.com>
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
> SST flash need a three byte write sequence (no one), to enter the cfi
> query mode!

> 5555 <- aa 2aaa <- 55 5555 <- 98

 <insert relevant expletives here>

> This does not seem to be CFI compliant!!! 

OK. Add the device ID and size information to jedec_probe.c. That code 
should handle the 55/aa bits already.

--
dwmw2
