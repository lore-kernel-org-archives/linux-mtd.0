Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ISmp-00065f-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2001 11:24:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B460280.9060805@niisi.msk.ru> 
References: <3B460280.9060805@niisi.msk.ru> 
To: Alexandr Andreev <andreev@niisi.msk.ru>
Cc: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: FTL and Endianity 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 06 Jul 2001 11:30:07 +0100
Message-ID: <31888.994415407@redhat.com>
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

andreev@niisi.msk.ru said:
>  Did anybody test FTL with big  endian CPU? If no, we need to throw
> these macros out. In any case, we have to be  able to configure this
> behaviour.

I didn't test - I think others did though. FTL is defined to be 
little-endian. Why do you say the macros are unusable?

--
dwmw2
