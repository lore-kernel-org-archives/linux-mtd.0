Received: from h1.handhelds.org ([192.58.209.91] helo=handhelds.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C9EbN-0007GQ-AZ
	for linux-mtd@lists.infradead.org; Sun, 19 Sep 2004 23:12:30 -0400
Message-ID: <414E4A9B.5000605@joshuawise.com>
Date: Sun, 19 Sep 2004 23:12:27 -0400
From: Joshua Wise <joshua@joshuawise.com>
MIME-Version: 1.0
To: Joshua Wise <joshua@joshuawise.com>
References: <414E3D41.6070507@joshuawise.com>
In-Reply-To: <414E3D41.6070507@joshuawise.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	h2200-port mailing list <h2200-port@handhelds.org>
Subject: Re: [H2200-port] Bricking and debricking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> There's code in CVS to send what should be the write commands, but it 
> seems to write only 0x00. Oddly enough, it seems to be consistent with 
> the number of bytes I send (i.e., if I send 256 bytes, I get 256 0s and 
> the rest FF, if I send 512, I get 512 0s, and if I send 528 bytes, I get 
> all 0s), but the data just isn't there. The flash part reports that all 
> went okay with the program, so there might be a problem with actually 
> transporting the data to the device over JTAG.
Ugh. Sorry, d'oh. I was loading the byte to program into the input chain 
instead of the output chain. Problem solved.

joshua
