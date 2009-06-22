Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MIe3b-0004SF-9z
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 07:35:18 +0000
Subject: Re: [PATCH] [UBI] Volume table update fix
From: Artem Bityutskiy <dedekind@infradead.org>
To: Brijesh Singh <brij.singh@samsung.com>
In-Reply-To: <1245655796.9487.29.camel@localhost.localdomain>
References: <6b5362aa0906190401l51bcf28bg44b9a7a9f49aa773@mail.gmail.com>
	<1245655796.9487.29.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Jun 2009 10:34:28 +0300
Message-Id: <1245656068.9487.31.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-06-22 at 10:29 +0300, Artem Bityutskiy wrote:
> > +	if (copy > 0)
> > +		return 0;
> > +	else
> > +		return err;
> This is a tricky place, IMO, and deserves a comment. Could we have
> something like:
> 
> /*
>  * If the first volume table copy has been changed then overall the
>  * operation has succeeded, because the change would be there if we now
>  * re-attached the UBI device. Thus, return success in this case.
>  */
> 
This looks a bit more elegant:

/*
 * If the first volume table copy has been changed then overall the
 * operation has succeeded, because the change would be there if we now
 * re-attached the UBI device. Thus, return success in this case.
 */
return copy ? 0 : err;

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
