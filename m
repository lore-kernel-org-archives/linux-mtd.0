Received: from webapps.arcom.com ([194.200.159.168])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGwSt-00078e-A0
	for linux-mtd@lists.infradead.org; Fri, 23 Apr 2004 09:55:19 +0100
Message-ID: <4088D9F4.3010002@arcom.com>
Date: Fri, 23 Apr 2004 09:55:16 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <4088D26D.8070105@fh-landshut.de>
In-Reply-To: <4088D26D.8070105@fh-landshut.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: MVME2100 flash mapping patch - please review
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > cfi_cmdset_0002.c is version 1.93

If your flash chips support suspending erases then this version is 
broken.  You'll need either 1.94 or 1.98.

David Vrabel
