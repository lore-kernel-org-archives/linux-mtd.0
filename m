Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16l33r-0008KO-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 07:20:35 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020313055518.77306.qmail@web11507.mail.yahoo.com> 
References: <20020313055518.77306.qmail@web11507.mail.yahoo.com> 
To: =?iso-8859-1?q?Ajit=20Anand?= <ajit_anand@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: kernel oops loading Doc2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Mar 2002 07:32:00 +0000
Message-ID: <19363.1016004720@redhat.com>
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

ajit_anand@yahoo.com said:
> it modprobe's the docprobe without an oops but then gives an error
> Could not find valid boot record Could not mount nftl device  

OK. cvs up -A and try again.

--
dwmw2
