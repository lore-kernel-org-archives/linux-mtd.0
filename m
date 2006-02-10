Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F7S8s-0007SG-1S
	for linux-mtd@lists.infradead.org; Fri, 10 Feb 2006 01:52:32 -0500
Message-ID: <43EC3824.2040805@ru.mvista.com>
Date: Fri, 10 Feb 2006 09:52:20 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: "Alexey, Korolev" <alexey.korolev@intel.com>
References: <43EA16CC.6060401@intel.com> <43EB83EC.5040701@intel.com>
In-Reply-To: <43EB83EC.5040701@intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Fixup in NAND bad block management + fix of misspring
 .(nand_base.c)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexey,

> You wrote
> >> +    /* If pattern is given we must use offset from badblock_pattern
> >> structure
> >> +       else we should use badblockpos which is filled by default
> >> values */
> >> +    if (this->badblock_pattern)
> >> +        badblockpos=this->badblock_pattern->offs;
> >> +    else
> >> +        badblockpos=this->badblockpos;
> >> +
>
> > I'm not sure this is right. If badblock_pattern is set, we shouldn't
> > ever be here.
>
> We definetely get here and badblock_pattern is given for the case of 
> ST Nand. This patch should fix bad block marking issues found on ST 
> Nand. Why we shouldn't be here if bad block pattern is given?
>
Because if bad block pattern is used, we should use bad block table. 
This is how I see it, though I can be wrong.

> Please see patch below. I believe there shouldn't be tab issues.
>
I'm afraid there still are. It's probably due to your mailer converting 
tabs to spaces.

Best regards,
    Vitaly
