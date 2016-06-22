Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFiuN-0000E3-Sg
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 14:13:37 +0000
Date: Wed, 22 Jun 2016 16:13:04 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Artem
 Bityutskiy <dedekind1@gmail.com>, Alexander Kaplan <alex@nextthing.co>,
 Brian Norris <computersforpeace@gmail.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Subject: Re: [RFC] Raising the UBI version
Message-ID: <20160622161304.6a16da85@bbrezillon>
In-Reply-To: <576A9B1D.3010201@nod.at>
References: <57699356.4030802@nod.at> <20160622144344.07ba4d41@bbrezillon>
 <576A989A.6080502@nod.at> <20160622160118.28a4339a@bbrezillon>
 <576A9B1D.3010201@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 Jun 2016 16:05:17 +0200
Richard Weinberger <richard@nod.at> wrote:

> Am 22.06.2016 um 16:01 schrieb Boris Brezillon:
> > On Wed, 22 Jun 2016 15:54:34 +0200
> > Richard Weinberger <richard@nod.at> wrote:
> >   
> >> Am 22.06.2016 um 14:43 schrieb Boris Brezillon:  
> >>> Why do we need to hardcode /sys/class/ubi/version to 1? We just need to
> >>> update the mtd-utils to support version 2. Am I missing something?    
> >>
> >> We don't want to break existing userspace.
> >> Why should ubimkvol or ubiattach fail on a system with SLC NAND and
> >> CONFIG_MTD_UBI_CONSOLIDATE=y?  
> > 
> > But version won't be set to 2 in this case. If it's an SLC NAND we
> > don't need to use UBI version 2, do we.  
> 
> /sys/class/ubi/version is the version of the UBI implementation,
> not the version of the attached UBI image.
> It will the here as soon you load the UBI module.

Do we have /sys/class/ubi/ubiX/version for the UBI image version?
This is still unclear to me why we need to version the
user-space/kernel-space ABI, since it's supposed to be backward
compatible, so adding new features requires adding new ioctls and
keeping the old ones in a working state.

What is /sys/class/ubi/version actually encoding? Isn't it encoding the
fact that a specific UBI implementation is supporting all UBI on-flash
formats up to format version X (that was my understanding)?
