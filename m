Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196Qcp-0004VP-7u
	for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2003 08:49:35 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HDJ00AAA4DZSR@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Fri, 18 Apr 2003 09:49:12 +0200 (MEST)
Date: Fri, 18 Apr 2003 10:49:02 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3E9FC99D.5040200@idis.co.kr>
To: "Edward J. Lee" <noshel@idis.co.kr>, linux-mtd@lists.infradead.org
Message-id: <200304181049.02754.tglx@linutronix.de>
MIME-version: 1.0
References: <002901c3021b$546a6fe0$525deecb@noshel>
 <200304141325.02451.tglx@linutronix.de> <3E9FC99D.5040200@idis.co.kr>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: A question on ECC
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 18 April 2003 11:47, Edward J. Lee wrote:
>
> I tried this last night, and I got a bunch of "YAFFS ReadChunk with real
> ECC_INFO".
> when both reading/writing.
> Nothing else, do we need more information?

I assume there were no messages containing YAFFS ReadChunk with dummy ECC 
info.
That means, YAFFS supplies always a pointer to yaffs_oobinfo structure. 
Do the "I'ts not recommended ...." messages follow up the above message, or 
show they up elsewhere ? That means, are they really related to accessing the 
YAFFS partitions ? Please provide a short debug output, where I can see the 
context of those "It's not recommended ..." messages.

Are there any other functions accessing the flash device ? 

You use 2 partitions out of 5 for YAFFS. What are the other partitions for?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
