Received: from wtms.nl ([194.109.57.126])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mxRO-0002IQ-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 13:44:47 +0000
Received: from wtms.linux.mtd via Gateway (Mailtraq/2.0.0.1249) by wtms.nl
	for linux-mtd@lists.infradead.org; Mon, 18 Mar 2002 14:54:16 +0100
From: Wil Taphoorn <wil@wtms.nl>
To: linux-mtd@lists.infradead.org
Subject: Re: How to protect DoC 2000 from power fail?
Date: Mon, 18 Mar 2002 14:54:16 +0100
Message-ID: <3C95F188.88C52AEB@wtms.nl>
References: <E16mwFW-0006c2-00@host3.hosting4everyone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Cfowler wrote:
 
> Wil Taphoorn wrote:
> > I am looking for some rigid means of power fail protection
> > for a DoC 2000 based embedded system. [..snip..]
> 
> I do not use a journalling file system.  I load a ext2 fs into memory from a
> raw file on DOC2000.  If you loose power then you just reboot.  No loss of
> data.  Of course only config changes not the root fs.  I store config in a
> shared memory sgement.  I only write it to DOC when the user issues the
> 'save' command.

Thanks for you input, Chris, but I can not use that scenario. The system has to
save not only run-time information but also system update files received from
the network like data, drivers and even the kernel itself.

I think I first have to read (and re-read) David's contribution on the subject.

Thanks,
Wil
