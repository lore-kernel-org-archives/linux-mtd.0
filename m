Received: from mail.valcom.com ([151.199.82.35])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GraNj-00078F-H3
	for linux-mtd@lists.infradead.org; Tue, 05 Dec 2006 08:30:50 -0500
Message-ID: <4575746E.1040601@valcom.com>
Date: Tue, 05 Dec 2006 08:30:22 -0500
From: Glen Johnson <gjohnson@valcom.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Upgrading mtd-utils in uClinux.
References: <456C4306.8070205@valcom.com>	<Pine.LNX.4.64.0611290842530.5328@lnxricardw.se.axis.com>	<456ED562.5080307@valcom.com>
	<1164972082.5063.59.camel@pmac.infradead.org>
In-Reply-To: <1164972082.5063.59.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Thu, 2006-11-30 at 07:58 -0500, Glen Johnson wrote:
>  
>
> mkfs.jffs2 builds fine for me for FR-V uClinux, although that's
> ELF-FDPIC not flat. Are the relocations in .rodata actually a problem?
>  
Yes, it appears to.  When I try to execute mkfs.jffs2 on the host
system I get the following error.
BINFMT_FLAT: reloc outside program 0x54e20000 (0 - 0xf57f4/0x11ec0),
killing mkfs.jffs2!
SIGSEGV


> Doesn't m68k have ELF-FDPIC yet?
>  
I have the uClinux distribution dated 2006-08-03.  I did a grep -r
ELF-FDPID ./ and found it mentioned in the code for the Fujitsu FRV
processor and nothing else.  Someone told me he thought it did.  But I
do not see it in the code.  The compiler does appear to have elf
support according to this line in the output of make, ARCH=m68knommu
CROSS_COMPILE=m68k-elf- this however is Not ELF-FDPIC.
Is there a better way to tell if m68knommu supports ELF-FDPIC?
