Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14d7oz-0006id-00
	for mtd-list@infradead.org; Wed, 14 Mar 2001 09:43:57 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14d7oy-0006iX-00
	for mtd@infradead.org; Wed, 14 Mar 2001 09:43:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AAECE2A.D88E0348@mvista.com> 
References: <3AAECE2A.D88E0348@mvista.com> 
To: Alice Hennessy <ahennessy@mvista.com>
Cc: mtd@infradead.org
Subject: Re: cfi_endian.h 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 14 Mar 2001 09:43:48 +0000
Message-ID: <8144.984563028@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ahennessy@mvista.com said:
> What do you think of the idea of making the choice of
> CFI_LITTLE_ENDIAN, CFI_HOST_ENDIAN, CFI_BIG_ENDIAN and CFI_LART_ENDIAN
> configurable so that different boards can setup the driver via
> configuring physmap and not have to touch  the code at all (if they
> don't need to set vpp and just want a single device)?

Has anyone actually needed to use anything other than HOST_ENDIAN yet?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
