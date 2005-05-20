Received: from canuck.infradead.org ([2001:8b0:10b:4::1])
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DZCXO-0003Ir-HI
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 19:48:00 +0100
Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DZCXJ-0003im-Nw
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 14:47:56 -0400
Received: from xanadu.home ([24.200.213.96]) by VL-MO-MR007.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0IGS00GAYUPMFP@VL-MO-MR007.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 20 May 2005 13:46:35 -0400 (EDT)
Date: Fri, 20 May 2005 13:46:34 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20050520143422.65d40157.vwool@ru.mvista.com>
To: Vitaly Wool <vwool@ru.mvista.com>
Message-id: <Pine.LNX.4.62.0505201342430.4397@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20050520143422.65d40157.vwool@ru.mvista.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: XIP support hooks for the AMD flash: updated
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 20 May 2005, Vitaly Wool wrote:

> I'd like to introduce the updated version of the XIP support hooks for AMD flash.
[...]

Found an inconsistency:

> @@ -786,9 +1000,10 @@
>  
>  	ret = -EIO;
>   op_done:
> -	chip->state = FL_READY;
> +	xip_enable(map, chip, adr);
> +	chip->state = FL_STATUS;
>  	put_chip(map, chip, adr);

The flash may never be in status mode when XIP is enabled.


Nicolas
