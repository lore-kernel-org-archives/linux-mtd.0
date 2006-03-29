Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOdmd-0006D8-Ig
	for linux-mtd@lists.infradead.org; Wed, 29 Mar 2006 11:44:41 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWW00B03EIAB490@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 29 Mar 2006 11:44:34 -0500 (EST)
Date: Wed, 29 Mar 2006 11:44:34 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <Pine.LNX.4.64.0603291125480.14923@localhost.localdomain>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0603291142410.14923@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.64.0603101044290.3274@localhost.localdomain>
	<44200D27.2060404@intel.com>
	<Pine.LNX.4.64.0603211002250.3631@localhost.localdomain>
	<442943A3.6060807@intel.com>
	<Pine.LNX.4.64.0603291125480.14923@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] cfi: Fixup of write errors on XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 29 Mar 2006, Nicolas Pitre wrote:

> I think both solutions, although they fix this particular problem, are 
> not addressing the fundamental issue which is that the current code 
> structure to cope with XIP and non-XIP is becoming a total mess.  In 
> fact the whole timeout/error handling should be factored out of every 
> functions into a sincle subfunction, actually one for XIP and one for 
> non-XIP.  This way the non-XIP case would not have to care about chip 
                         ^^^^^^^
                         [I mean the XIP case of course]  

> state changing since that cannot happen, and the timeout treshold would 
> be more accurately computed as well.

Nicolas
