Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvkr5-0006gd-GY
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 18:21:16 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1107211150.7567.43.camel@windu.rchland.ibm.com>
References: <1107190071.2480.150.camel@fuzzie.sanpeople.com>
	<1107211150.7567.43.camel@windu.rchland.ibm.com>
Content-Type: text/plain
Date: Tue, 01 Feb 2005 00:20:46 +0100
Message-Id: <1107213647.21196.355.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2-on-DataFlash support
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-31 at 16:39 -0600, Josh Boyer wrote:
> On Mon, 2005-01-31 at 18:47 +0200, Andrew Victor wrote:
> 
> (Note, quoting patches is hard to do when they are sent as attachments).
> 
> >@@ -435,7 +435,7 @@
> >           if we have a switch to next page, we will not have
> >           enough remaining space for this. 
> >        */
> >-       if (pad) {
> >+       if (pad && jffs2_cleanmarker_oob(c)) {
> >                c->wbuf_len = PAD(c->wbuf_len);
> 
> Why did you do this?  Now padding nodes don't get written out on NOR ECC
> flashes.
> 
> Could you update the Kconfig file as well?  Config.in is 2.4 only and
> I'm sure 2.6 people would like to use this.
> 
> Also, could you send the patch inline next time?  Makes it easier to
> comment on.

Also splitting them in prerequisites and DataFLASH stuff would make
reviewing a bit easier.

tglx
