Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kmBY-0006ls-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 13:19:24 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020312112903.89113.qmail@web11507.mail.yahoo.com> 
References: <20020312112903.89113.qmail@web11507.mail.yahoo.com> 
To: =?iso-8859-1?q?Ajit=20Anand?= <ajit_anand@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: kernel oops loading Doc2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Mar 2002 13:30:48 +0000
Message-ID: <4789.1015939848@redhat.com>
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
>  could you please send me some pointers as to where i'm going wrong.

Documentation/oops-tracing.txt

If you run 'cvs up -D 20020306 drivers/mtd/nftl*.c' does it start to work 
again? That reverts my experimental patch to make the driver handle larger 
DiskOnChip devices.


--
dwmw2
