Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FjGOm-0007nZ-5b
	for linux-mtd@lists.infradead.org; Thu, 25 May 2006 10:01:17 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IZT009P1QXYG8A0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 25 May 2006 10:01:10 -0400 (EDT)
Date: Thu, 25 May 2006 10:01:10 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <001501c67fd4$b50e37c0$253682a4@nap.st.com>
To: Davide CASCONE <davide.cascone@st.com>
Message-id: <Pine.LNX.4.64.0605250945150.6268@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <001501c67fd4$b50e37c0$253682a4@nap.st.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Control Mode Program on Sibley
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 25 May 2006, Davide CASCONE wrote:

> 
> Does JFFS2 use the Control Mode Program on Sibley device?

No.

> After a my preliminary analysis, it seems that only the Object Mode 
> Program is used. Is it right?

Yes.

The Sibley "Control Mode" is just too awkward for JFFS2 to take 
advantage of without major modifications.


Nicolas
