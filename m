Received: from server1.lazerlink.net ([199.234.153.21])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mzEZ-0002Qk-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 15:39:39 +0000
From: "Stephen Bardsley" <sbardsley@rlwinc.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: bad block recovery 
Date: Mon, 18 Mar 2002 10:51:02 -0500
Message-ID: <PCEBLNKIDOKLBPDJECFEAEBNDHAA.sbardsley@rlwinc.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3886.1016459530@redhat.com>
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

> sbardsley@rlwinc.com said:
> >  I took a quick look at the code and see that meminfo.erasesize is
> > used to scale various values.  I don't see why 8Kb is a limit.  I have
> > found that my chip's erase size to be 16Kb; is there any way for me to
> > use nftl_format? If necessary, I don't mind modifying the code, but I
> > don't want to screw it up.  Any hints? 
> 
> You _ought_ to be able to just remove that check, if you first verify that 
> we'll do the right thing through the rest of the code rather than using a 
> hardcoded 8KiB. I put the check in just because I'd never tested the larger 
> erase size.

I don't know a great deal about this stuff, but the code seems to want to do
the "right thing".  So I removed the 8Kb check, and ntfl_format is running as
I write this; so far so good.

BTW -- It might be good to add a note to the FAQ regarding nftl_format and
driver debug options.  Debugging causes the format to crawl.  On my hardware
it is the difference between 20 minutes (without debug) and 4 hours (with debug)
(estimated times).

Thanks again.

Steve
