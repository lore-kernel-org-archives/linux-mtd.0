Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8Z2O-00083E-4O
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 12:12:28 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KK7004308KDF2@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 25 May 2009 21:12:13 +0900 (KST)
Received: from apgmoorthy ([107.108.214.61])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KK7008UD8KAUC@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 25 May 2009 21:12:13 +0900 (KST)
Date: Mon, 25 May 2009 17:44:44 +0530
From: apgmoorthy <moorthy.apg@samsung.com>
Subject: RE: [patch 01/14] mtd: Flex-OneNAND support
In-reply-to: <1243251718.21646.107.camel@localhost.localdomain>
To: dedekind@infradead.org
Message-id: <397762C131764F2DA9B93371204797C9@sisodomain.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 7BIT
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243251718.21646.107.camel@localhost.localdomain>
Cc: vishak.g@samsung.com, amul.saha@samsung.com, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Monday, May 25, 2009 5:12 PM dedekind@infradead.org wrote :

>> 
>> I tried on the MTD Git  and have seen the warning as you mentioned.
>> '#ifndef MODULE' around the function 'flexonenand_setup' should help to get away with that warning.
>> We will post a patch.
>> 
>> Against which Fork , the patch should be ? 

>Dunno. Probably 2.6.30-rc7?
        - Then is it on linus-fallBack fork of MTD 2.6 Git ?
          You tried on Which Git/Fork ? 
    
> Also, I think the loooong printk's lines in the patch are ugly. If you could make them nicer, it'd be cool. 
> But whole MTD is full of printk's like this, so I did not complain about that.
        - Got your concern , but felt the printk's convey to their purpose.
 
>I wanted to take your patch to my l2-mtd-2.6.git tree, and then ping dwmw2 to pull from it. But because of the warning and these ugly printk's I decided >that I will rather not do this so far.
        
>Also, I'm not sure about #ifndef MODULE. AFAIK, the whole '__setup()' thing is not supposed to be used in drivers.     
>But I'm not sure. I'll leave this for Andrew to comment on :-)
           - OK , But this is the way we see to make the Boundary Setting User Configurable , without compiling the Kernel.

With Regards
 Moorthy
         
