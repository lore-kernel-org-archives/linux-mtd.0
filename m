Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aD1c-0007Lm-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 08:40:56 +0000
Message-ID: <007f01c0a61d$8a6c7540$0d3318b5@jolt>
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
References: <007101c0a618$e08655e0$0d3318b5@jolt>  <005901c0a546$367c8d80$0d3318b5@jolt> <Pine.LNX.4.30.0103031754080.7202-100000@imladris.demon.co.uk> <19173.983781726@redhat.com>  <31607.983866341@redhat.com>
Subject: Re: AW: Some bugs 
Date: Tue, 6 Mar 2001 10:11:18 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

> The code originally used get_module_symbol(), which did what I wanted
quite
> nicely - it meant that modules like cfi_probe didn't have to have a hard
> dependency on every individual command set module. It was changed to the
> new inter_module_xxx abomination when Linus decided to include it in
> 2.4.0-test$something, and it introduced link order dependencies and
> generally broke. Let's just strip it out and let the modules depend on
each
> other. We can play ugly ifdef tricks to 'fix' that, it's better than using
> inter_module_get().

Yeah. That is what i thought too :-) Lets do some ifdefs and get rid off the
beast. I will commit a patch for the cfi stuff soon.

Thanks
  Florian Schirmer





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
