Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1F7D7s-00024f-SB
	for linux-mtd@lists.infradead.org; Thu, 09 Feb 2006 09:50:46 -0500
Message-ID: <43EB4CDF.6040101@nrl.navy.mil>
Date: Thu, 09 Feb 2006 09:08:31 -0500
From: Dan Brown <dan.brown@nrl.navy.mil>
MIME-Version: 1.0
To: Braden Simpson <braden.simpson@gmail.com>
References: <7e560e180602062009v7fbe544ay4a93751778626b07@mail.gmail.com>
In-Reply-To: <7e560e180602062009v7fbe544ay4a93751778626b07@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 and INFTL compatibility
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Braden Simpson wrote:
> What do I need to do to stop the INFTL driver from corrupting the JFFS2
> partition?

Here's the deal.  Basically, the INFTL driver was written assuming it's 
the only driver using the device.  However, I believe you can work 
around this.

When the INFTL driver is loaded (or when your kernel boots, if it's 
compiled in), it searches through each MTD device.  It rejects anything 
that isn't a DiskOnChip.  For each DiskOnChip, it scans for the *first* 
BDTL partition, and mounts it as an INFTL volume.  It can't distinguish 
between a corrupted INFTL volume and something that isn't INFTL at all 
(such as JFFS2).

So, make sure your INFTL partition is FIRST, then your jffs2.  If this 
was already the case for you, I'll have to give this some more thought.

The relevant code is find_boot_record() in inftlmount.c.

You mentioned that you had to patch fill_autooob_layout().  If you think 
this is relevant to other users, please consider posting your changes 
and the reason for them on this list.

Good luck!

	-Dan
