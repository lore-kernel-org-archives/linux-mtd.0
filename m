Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aCaC-0007Dt-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 08:12:36 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14aCaA-0007Dn-00
	for mtd@infradead.org; Tue, 06 Mar 2001 08:12:35 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <007101c0a618$e08655e0$0d3318b5@jolt> 
References: <007101c0a618$e08655e0$0d3318b5@jolt>  <005901c0a546$367c8d80$0d3318b5@jolt> <Pine.LNX.4.30.0103031754080.7202-100000@imladris.demon.co.uk> <19173.983781726@redhat.com> 
To: "Florian Schirmer / TayTron" <schirmer@taytron.net>
Cc: mtd@infradead.org
Subject: Re: AW: Some bugs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Mar 2001 08:12:21 +0000
Message-ID: <31607.983866341@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


schirmer@taytron.net said:
>  For what reason it is still in there? I'm not that expirienced kernel
> hacker. So maybe you can give me some hints. It makes developing
> rather complicated since i have to reset the board to get rid of the
> cfi modules. Maybe we should disable to stuff until it is fixed?

The code originally used get_module_symbol(), which did what I wanted quite 
nicely - it meant that modules like cfi_probe didn't have to have a hard 
dependency on every individual command set module. It was changed to the 
new inter_module_xxx abomination when Linus decided to include it in 
2.4.0-test$something, and it introduced link order dependencies and 
generally broke. Let's just strip it out and let the modules depend on each 
other. We can play ugly ifdef tricks to 'fix' that, it's better than using 
inter_module_get().



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
