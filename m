Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Ee5s-0000Fe-00
	for mtd-list@infradead.org; Fri, 05 Jan 2001 21:08:12 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14Ee5q-0000FY-00
	for mtd@infradead.org; Fri, 05 Jan 2001 21:08:11 +0000
Date: Fri, 5 Jan 2001 21:07:55 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
cc: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>,
     <Russ.Dill@asu.edu>,  <mtd@infradead.org>
Subject: Re: Supported flash memory 
In-Reply-To: <Pine.LNX.4.30.0101051257060.535-100000@xanadu.home>
Message-ID: <Pine.LNX.4.30.0101052106360.30717-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 5 Jan 2001, Nicolas Pitre wrote:

> This is required only for flash in command mode, so cfi_build_cmd() is the
> best place to shuffle bits.  Everything is likely to be shuffled at compile
> time and raw reads/writes aren't impacted.

Also need it for reading query results. cpu_to_cfi16() et al are provided
for this purpose. I suppose we should provide cpi_to_cfi8() and
cfi8_to_cpu() too.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
