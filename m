Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sBz6-00028A-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2002 01:17:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01f601c1d9ce$b9a1e5d0$87657bc8@athlon> 
References: <01f601c1d9ce$b9a1e5d0$87657bc8@athlon> 
To: "Derek Ross" <dross@iders.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Are erase suspends possible? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 02 Apr 2002 01:14:01 +0100
Message-ID: <3371.1017706441@redhat.com>
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

dross@iders.ca said:
> I was looking through the code in  cfi_cmdset_0001.c, and it appears
> that erase suspends are not implemented. Is this correct? 

No. Erase suspend has been working for ages. What version of 
cfi_cmdset_0001.c are you looking at?

--
dwmw2
