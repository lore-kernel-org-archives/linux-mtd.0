Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14bNCC-0007yq-00
	for mtd-list@infradead.org; Fri, 09 Mar 2001 13:44:40 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14bNCA-0007yk-00
	for mtd@infradead.org; Fri, 09 Mar 2001 13:44:39 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E310A910E@kolkrabbi.flaga.is> 
References: <EADB10BAC266A14A85ECBF8686A73E310A910E@kolkrabbi.flaga.is> 
To: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
Cc: mtd@infradead.org
Subject: Re: Abstractation 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 09 Mar 2001 13:44:28 +0000
Message-ID: <11524.984145468@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kd@flaga.is said:
>  I need to add a cfi_cmdset_0003 to support a Intel chip that we have
> in our boards.

You'll probably find it works if you just hack cfi_probe to invoke 
cfi_cmdset_0001 instead. See the list archives - this came up quite 
recently.

> Why does I as the cmdset writer have to know all this stuff about the
> buswith, number of chips etc?

You need to handle multiple chips interleaved on a wide bus anyway. 

Numchips isn't too difficult and by doing it at the command set level we 
eliminate the need for external wrapper functions which make multiple calls 
to the single-chip version of the access function.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
