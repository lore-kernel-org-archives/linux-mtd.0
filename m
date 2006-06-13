Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FpxC7-0002vw-Ql
	for linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 20:55:57 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J0R005Z6X8UG0C0@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 20:55:43 -0400 (EDT)
Date: Mon, 12 Jun 2006 20:55:42 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: Does anyone have patches for Sibley on the 2.4 kernel?
In-reply-to: <20060612220711.8263.qmail@web30510.mail.mud.yahoo.com>
To: Justin Treon <justin_treon@yahoo.com>
Message-id: <Pine.LNX.4.64.0606122047240.2703@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20060612220711.8263.qmail@web30510.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 Jun 2006, Justin Treon wrote:

> Does anyone have patches for Intel M18 Flash (a.k.a.
> Sibley) on the 2.4 kernel?  

> 
> If no one has a patch, would it be easier to port MTD
> back to the 2.4 kernel or to insert the changes for
> Sibley into the old version of MTD?

Sibley changes are rather scattered around the whole of 
cfi-cmdset-0001.c as well as special handling in JFFS2.
so you'd need to backport current MTD code to your 2.4.kernel if you 
want it to work reliably.

Your best bet is certainly to add support for your board to a 2.6 kernel 
though.


Nicolas
