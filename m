Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15p4b7-0005bO-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2001 10:15:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011004090331.26203.qmail@web8103.in.yahoo.com> 
References: <20011004090331.26203.qmail@web8103.in.yahoo.com> 
To: =?iso-8859-1?q?somshekar=20kadam?= <kadamsom@yahoo.co.in>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Am29LV065D 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 04 Oct 2001 10:24:15 +0100
Message-ID: <31099.1002187455@redhat.com>
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

kadamsom@yahoo.co.in said:
>     i using Am29LV065D chip 8mb
>  i am able to read from the chip
>   when i write into it contents are not changed

Are you sure the Vpp (or Vpen) line is enabled when you try to write?

--
dwmw2
