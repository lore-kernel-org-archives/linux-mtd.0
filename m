Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qchX-0003Lt-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2002 16:24:35 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020328162139.73829.qmail@web10806.mail.yahoo.com> 
References: <20020328162139.73829.qmail@web10806.mail.yahoo.com> 
To: Scott Kapu <kapus1@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: VFS never mounts root reaadonly 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 28 Mar 2002 16:24:33 +0000
Message-ID: <16210.1017332673@redhat.com>
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

kapus1@yahoo.com said:
>  Am I missing something obvious?? 

Remove the invalidate_device() from nftl_release().

--
dwmw2
