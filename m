Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14d8Jl-0006p6-00
	for mtd-list@infradead.org; Wed, 14 Mar 2001 10:15:45 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14d8Jk-0006ow-00
	for mtd@infradead.org; Wed, 14 Mar 2001 10:15:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E3108AFCB@kolkrabbi.flaga.is> 
References: <EADB10BAC266A14A85ECBF8686A73E3108AFCB@kolkrabbi.flaga.is> 
To: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
Cc: mtd@infradead.org
Subject: Re: cfi_endian.h 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 14 Mar 2001 10:15:21 +0000
Message-ID: <17745.984564921@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



kd@flaga.is said:
> Why is it not always CFI_HOST_ENDIAN? 

The default is CFI_HOST_ENDIAN now. That's probably good enough for almost 
everyone, so it shouldn't be necessary to make it configurable.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
