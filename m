Received: from smtp2.cogeco.ca ([216.221.81.29] helo=fep7.cogeco.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ksf0r-0001R4-R3
	for linux-mtd@lists.infradead.org; Wed, 22 Oct 2008 14:48:42 +0000
Message-ID: <48FF3D5E.6040902@ripnet.com>
Date: Wed, 22 Oct 2008 10:49:02 -0400
From: Mike Sander <msander@ripnet.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: task pdflush blocked during garbage collection.
References: <48FDF397.2080404@ripnet.com> <48FE060A.2070505@ripnet.com>
In-Reply-To: <48FE060A.2070505@ripnet.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I think I have a resolution to the issue in this thread.    I have tried 
the latest 2.6.27 kernel.  I no longer experience the blocking issue.  
It appears that there have been updates to the locking code in jffs2 and 
some other changes in mtd_dataflash.c that might have corrected the 
problems I was experiencing.

Thanks to anyone who took time to ponder this.

Regards,
Mike
