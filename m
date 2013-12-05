Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoOyJ-0007pN-PA
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 02:47:24 +0000
Date: Thu, 5 Dec 2013 10:20:26 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
Message-ID: <20131205022025.GA24434@shlinux2.ap.freescale.net>
References: <1384937569-23893-1-git-send-email-b32955@freescale.com>
 <528C8C1B.7090902@st.com> <528DC1DB.2090007@freescale.com>
 <528DCFBD.9000905@st.com> <528DD70B.8010602@freescale.com>
 <528DE9A8.6060207@st.com> <528EBDAE.7070408@freescale.com>
 <20131204235831.GF27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20131204235831.GF27149@ld-irv-0074.broadcom.com>
Cc: Marek Vasut <marex@denx.de>, Angus Clark <angus.clark@st.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 04, 2013 at 03:58:31PM -0800, Brian Norris wrote:
> 
> BTW, if we update m25p80 to use 6th-byte READID, we need to double-check
> the entries that currently use the 5-byte ID string, so they don't break
> if we extend them implicitly.
yes, i think we should read out more bytes of the ID.

Is there any NOR that can only read out 5bytes, and can not be read out 6 bytes?


thanks
Huang Shijie
