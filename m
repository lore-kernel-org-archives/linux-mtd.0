Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hy8Ow-0001pq-2a
	for linux-mtd@lists.infradead.org; Tue, 12 Jun 2007 11:35:33 -0400
Subject: Re: cfi_cmdset_0001 get_chip()put_chip() contender/loaner, what
	does it do?
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <alpine.LFD.0.99.0706121040200.21061@xanadu.home>
References: <1181658875.30670.233.camel@gentoo-jocke.transmode.se>
	<alpine.LFD.0.99.0706121040200.21061@xanadu.home>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Jun 2007 17:35:15 +0200
Message-Id: <1181662515.30670.243.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-06-12 at 10:50 -0400, Nicolas Pitre wrote:
> On Tue, 12 Jun 2007, Joakim Tjernlund wrote:
> 
> > In the beginning of get_chip() and put_chip for the cfi_cmdset_0001
> > driver there is this "fight" over access to the chip that I don't
> > understand. Why is it there and why don't the other drivers need it?
> 
> It is there to support the Intel Sibley NOR flash chips which have the 
> ability to allow read operations in many part of the chip at the same 
> time as an erase or a write operation taking place in another part of 
> the chip.  The erase and write operation, though, cannot have more than 
> one instance on the whole chip.
> 
> To facilitate the driver implementation, the Sibley flash is subdivided 
> in many "chips" corresponding to those parts mentioned above.  However, 
> since the ability to write is shared amongst all those "chips" then it 
> sometimes must be obtained from another chip.  The other chip might 
> concede it or it might not.  That's the "fighting".

I see, the reason for me asking about this is that I am seeing some
very long stalls, see the "JFFS2 appears to "freeze" during erase,
version 2" thread and I am starting to suspect the above mentioned code,
mostly because I don't understand this code and don't know where else
to look. Do you see anything that could explain what I am seeing?

 Jocke
