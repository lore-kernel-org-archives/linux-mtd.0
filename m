Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WdtD-000777-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 13:38:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1012571237.21594.8.camel@pcjonashg> 
References: <1012571237.21594.8.camel@pcjonashg>  <1012561603.21481.4.camel@pcjonashg> <29597.1012570470@redhat.com> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: chip drivers 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Feb 2002 13:49:08 +0000
Message-ID: <31144.1012571348@redhat.com>
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
>  Do you mean using two map structures (one for each probe) and just
> let the cfi_probe fill out one of them and jedec_probe the other?

Yes.

> Because I don't think that will work without complex code that calls
> the probes over and over again.

Look at drivers/mtd/maps/ocelot.c. It has two map structures and calls two 
probe functions. 


--
dwmw2
