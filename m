Received: from rv-out-0910.google.com ([209.85.198.187])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGrZo-0007Ly-9v
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 03:28:15 -0400
Received: by rv-out-0910.google.com with SMTP id g11so603825rvb
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Aug 2007 00:27:58 -0700 (PDT)
Message-ID: <a8e1da0708030027n38c18e34ld8bc18fc103179f8@mail.gmail.com>
Date: Fri, 3 Aug 2007 07:27:58 +0000
From: "Dave Young" <hidave.darkstar@gmail.com>
To: dwmw2@infradead.org
Subject: Re: MTD: pnc2000 iomem oops
In-Reply-To: <a8e1da0708010135we34a17dl604d9f8c3eb630f8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <a8e1da0708010135we34a17dl604d9f8c3eb630f8@mail.gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>On 8/1/07, Dave Young <hidave.darkstar@gmail.com> wrote:
> Hi,
> The pnc2000 probe function  cause oops. Possible reason is its iomem
> region not being remaped.
>
> I searched lkml history, the oops was reported at 2006-06-14, but still there.
> http://lkml.org/lkml/2006/6/14/59
>
> If the ioremap/iounmap can be added to it, is it the right fix?
>
Add the linux-mtd list as cc.
