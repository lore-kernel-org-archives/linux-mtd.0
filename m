Received: from [217.111.56.2] (helo=farside.sncag.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CkKRx-0005Kc-3i
	for linux-mtd@lists.infradead.org; Fri, 31 Dec 2004 05:56:06 -0500
To: mike <mikelee@avantwave.com>
In-Reply-To: <41D4C9AC.6020901@avantwave.com> (mikelee@avantwave.com's
	message of "Fri, 31 Dec 2004 11:38:20 +0800")
References: <41D4C9AC.6020901@avantwave.com>
From: Rainer Weikusat <rainer.weikusat@sncag.com>
Date: Fri, 31 Dec 2004 11:55:34 +0100
Message-ID: <87is6iivo9.fsf@farside.sncag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: Re: porting to new flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mike <mikelee@avantwave.com> writes:
> Dear all
>     I have a development board with using 32 bit bus AMD flash and now
> move to 8-bit AM29LV652d. What do i need to do with my kernel mtd
> mapping? Just change the size, buswidth?

Yes. I happen to have move from 8 bit to 16 bit somewhen over the
course of this year and that worked w/o problems.
