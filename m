Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tX5R-0002Cp-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2001 17:29:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLEEJHEPAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLEEJHEPAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: Question/suggestion 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 16 Oct 2001 17:37:59 +0100
Message-ID: <28153.1003250279@redhat.com>
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

joakim.tjernlund@lumentis.se said:
> I have noticed that when I mount a jffs2 FS(created with mkfs.jffs2)
> for the first time and look at the output of the df command, I see
> that "Use%" field slowly rise to 100% and then it drops back to ~15%
> and then it stays there. During this rise I also noticed that kupdate
> was eating alot of CPU(~80%)

> Is this normal? 

The first time it's mounted, all the blocks need to be erased and 
formatted correctly. That's done in the context of kupdated. The Use% field 
is high because the blocks are being taken out of the list of available 
blocks - we should probably fix that.


>  Is there any point to have a config option for preferred compression
> algorithm order?

Probably not. If you want rtime first you might as well just omit zlib 
completely. And yes, rtime will be faster. 

--
dwmw2
