Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eGKs-0000zt-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2001 14:33:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0109041443430.1177-100000@tagada.safetech.fr> 
References: <Pine.LNX.4.21.0109041443430.1177-100000@tagada.safetech.fr> 
To: Norbert Leon <norbert@safetech.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with Intel TE28F320 B3 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 04 Sep 2001 14:39:42 +0100
Message-ID: <20180.999610782@redhat.com>
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

norbert@safetech.com said:
>  I'm working on an intel te28f320 b3ba110 (complete reference) and i
> can't get my system to recognize it ...  

Some of the 28F320 chips are CFI-compliant and some aren't. The other 
letters and numbers you quoted didn't seem to help me work out which you 
have.

Turn off CONFIG_MTD_RAM, CONFIG_MTD_ROM and CONFIG_MTD_SLRAM. You don't 
need them.

--
dwmw2
