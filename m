Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159jgp-0000Sy-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 09:38:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D99549E@mail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D99549E@mail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: Purpose of sync() function 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Jun 2001 09:43:43 +0100
Message-ID: <6352.992335423@redhat.com>
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


fgiasson@mediatrix.com said:
>   I have not implemented the sync() function, because looking at
> others drivers it doest not seem to do anything useful.  Can anyone
> tell me if I am right or wrong, and what should be the purpose of the
> sync function^ 

The sync function should wait for all pending erases to complete. As 
nobody's actually implemented asynchronous erases yet - all the erase 
functions block and call the callback before returning, this is a NOP in 
all current drivers.

--
dwmw2
