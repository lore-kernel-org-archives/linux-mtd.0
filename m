Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Biyh0-0000r1-SZ
	for linux-mtd@lists.infradead.org; Fri, 09 Jul 2004 12:57:47 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1089300544.28614.1331.camel@hades.cambridge.redhat.com>
References: <1089300544.28614.1331.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1089392262.28614.1388.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 09 Jul 2004 17:57:43 +0100
Content-Transfer-Encoding: 8bit
Cc: nico@cam.org, "Thomas W. Nelson" <twn@dot4.com>
Subject: Re: Flash bank width larger than physical buswidth
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-07-08 at 16:29 +0100, David Woodhouse wrote:
> The probe routines appear to still work; I've broken all the NOR flash
> drivers. Will fix cfi_cmdset_0002.c tomorrow; volunteers for fixing and
> testing the others would be appreciated -- or indeed comments on the
> approach. I figured just committing it would get people's attention
> though ;)

Well that was evidently a naïve assumption -- nobody seems to care. I've
just fixed it up to the point that cfi_cmdset_0002.c works for me in
32-bit 'bankwidth' mode. I'll do some more testing over the weekend and
next week, and possibly fix up the other commandsets.

I think now's the time to drop the non-CFI command set support which has
been marked obsolete for a while. 

-- 
dwmw2
