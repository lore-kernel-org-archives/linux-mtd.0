Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16j0F0-0005MM-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2002 15:55:38 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <AEA9DCA73595D411A6D4009027DE9C5E019BFA43@MSI-EX6> 
References: <AEA9DCA73595D411A6D4009027DE9C5E019BFA43@MSI-EX6> 
To: Vadim Khmelnitsky <VadimK@m-sys.com>
Cc: 'Herman Theron' <HEtheron@csir.co.za>, strtok@hotmail.com,
    linux-mtd@lists.infradead.org
Subject: Re: Lost DOC2000 after trying to load grub 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Mar 2002 16:01:14 +0000
Message-ID: <12182.1015516874@redhat.com>
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

VadimK@m-sys.com said:
> If i understand eraseall utility correctly it erases the whole
> diskonchip completely . After that bad block table is lost and it's
> unsafe to use such diskonchip afterwards . 

You are correct. Neither nftl_format or eraseall functions are safe.

How feasible would it be to port the M-Systems DFORMAT utility to work 
under Linux through the MTD driver? 

--
dwmw2
