Received: from mail-in-02.arcor-online.net ([151.189.21.42])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HjObH-0003UY-29
	for linux-mtd@lists.infradead.org; Thu, 03 May 2007 00:51:11 +0100
In-Reply-To: <1178147931.2340.40.camel@localhost.localdomain>
References: <20070502101841.B420B7F7FAB@schermpje.krocht>
	<1178147931.2340.40.camel@localhost.localdomain>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <d19ca59ba9a7a9804d5bbc8b01a8a697@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH rslib] Support non-canonical GF representations
Date: Thu, 3 May 2007 01:50:50 +0200
To: tglx@linutronix.de
Cc: david@woodhou.se, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hmm, please check for
>
> 	if (!gffunc)
>
> instead of
>
> 	if (gfpoly)

Yeah okay, that's safer (for the "else" branch).
New patch coming up.  Thanks for the review.


Segher
