Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14s1xt-00076H-00
	for mtd-list@infradead.org; Tue, 24 Apr 2001 13:30:45 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14s1xf-00076B-00
	for mtd@infradead.org; Tue, 24 Apr 2001 13:30:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01042412450101.00394@rob> 
References: <01042412450101.00394@rob>  <NEBBKJHOALKOLCFPGELEIEJLCJAA.ajlennon@arcom.co.uk> <01042316543802.01109@rob> <3AE4B5B3.26E340E8@daniel.com> 
To: rob@sysgo.de
Cc: Vipin Malik <vipin.malik@daniel.com>,
    Alex Lennon <ajlennon@arcom.co.uk>, mtd@infradead.org,
    jffs-dev <jffs-dev@axis.com>, linuxbios@lanl.gov
Subject: Re: Elan SC520 - problem with MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 24 Apr 2001 13:28:58 +0100
Message-ID: <18549.988115338@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rob@sysgo.de said:
>  I have some code that does the basic SC520 initialization right after
> reset and I am now trying to initialize the Super I/O chip (I have
> just received the chip manual from Acerlabs). After that, I need to
> figure out a way to setup the set up the PCI bridge... Another thing
> that is still missing in my code is a proper RAM size detection. 

> So any working code you might have along these lines -no matter how
> ugly- would probably be helpful to me.

Talk to the LinuxBIOS people. They have much of this working.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
