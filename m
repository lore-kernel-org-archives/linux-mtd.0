Received: from wf-out-1314.google.com ([209.85.200.173])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoTAt-00071H-1z
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 00:49:27 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1832326wff.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Apr 2008 17:49:25 -0700 (PDT)
Message-ID: <9c9fda240804221749u4c235a3fv54926f8acfd2e605@mail.gmail.com>
Date: Wed, 23 Apr 2008 09:49:25 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] [MTD][OneNAND] Multi Level Chip (MLC) OneNAND support
In-Reply-To: <1208876816.9212.609.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080103000350.GA12237@party>
	<1208876816.9212.609.camel@pmac.infradead.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 23, 2008 at 12:06 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Thu, 2008-01-03 at 09:03 +0900, Kyungmin Park wrote:
>  > This patch enables the MLC OneNAND support
>  > Now it's basic support. We need to work more.
>  >
>  > In MLC, we use the 4KiB BufferRam instead of 2KiB.
>  > With this reason it is changed to read/write data from/to BufferRAM 0 and
>  > we can't use read-while-load.
>  >
>  > It passed the nand-tests module and it diffed against the OneNAND MTD tree instead of MTD one.
>
>  Did you intend this to be merged?
>

Yes, Before merge this one
Another patch should be merged first.

"[JFFS2] JFFS2 doesn't use OOB at MLC NAND/OneNAND"
http://patchwork.ozlabs.org/linux-mtd/patch?id=16536

Could you first merge it first? then I will resend the patch against
the latest tree.

Thank you,
Kyungmin Park
