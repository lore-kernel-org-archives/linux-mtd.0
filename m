Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Rfzx-0002Fp-00
	for mtd-list@infradead.org; Sat, 10 Feb 2001 19:47:57 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Rfzv-0002Fj-00
	for mtd@infradead.org; Sat, 10 Feb 2001 19:47:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200102100850.f1A8okh25390@kanga.hofr.at> 
References: <200102100850.f1A8okh25390@kanga.hofr.at> 
To: Der Herr Hofrat <der.herr@hofr.at>
Cc: mtd@infradead.org
Subject: Re: error with 2.2.18 ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 10 Feb 2001 19:47:08 +0000
Message-ID: <18908.981834428@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Missing a #define __exit /**/ in compatmac.h

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
