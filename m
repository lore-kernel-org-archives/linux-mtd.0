Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181P4L-0006yT-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 11:36:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200210151025.g9FAP9221781@localhost.localdomain> 
References: <200210151025.g9FAP9221781@localhost.localdomain>  <200210030816.g938GaW03616@localhost.localdomain> <19345.1034676569@passion.cambridge.redhat.com> 
To: Clive Davies <cdavies@altera.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] add access to AMD secure silicon area 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 Oct 2002 11:36:44 +0100
Message-ID: <26135.1034678204@passion.cambridge.redhat.com>
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

cdavies@altera.com said:
>  It should be, it matches the command sequence in the data sheet for
> the  AM29DL322D/323D/324D devices.  

And CFI_DEVICETYPE_X8 is always correct? No X16 devices?

>  Unfortunately not. There's no mention of it at all in the AMD primary
> vendor  specific extended query table v1.1 which is used on these
> devices. I don't  like this method either but in the absence of CFI
> info I don't have any  better ideas.

Argh. FFS. So AMD can't manage to get the fscking erasesize table correct 
in the CFI data, and they can't manage to add the appropriate fields to 
their own vendor-specific table to remove the need to keep the device ID 
tables which CFI was supposed to eliminate?

Would someone from AMD care to either contradict me or promise me 
faithfully that they've taken a baseball bat to whoever is responsible?

I suspect we need a new 'amd_is_bloody_stupid_probe' alongside jedec_probe 
and cfi_probe :)

--
dwmw2
