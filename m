Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CLPL-0003l6-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 14:19:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B2F4DEA.6839BBD0@inventel.fr> 
References: <3B2F4DEA.6839BBD0@inventel.fr> 
To: Xavier DEBREUIL <xde@inventel.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: non cfi flash memory 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 19 Jun 2001 14:24:34 +0100
Message-ID: <4395.992957074@redhat.com>
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


xde@inventel.fr said:
> In fact, as the intel flash 28F160x3 is not cfi, it is useless to use
> do_map_probe("cfi") or something else as I tried to. What should be
> written is the equivalent of amd_flash.c for the flash family which
> include TE28Fxxxx3 from INTEL, M28Wxxx from ST and so on.

No. You don't need to write a whole driver for it. The existing
cfi_cmdset_0001 code can driver the chips just fine. All you need to do is
write a _probe_ routine which can pass control to the existing code, just
like the cfi_probe does.

There's already a hack in the cfi_probe code to find some non-CFI 
AMD-compatible chips and use the cfi_cmdset_0002 back end. You want 
something similar - but _don't_ add further hacks to the cfi_probe code, 
make it an entirely new probe routine like the AMD one should probably 
have been.

--
dwmw2
