Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MGrsn-00039w-Qh
	for linux-mtd@lists.infradead.org; Wed, 17 Jun 2009 09:56:49 +0000
Subject: Re: UBI Create or Update Volume
From: Artem Bityutskiy <dedekind@infradead.org>
To: brij.singh@samsung.com
In-Reply-To: <27450855.94721245231184009.JavaMail.weblogic@epml07>
References: <27450855.94721245231184009.JavaMail.weblogic@epml07>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 17 Jun 2009 12:56:30 +0300
Message-Id: <1245232590.9487.9.camel@localhost.localdomain>
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

[Very difficult to read your email due to
looooooooooooonnnnnnnnnnnnnnnnnnngggggggggggggggggg
lines]

Hi,

On Wed, 2009-06-17 at 09:33 +0000, BRIJESH SINGH wrote:
> Hi Artem, 
>      Just came across the ubi_change_vtbl_record function. If first copy is written successfully and error occurs while writing second copy, this function still returns error. And hence the creation or change in Volume becomes unsuccessful. So applications consider it failure.
> 
>    But if I unmount now, (clean or unclean) the first copy will become valid and second will be called corrupted (during mount time). It's not correct.
>    So should ubi_change_vtbl_record  call flush wl and  return success? Because 2nd copy(old) is unmapped till now.And should UBI go to read-only mode?

Yes, sounds right. Would you send a patch?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
