Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15MzT3-0002YP-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2001 23:06:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B560681.4D216FF3@sun.com> 
References: <3B560681.4D216FF3@sun.com> 
To: Tim Hockin <thockin@sun.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: cfi_cmdset_0002 and writes 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 18 Jul 2001 23:12:34 +0100
Message-ID: <26464.995494354@redhat.com>
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

thockin@sun.com said:
>  Secondly, the specs call for specific spin checks (checkin the high
> bot of each byte) rather than wait-times. 

On erase, that's what we do, isn't it?

	rdy_mask = CMD(0x80);
	while ( ( (status = cfi_read(map,adr)) & rdy_mask ) != rdy_mask ) {

For writes, we watch the toggling bit and continue when either it stops
toggling or we've timed out.

--
dwmw2
