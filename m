Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BA9A3-0004XJ-Fr
	for linux-mtd@lists.infradead.org; Sun, 04 Apr 2004 16:03:47 +0100
Message-ID: <407023A4.9060903@colleduc.ee>
Date: Sun, 04 Apr 2004 18:03:00 +0300
From: Kalev Lember <kalev@colleduc.ee>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <Pine.LNX.4.44.0404041514100.12090-100000@kiire.colleduc.ee>
	<200404041421.11425.tglx@linutronix.de>
	<200404041434.44768.tglx@linutronix.de>
In-Reply-To: <200404041434.44768.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: CVS compile errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> On Sunday 04 April 2004 14:21, Thomas Gleixner wrote:
> 
>>On Sunday 04 April 2004 14:21, Kalev Lember wrote:
>>
>>>And indeed, there is no member named chipshift in nand.h.
>>
>>I'm in the middle of an overhaul of nand stuff. I modified the id structure
>>and forgot to adjust the doc stuff. I have a look into it
> 
> 
> Fixed in CVS. cvs up
> 

Thank you! Builds ok now.

By the way, what is it that you are overhauling?

-- 
Kalev Lember
