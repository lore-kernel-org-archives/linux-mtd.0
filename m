Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14xQlv-0002IL-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 May 2001 11:00:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AF90A9C.E0FE06F2@sis.com.tw> 
References: <3AF90A9C.E0FE06F2@sis.com.tw>  <NEBBIDMHCLDPHDHEGDMLEEHACBAA.jasonw@uswo.net> 
To: Ollie Lho <ollie@sis.com.tw>
Cc: Jason Walker <jasonw@uswo.net>,
    MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: Oddities with MTD/DOC 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 09 May 2001 10:57:21 +0100
Message-ID: <29986.989402241@redhat.com>
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

ollie@sis.com.tw said:
>  It happens a lot. You got two options: 1. replace it with another, 2.
> wait a few days, sometimes it just come back "magically". 

Eep. Complete death of the hardware? That's not good. How can it happen?

I assume that if it's a DiskOnChip Millennium you've tried probing without 
the CONFIG_DOCPROBE_55AA option, in case it's just overwritten the start of 
the flash?

--
dwmw2
