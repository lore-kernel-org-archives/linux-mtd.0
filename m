Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ZqZW-000724-00
	for mtd-list@infradead.org; Mon, 05 Mar 2001 08:42:26 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ZqZU-00071y-00
	for mtd@infradead.org; Mon, 05 Mar 2001 08:42:25 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <005901c0a546$367c8d80$0d3318b5@jolt> 
References: <005901c0a546$367c8d80$0d3318b5@jolt>  <Pine.LNX.4.30.0103031754080.7202-100000@imladris.demon.co.uk> 
To: "Florian Schirmer / TayTron" <schirmer@taytron.net>
Cc: mtd@infradead.org
Subject: Re: AW: Some bugs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Mar 2001 08:42:06 +0000
Message-ID: <19173.983781726@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


schirmer@taytron.net said:
> 1. cfi_cmdset_0001 broken: 

Doh! That's fixed, sorry.


schirmer@taytron.net said:
>  2. physmap (?) broken:
> The inter_module stuff thems to have a problem somewhere. The modules
> cant be unloaded since the usagecount wont decrement correctly. Dont
> know wether it's the fault of physmap or not. 

The inter_module stuff is just fundamentally screwed, as far as I'm 
concerned. I'm severely tempted just to take it out and let the modules 
have hard dependencies on each other.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
