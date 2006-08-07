Received: from ug-out-1314.google.com ([66.249.92.171])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GA396-0005ZI-Nd
	for linux-mtd@lists.infradead.org; Mon, 07 Aug 2006 07:19:49 -0400
Received: by ug-out-1314.google.com with SMTP id u40so14435ugc
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Aug 2006 04:19:42 -0700 (PDT)
Message-ID: <625fc13d0608070419x556292dek44db8bdc53459886@mail.gmail.com>
Date: Mon, 7 Aug 2006 06:19:42 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "KaiGai Kohei" <kaigai@kaigai.gr.jp>
Subject: Re: [PATCH] Add the latest xattr support on mtd-utils
In-Reply-To: <44D53DAE.5020803@kaigai.gr.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <44D53DAE.5020803@kaigai.gr.jp>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/5/06, KaiGai Kohei <kaigai@kaigai.gr.jp> wrote:
> Hi,
>
> This patch enables to pack xattr informations for _recent_ xattr
> implementation.
>
> When I posted a patch which enables to operate xattr on NAND
> flash by using delete marker at Jun, the format of xref node
> was a bit changed.
> As 'xseqno' was added into struct jffs2_raw_xref, I ought to
> post a patch to modify it. But I left for posting.
>
> Please apply it, Thanks.

KaiGai-san,

The patch looks good, however could you please resend it with a
Signed-of-by: line?

thx,
josh
