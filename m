Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oVQW-0002S0-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2001 20:42:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0110022124180.441-100000@lisa.rhpk.springfield.inwind.it> 
References: <Pine.LNX.4.33.0110022124180.441-100000@lisa.rhpk.springfield.inwind.it> 
To: Cristiano Paris <c.paris@libero.it>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD newbie 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 02 Oct 2001 20:51:07 +0100
Message-ID: <5836.1002052267@redhat.com>
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

c.paris@libero.it said:
>  The mount works but the system freezes for about 30 seconds (YUP) so
> I thought the system was hung. 

Yeah - checkpointing is on the TODO list along with some other ideas for 
speeding up mounts. Unfortunately I haven't yet found the time to do it, 
and nobody's yet talked nicely enough to the salespeople who control my
destiny that I've been given real time to do it :)

> Anyway, issuing a "touch /mnt/silly"
> crashes the system, giving me the same kernel oops.

Hmmm. Please get it fed through ksymoops and let me have a copy, along with 
the last few debugging messages before it died.

--
dwmw2
