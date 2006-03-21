Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLjCc-0004OO-MT
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 10:56:33 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWH004GVIW65LC0@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 10:55:19 -0500 (EST)
Date: Tue, 21 Mar 2006 10:55:18 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <ops6rhi7cvoeqxpi@privat.utfors.se>
To: Tomas <Tomas2003@home.se>
Message-id: <Pine.LNX.4.64.0603211052500.3631@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <1142865089.c65a3380tomas2003@home.se>
	<Pine.LNX.4.64.0603201102430.3631@localhost.localdomain>
	<ops6rhi7cvoeqxpi@privat.utfors.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: cfi 0001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 Mar 2006, Tomas wrote:

> Hi,
> 
> There are 2 things that I didn't expect:
> 
> First that the flash allways seems to be in non-readable
> state after a write. It will not change state until a read
> is performed. This might be by design for performance?

Yes it is by design.

> The second thing is that it whole flash is put
> into a non-readable state in a write operation.
> I have partition the flash in several partition
> by using physmap. I don't know how the cfi flash
> works but shoudn't it be possible to work on sector basis?

No.  Those partitions are only logical partitions.  Most NOR flash parts 
are entirely unreadable when operations are performed on them.


Nicolas
