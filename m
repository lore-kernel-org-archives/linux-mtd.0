Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Tr9e-000255-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 21:11:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6DD7@mailse01.axis.se> 
References: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6DD7@mailse01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: "'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>
Subject: Re: How to understand :interleave,numeraseregions and regions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 24 Jan 2002 21:22:33 +0000
Message-ID: <19110.1011907353@redhat.com>
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

jonas.holmberg@axis.com said:
>  I thought that device_type==(buswidth/interleave) even in that case.

No. I've been known to think that occasionally, but I generally get shouted
at because stuff breaks :)

> Is device type X8 or X16 if a 16-bit device is in 8-bit mode? 

X16.

> Buswidth must be interleave*1 bytes in that case, right? 

Yes.



--
dwmw2
