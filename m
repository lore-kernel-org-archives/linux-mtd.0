Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eBVj-0000X3-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2001 09:24:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <4494.999501910@redhat.com> 
References: <4494.999501910@redhat.com>  <3B932CDF.42F6AA02@dgt-lab.com.pl> 
Cc: Wojciech Kromer <krom@dgt-lab.com.pl>,
    mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd-snapshot-20010902.tar.bz2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 04 Sep 2001 09:30:34 +0100
Message-ID: <9579.999592234@redhat.com>
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

dwmw2@infradead.org said:
>  Oops. It was called mtd_do_gen_probe but now it's fixed. cvs update
> and try  again. 

> Note that I haven't tested any of this new stuff yet. I'm planning to
> do  that this morning. 

Tested. A couple of stupid bugs in gen_probe.c fixed. As cfi_cmdset_0002.c
was OK and I did much the same changes to cfi_cmdset_0001, I haven't
bothered to dig out a board with Intel flash on it - someone shout if I
broke it.

The new version of the jedec_probe code is also untested. 

I'm now a little happier with the setup of the probe code, and the way is 
clear for someone to write an intel_probe.c or to make jedec_probe.c grok 
Intel chips.

If you do this faked CFI probe for Intel chips, make sure you either fill in
the cmdset_priv appropriately, or modify the assumption in cfi_cmdset_0001.c
that one will be present.

--
dwmw2
