Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 153Chj-0008KC-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 May 2001 09:12:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010525070347.B5635@napri.sk> 
References: <20010525070347.B5635@napri.sk> 
To: Peter Kundrat <kundrat@kundrat.sk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: patch for lilo-21.7.5 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 May 2001 09:16:20 +0100
Message-ID: <24361.990778580@redhat.com>
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

kundrat@kundrat.sk said:
> +#define MAJOR_FL        62 /* M-Systems Disk On Chip 2000 */ 

That's a reserved major - I can't see that getting accepted into the
upstream LILO sources. They eventually did register another one, rather than
using the one I'd already registered for NFTL. I believe it's 102.


> +	nftl_gendisk.nr_real++;

Thanks. I've committed that, with the corresponding decrease in 
NFTL_unsetup().

--
dwmw2
