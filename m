Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159joI-0000Tk-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 09:46:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1010611181131.ZM26024@bristol.st.com> 
References: <1010611181131.ZM26024@bristol.st.com> 
To: Stuart Menefy <Stuart.Menefy@st.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI vs JEDEC read commands 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Jun 2001 09:51:06 +0100
Message-ID: <7578.992335866@redhat.com>
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
>  However, this got me looking at the code. In virtually every case, a
> 'read' command is 0xf0, apart from two (one in cfi_cfi_probe and the
> other in cfi_cmdset_unknown), when is it 0xff. Is this deliberate, and
> would changing the remaining two to 0xf0 cause any problems? 

They were originally 0xFF because I was dealing with Intel flash when I 
wrote the CFI probe code, and that's the 'Read Array' command for Intel 
flash. AFAICT CFI doesn't actually specify a way to take the chip _out_ of 
read mode, and hence to detect aliases. I suspect 0xF0 should work. Let's 
change it and see if it breaks - if it does we have to implement a 
cmdset-specific 'switch back to read mode' function.

--
dwmw2
