Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Sg57-00073d-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 14:05:25 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Sg55-00073U-00
	for mtd@infradead.org; Tue, 13 Feb 2001 14:05:24 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A893578.DB8FA7B4@mobach.nl> 
References: <3A893578.DB8FA7B4@mobach.nl>  <3A86F72B.A1971413@mobach.nl> <19636.981968145@redhat.com> 
To: mendel@mobach.nl
Cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: Errors with M-Systems' DOC v MD2200 D16 and ext2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Feb 2001 14:04:59 +0000
Message-ID: <16538.982073099@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mendel@mobach.nl said:
> I trid this from the latest version of the CVS tree..
> ($Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $) 
> But I'v got still the same errors (I build from a clean kernel source tree)

Argh. -ENOTIME. When Red Hat get round to releasing a distribution with a 
2.4 kernel, someone bugzilla the fact that it doesn't support the 
DiskOnChip :). 

Better still, someone approach Cygnus^WRed Hat with a contract for
supporting it. Till then, I'm trying to fix it up in my spare time. I'm not
going to be able to pay much attention to this for about a month at the
soonest. Let me know if you want to help - specs are available if you're
serious.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
