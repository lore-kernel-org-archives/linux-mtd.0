Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 154P6I-0005UZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 May 2001 16:38:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <003001c0e682$85a2cd70$937f11d4@privat> 
References: <003001c0e682$85a2cd70$937f11d4@privat> 
To: "MG" <m.gibson@thinstuff.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: HELP! - ISDN device not working with 16M DOC2000 but working with 8MB DOC Millenium 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 28 May 2001 16:42:30 +0100
Message-ID: <26670.991064550@redhat.com>
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

m.gibson@thinstuff.com said:
> I can mount nftla1 from the 16MB DOC2000, but when I try to load the
> hisax module for the Sedlbauer ISDN card it simply does not work. When
> I try to do the same thing with a 8MB DOC millenium I can load the
> hisax module without any problem.

> Same problem with wavelan - PCMCIA. it works perfect with 8MB DOC
> Millenium but with 16MB DOC2000 it does not work?

Do you mean it failed to detect the DiskOnChip hardware at all? Can you 
show the startup messages?

Is it a PCMCIA ISDN card? Is the PCMCIA correctly configured not to attempt 
to use the memory region used by the DiskOnChip?

--
dwmw2
