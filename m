Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Je4R-0008P4-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 18:16:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <00512BA4F9D3D311912A009027E9B8F407E4A3@NT> 
References: <00512BA4F9D3D311912A009027E9B8F407E4A3@NT> 
To: Dave Ellis <DGE@sixnetio.com>
Cc: 'Ken Offer' <koffer@arlut.utexas.edu>,
    "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Problem: 51MB partition max size on jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Dec 2002 18:46:59 +0000
Message-ID: <14294.1039027619@passion.cambridge.redhat.com>
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

DGE@sixnetio.com said:
>  kmalloc() is limited to 128K and the 128MB Flash needs more than
> twice that,

> so I tried vmalloc() and it seems to be OK (at least with PPC 2.4.18
> patched for the new MTD code). Does anyone know if this change is
> safe? 

You need to change the corresponding kfree() to vfree().

--
dwmw2
