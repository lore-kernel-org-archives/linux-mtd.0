Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aCVN-0007DJ-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 08:07:37 +0000
Message-ID: <007101c0a618$e08655e0$0d3318b5@jolt>
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
References: <005901c0a546$367c8d80$0d3318b5@jolt>  <Pine.LNX.4.30.0103031754080.7202-100000@imladris.demon.co.uk>  <19173.983781726@redhat.com>
Subject: Re: AW: Some bugs 
Date: Tue, 6 Mar 2001 09:38:15 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

> > 1. cfi_cmdset_0001 broken:
> Doh! That's fixed, sorry.

Damn. All the cut and paste junkies out there :-) (Including me of course!)

> The inter_module stuff is just fundamentally screwed, as far as I'm
> concerned. I'm severely tempted just to take it out and let the modules
> have hard dependencies on each other.

For what reason it is still in there? I'm not that expirienced kernel
hacker. So maybe you can give me some hints. It makes developing rather
complicated since i have to reset the board to get rid of the cfi modules.
Maybe we should disable to stuff until it is fixed?

Cya
   Florian Schirmer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
