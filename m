Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14g7xD-0003RT-00
	for mtd-list@infradead.org; Thu, 22 Mar 2001 16:28:51 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14g7xC-0003RN-00
	for mtd@infradead.org; Thu, 22 Mar 2001 16:28:50 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E310A911C@kolkrabbi.flaga.is> 
References: <EADB10BAC266A14A85ECBF8686A73E310A911C@kolkrabbi.flaga.is> 
To: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
Cc: mtd@infradead.org
Subject: Re: mtd_info_t.erasesize 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Mar 2001 16:23:31 +0000
Message-ID: <28264.985278211@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kd@flaga.is said:
>  Yes but I do not totally agree with that logic. It assumes that the
> erasesize is the size of the biggest sector in the flashdevice.

The actual erase sizes are listed in the struct mtd_info. They're not yet 
exported to userspace. An ioctl to do that would be useful. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
