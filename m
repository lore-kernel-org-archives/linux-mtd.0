Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rcNV-0002vw-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 10:11:29 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rcNT-0002vB-00
	for mtd@infradead.org; Mon, 23 Apr 2001 10:11:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000001c0cb83$f2a185c0$6401a8c0@home.at> 
References: <000001c0cb83$f2a185c0$6401a8c0@home.at> 
To: "Erwin Authried" <eauth@softsys.co.at>
Cc: mtd@infradead.org
Subject: Re: Makefile for 2.0 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 23 Apr 2001 10:10:59 +0100
Message-ID: <4590.988017059@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


eauth@softsys.co.at said:
> I just tried to compile the rearranged sources with the 2.0 kernel, it
> seems that the Makefile doesn't support 2.0 anymore. There are no .o
> files produced, besides an empty mtdlink.o. What's the  purpose of
> GNUmakefile? 

The GNUmakefile is there to make compilation on 2.0 and 2.2 kernels work, 
as well as compilation outside the source tree. GNU make will use that file 
first, in preference to the Makefile in the same directory. That means I 
can have perfectly clean 2.4-style Makefiles and use the GNUmakefile trick 
to make them work in other kernels.

Note the trick with setting TOPDIR so that the Makefile includes the 
_local_ Rules.make file, which has the necessary fixups so that everything 
actually works.

Evidently I missed something, but it _ought_ to work.

ifeq ($(VERSION),2)
 ifneq ($(PATCHLEVEL),4)
  ifneq ($(PATCHLEVEL),5)
   OLDTOPDIR := $(TOPDIR)
   TOPDIR := $(shell pwd)
  endif
 endif
endif

include Makefile

ifeq ($(VERSION),2)
 ifeq ($(PATCHLEVEL),0)
   O_OBJS += initcalls.o
  endif
endif


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
