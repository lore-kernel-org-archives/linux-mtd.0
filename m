Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0SaY-0002b0-Pr
	for linux-mtd@lists.infradead.org; Tue, 11 Jul 2006 20:28:31 -0400
Received: by ug-out-1314.google.com with SMTP id m3so69133ugc
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Jul 2006 17:28:22 -0700 (PDT)
Message-ID: <625fc13d0607111728s5b4a81d1m66d60a044d20b498@mail.gmail.com>
Date: Tue, 11 Jul 2006 19:28:22 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Han Chang" <posaune@hotmail.com>
Subject: Re: File size limitation on JFFS2.
In-Reply-To: <BAY110-F114C65C46990C38A78E522BC690@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1152658911.25567.83.camel@shinybook.infradead.org>
	<BAY110-F114C65C46990C38A78E522BC690@phx.gbl>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/11/06, Han Chang <posaune@hotmail.com> wrote:
> David,
>
> Thanks for the info. I'm using 2.6.14. Moving to a 2.6.18-rc1 will be a too
> big of change for me unless it's absolutely necessary. I'm very interested
> in the knowing how to move to 32KiB node. Could you shed some light on this?

That will also require you to move to a newer kernel since the support
for it hasn't been written yet.  David was talking about future things
that could help your situation.

Btw, please don't top post.

josh
