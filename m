Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13BuWc-00031O-00
	for mtd-list@infradead.org; Tue, 11 Jul 2000 08:32:14 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13BuWY-00031G-00
	for mtd@infradead.org; Tue, 11 Jul 2000 08:32:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0007101236250.2339-100000@phiggins.transzap.com> 
References: <Pine.LNX.4.21.0007101236250.2339-100000@phiggins.transzap.com> 
To: Patrick Higgins <phiggins@transzap.com>
Cc: mtd@infradead.org
Subject: Re: NFTL problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 11 Jul 2000 08:32:06 +0100
Message-ID: <21093.963300726@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


phiggins@transzap.com said:
>   Anyone know what's going on? 

Don't ask me - I'm the person who screwed it up in the first place :)

cf. the comments in the code:

/* Linux-specific block device functions */

/* I _HATE_ the Linux block device setup more than anything else I've ever
 *  encountered, except ...
 */

static int nftl_sizes[256]={0,};
static int nftl_blocksizes[256] = {0,};

/* .. for the Linux partition table handling. */

struct hd_struct part_table[256] = {{0,0},};



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
