Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16HLIi-0008Hp-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Dec 2001 08:45:08 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011221072938.5457.qmail@sinamail.com> 
References: <20011221072938.5457.qmail@sinamail.com> 
To: "=?big5?B?cmVnaWdhbw==?=" <regigao@sinamail.com>
Cc: linux-mtd@lists.infradead.org, Steve_Chen@kingston.com
Subject: Re: =?big5?B?SkZGUyBjb21waWxlIGVycm9y?= 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 21 Dec 2001 08:55:01 +0000
Message-ID: <3251.1008924901@redhat.com>
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

regigao@sinamail.com said:
> I know the completion.h is not included until kernel 2.4.8. How do I
> resolve the question ? 

Make an empty file called include/linux/completion.h and make sure you've 
got the latest version from CVS of include/linux/mtd/compatmac.h, which 
should define it for you.

--
dwmw2
