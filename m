Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 154orY-0006yl-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 May 2001 20:09:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D995470@mail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D995470@mail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Found a potential bug in MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 29 May 2001 20:13:13 +0100
Message-ID: <32239.991163593@redhat.com>
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
> 
> 	Maybe but the actual code does not work if you specify a 1x16
> geometry with an actual single 16 bits chip on the memory bus.

For CFI chips, I believe it works. The Compaq iPAQ 31xx series have 
precisely this arrangement.

I'm interested to know whether it's the CFI probe or the JEDEC probe which 
is working on your device. Please could you make it print the contents of 
cfi->cfi_mode after detecting the chip?



--
dwmw2
