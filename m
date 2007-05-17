Received: from belize.chezphil.org ([80.68.91.122])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HokO6-0006BD-2c
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 14:07:45 -0400
Received: from localhost ([127.0.0.1] helo=chezphil.org)
	by belize.chezphil.org with esmtp (Exim 4.50) id 1Hoouk-000691-7l
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 23:57:42 +0100
To: <linux-mtd@lists.infradead.org>
Date: Thu, 17 May 2007 19:07:32 +0100
Subject: Re: alloc/free quesion in ixp4xx driver
Message-ID: <1179425252983@dmwebmail.belize.chezphil.org>
In-Reply-To: <loom.20070517T190229-463@post.gmane.org>
References: <loom.20070517T190229-463@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; format="flowed"
From: "Phil Endecott" <spam_from_linux_mtd@chezphil.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MikeW wrote:
> Phil Endecott <spam_from_linux_mtd <at> chezphil.org> writes:
>> - In ixp4xx_flash_probe(), a struct ixp4xx_flash_info in kalloc()ed.  
>> Where is it freed?
>> 
>> - In ixp4xx_flash_remove() you have:
>>        release_resource(info->res);
>>        kfree(info->res);
>>    In other places where release_resource() is called I do not see a 
>> call to kfree().  Is this right?

> Don't think it should kfree(info->res), the release_resource() sorts
> out the allocated mem region.
>
> But there should be a kfree(info) somewhere in the driver.
>
> My guess is that you have spotted a typo, and there should be a
> kfree(info) next, just outside the if (info->res) block.

Similar issues occur in integrator-flash.c, ixp2000.c, physmap.c and physmap_of.c.

I don't have hardware where mtd can be modular; like probably 99% of 
applications it's the root filesystem so it's hard to unload it.  But 
not being able to test it hasn't stopped me from writing a patch, which 
will follow shortly.  I hope that there's someone out there who can 
test it!

Phil.
