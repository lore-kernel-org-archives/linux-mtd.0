Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16TjgE-0001df-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 13:12:38 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C4FFA62.505BD064@aminocom.com> 
References: <3C4FFA62.505BD064@aminocom.com> 
To: Elizabeth Clarke <eclarke@aminocom.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Nand flash: hang after erase 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 24 Jan 2002 13:23:39 +0000
Message-ID: <9294.1011878619@redhat.com>
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

eclarke@aminocom.com said:
> I'm playing with nandtest on an mtd partition, and found it hangs
> after it has erased the first block. Putting in some debug I find that
> it gets as far as the schedule call in mtdchar.c mtd_ioctl line 324

What is erase->state? If the erase attempt has completed, either
successfully or otherwise, it should be one of the two values which 
prevents the call to schedule(). 

--
dwmw2
