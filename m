Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15KePS-0000cj-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2001 12:13:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B4D7FA4.9040805@crf.canon.fr> 
References: <3B4D7FA4.9040805@crf.canon.fr>  <3B4D6B4E.2040303@crf.canon.fr> <7474.994930069@redhat.com> 
To: valette@crf.canon.fr
Cc: linux-mtd@lists.infradead.org
Subject: Re: Moving from 2.2.18 + M-system proprietray code to 2.4.6 => does not work 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 12 Jul 2001 12:19:10 +0100
Message-ID: <20935.994936750@redhat.com>
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

valette@crf.canon.fr said:
>  What are the right major minor for DOC 2000? I found values in mtd.h
> and  other in major.h.

It's not defined in either of those two files. It's in <linux/mtd/nftl.h>:
	#define NFTL_MAJOR 93

--
dwmw2
