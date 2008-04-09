Received: from hs-out-0708.google.com ([64.233.178.246])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JjjNS-0004K7-Dw
	for linux-mtd@lists.infradead.org; Wed, 09 Apr 2008 23:06:50 +0000
Received: by hs-out-0708.google.com with SMTP id k27so2018774hsc.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Apr 2008 16:06:49 -0700 (PDT)
Message-ID: <47FD4C1F.6010001@gmail.com>
Date: Wed, 09 Apr 2008 19:07:11 -0400
MIME-Version: 1.0
To: Bruce_Leonard@selinc.com
Subject: Re: mtd->size revisited
References: <OF1E779C97.22C47CCA-ON88257426.007A4C73-88257426.007C6F5B@selinc.com>
In-Reply-To: <OF1E779C97.22C47CCA-ON88257426.007A4C73-88257426.007C6F5B@selinc.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
From: Vernon Sauder <vernoninhand@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bruce_Leonard@selinc.com wrote:
> I know that just changing it isn't all that's involved.  I've alredy gone 
> through some of the pain of changing 32-bit division to 64-bit shifts and 
> masks.  A larger concern of mine is ripple effects.  I know that this 
> field is referenced in a lot of places, most of which are pretty benign, 
> and others that are less so.  A good example is in .../mtd/mtdblock.c 
> where this happens: dev->size = mtd->size >> 9.  I don't know right off 
> the top of my head what struct mtd_blktrans_dev->size is used for, but I 
> can pretty well bet that a 64-bit value shifted right by nine ain't gonna 
> fit.  So then this ripples into making changes to mtd_blktrans_dev.  Wow. 
> This could end up going a long way.  Plus, I know there are a couple of 
> drivers that make use of this field and I expect that if I make this 
> change, I'll be responsible for makeing the changes to the drivers. 
> However, I can't test those changes since I don't have the HW.  How is 
> that going to be received by the community and the maintainers of those 
> drivers?
>
> So, as I said, I'm willing to tackle this, but I need to get a sense of 
> how long it's going to take me.  I need an idea of how long it would take 
> someone with experiance with MTD and I can then translate that (roughly :) 
>  ) into how long it should take me.  I also need guidence on how to deal 
> with things that I can't test.
>
> Thanks for any help and direction.
>
> Bruce
>   

While I agree that it would be great to support larger devices, I'm 
going to ask a dumb question: does this have to grow to a 64-bit number? 
Can it be in KB or something? If device sizes are always divisible by 
1KB, we don't need the bottom 10 bits anyway. That would seem an easier 
change in some ways.

Vern
