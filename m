Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mcUS-0001p5-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:54:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NCBBIINEHIPFGJPLBEIFIEKODLAA.acurtis@onz.com> 
References: <NCBBIINEHIPFGJPLBEIFIEKODLAA.acurtis@onz.com> 
To: acurtis@onz.com
Cc: "Jasmine Strong" <jasmine@hex.linuxgrrls.org>,
    "John Hall" <John.Hall@optionexist.co.uk>,
    "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Sep 2002 16:54:28 +0100
Message-ID: <10914.1031154868@redhat.com>
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
>  Just pick a method that will work for all. No sense in cluttering the
> code with conditional compile stuff because we can not choose an
> implementation. How about we make the flags element either a byte or a
> word depending on architecture. This would only result in a structure
> redefinition and not affect the rest of the code. 

If we're going to do that, we might as well just use a byte and not even 
have the #define.

In the common case, on the architectures where stuff will be aligned, the 
compiler will automatically pad that out so it takes 32 bits anyway, and 
there's no difference. In the case where the compiler doesn't pad, we gain 
three bytes per object.

If we're not going to avoid those 32 bits in the common case, it's not 
really worth the effort.

--
dwmw2
