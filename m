Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oR6d-00022j-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2001 16:05:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BB9D8D1.6060708@gmx.ch> 
References: <3BB9D8D1.6060708@gmx.ch> 
To: Stefan Wanner <stefan.wanner@gmx.ch>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd on mpc8xx 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 02 Oct 2001 16:14:03 +0100
Message-ID: <21977.1002035643@redhat.com>
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

stefan.wanner@gmx.ch said:
>  are the mtd devices now registered? if yes, what majornumber do they
> have? 

Enable CONFIG_MTD_CHAR, then it'll be major 91, as described in 
Documentation/devices.txt

--
dwmw2
