Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159jYi-0000Rx-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 09:29:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1010611174219.ZM25884@bristol.st.com> 
References: <1010611174219.ZM25884@bristol.st.com> 
To: Stuart Menefy <Stuart.Menefy@st.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI JEDEC probing 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Jun 2001 09:34:47 +0100
Message-ID: <5321.992334887@redhat.com>
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

Stuart.Menefy@st.com said:
>  Humm, not sure if that makes things clearer or not! What I'm trying
> to say is, four 16 bit devices, on a 32bit data bus, with an
> interleave of 2, mapped into contiguous memory locations. 

Take a look at the patch that Jan Rovins posted on Thursday for the MCPN765 
board. It deals with it in a different way - by acknowledging that what you 
effectively have is a 64-bit bus.

The alternative is to deal with the flash as two entirely separate 32-bit 
pairs, and just have two separate map drivers giving access to even and odd 
words respectively.

I'd like to see the cfi_jedec code removed completely and JEDEC probing put 
in a separate probe function, rather than more special cases added to it.


--
dwmw2
