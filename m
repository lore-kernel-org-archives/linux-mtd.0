Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SCaI-0007pJ-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Jul 2002 09:12:26 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200207100723.g6A7Nwf06288@localhost.localdomain> 
References: <200207100723.g6A7Nwf06288@localhost.localdomain>  <200207091032.g69AWUV27220@localhost.localdomain> <15331.1026217135@redhat.com> 
To: Clive Davies <cdavies@altera.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: add_mtd_partition question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 10 Jul 2002 09:12:07 +0100
Message-ID: <10107.1026288727@redhat.com>
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

cdavies@altera.com said:
> I think this is probably a more correct fix. If you could let me know
> if it  looks ok, if so then I'll commit it.

Please resend after
	echo "diff -up"  >> ~/.cvsrc 

--
dwmw2
