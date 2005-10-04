Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EMmRz-00069p-8y
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2005 14:03:20 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j94D2vtd004968
	for <linux-mtd@lists.infradead.org>; Tue, 4 Oct 2005 09:02:57 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j94D2uhH058796
	for <linux-mtd@lists.infradead.org>; Tue, 4 Oct 2005 09:02:56 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j94D2uM8011276
	for <linux-mtd@lists.infradead.org>; Tue, 4 Oct 2005 09:02:56 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <434264A0.5000708@yandex.ru>
References: <1128125846.6926.120.camel@localhost.localdomain>
	<434264A0.5000708@yandex.ru>
Content-Type: text/plain
Date: Tue, 04 Oct 2005 08:02:43 -0500
Message-Id: <1128430963.20490.3.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2, symlink, and 2.6.13
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-10-04 at 15:16 +0400, Artem B. Bityutskiy wrote:
> Peter Grayson wrote:
> > For those on earlier kernel versions, this change will yield compiler
> > warnings. I am not sure what the policy is for maintaining compatibility
> > with older kernel versions, so I did not include any changes to
> > compatmac.h. Do we want to reproduce the struct inode_operations
> > declaration in compatmac.h just so that latest mtd does not yield
> > compiler warnings on older kernels?
> 
> The patch looks OK. Not sure how to support compatimility, I would just 
> let gcc print warnings in older kernels. And it looks like it is 
> harmless. Anyone, comments?

I'd rather it be added to compatmac.h.  We have things in there that
support older 2.6 kernels already, so adding another wouldn't hurt.
There's even a section for kernels older than 2.6.13 already.

josh
