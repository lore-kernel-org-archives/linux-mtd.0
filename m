Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170z4W-0000iq-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2002 07:19:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <DJEELHNCJDICCAIMLCCCEEGLCCAA.kasturi@utstar.com> 
References: <DJEELHNCJDICCAIMLCCCEEGLCCAA.kasturi@utstar.com> 
To: "Kasturi Raghunath" <kasturi@utstar.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Driver for D323DB90VI 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 26 Apr 2002 07:19:01 +0100
Message-ID: <14457.1019801941@redhat.com>
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

kasturi@utstar.com said:
>   Is there a flash driver code available for the AMD chip D323DB90VI
> for 2.4 linux kernel?. Thanks in advance. 

If it's CFI-compliant it should just work. If not you'll need to add its ID 
and size information  to the table in jedec_probe.c

URL to data sheet?

--
dwmw2
