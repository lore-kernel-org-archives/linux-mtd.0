Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 176f9H-0002y6-00
	for <linux-mtd@lists.infradead.org>; Sat, 11 May 2002 23:15:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200205102135.g4ALZjP02377@tinman.seitzassoc.com> 
References: <200205102135.g4ALZjP02377@tinman.seitzassoc.com> 
To: Galen Seitz <galens@seitzassoc.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: can't rmmod cfi_cmdset_0002 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 11 May 2002 23:15:29 +0100
Message-ID: <23062.1021155329@redhat.com>
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

galens@seitzassoc.com said:
>   It appears from looking at the code that a call to cfi_cmdset_0002
> will result in the macro  MOD_INC_USE_COUNT being executed twice, once
> in cfi_cmdset_0002, and again in cfi_amdstd_setup.  cfi_cmdset_0001.c
> has a similar structure. Is this intentional? 

Not really, no. The modular stuff is a bit messy and wants attention.

--
dwmw2
