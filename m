Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mbVi-0001XP-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 15:52:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NCBBIINEHIPFGJPLBEIFOEKHDLAA.acurtis@onz.com> 
References: <NCBBIINEHIPFGJPLBEIFOEKHDLAA.acurtis@onz.com> 
To: acurtis@onz.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: 64-bit support..what happened? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Sep 2002 15:51:55 +0100
Message-ID: <2249.1031151115@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

acurtis@onz.com said:
>  As you mentioned, although my architecture has a 64-bit bus, the only
> way to perform a 64-bit bus access is through the floating point
> processor. Do you see any reason why I couldn't just perform 2 32-bit
> operations? 

Er, I suppose not. Defeats the whole point of interleaving, but I don't see 
a reason why it shouldn't _work_, offhand, hardware permitting.

> I will take physmap.c as an example and make our own version. However
> good sample code would include the proper headers if they reference
> conditional defines. (slight jab...sorry) 

You're right. It looks like the code snippet in physmap.c is in fact a 
_bad_ example and has been copied into two new map files.

> I believe that there are 3 files under map that include the conditional
> compile and none of them include the proper header file. Perhaps this 
> just indicates that the conditional should be moved to another file or
> change to use the autoconfig defines? 

I'm inclined to suggest that it should be removed from all three offending
map files and a new example for 64-bit operation be added; physmap64.c. And
you should only be able to enable physmap64.c in the config if you've
enabled 64-bit operation -- so it shouldn't need any conditionals at all.

Does that sound sane?

--
dwmw2
