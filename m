Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 169n0Q-0000zU-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2001 12:43:02 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01113013455100.01045@theodul> 
References: <01113013455100.01045@theodul> 
To: Felix Frey <ffrey@freesurf.ch>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from DOC-Millenium 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 30 Nov 2001 12:53:29 +0000
Message-ID: <20221.1007124809@redhat.com>
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

ffrey@freesurf.ch said:
>  The only remaining problem is that I  can't boot from the DOC
> anymore. I'm using doc-lilo as bootloader. I appreciate any advice.

What happens? Does the built-in BIOS not detect the DiskOnChip any more? I 
think the Grub code to drive the DiskOnChip directly, without even using 
the M-Systems' BIOS extension, is now ready for people to use it - you 
could try that.

--
dwmw2
