Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hnBF-0001sc-00
	for <linux-mtd@lists.infradead.org>; Thu, 22 Aug 2002 09:19:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <4.3.2.7.2.20020822114908.00c8ee70@10.0.0.8> 
References: <4.3.2.7.2.20020822114908.00c8ee70@10.0.0.8> 
To: Andrew Hainsworth <andrew@hainsworth.ath.cx>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip - not found? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Aug 2002 09:18:52 +0100
Message-ID: <8941.1030004332@redhat.com>
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

andrew@hainsworth.ath.cx said:
>  All of those addresses are the ones the ISA board will use, but it
> cannot  find anything! 

No they're not. Turn off CONFIG_MTD_DOCPROBE_ADVANCED.

--
dwmw2
