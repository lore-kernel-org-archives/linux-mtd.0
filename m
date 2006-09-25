Received: from nf-out-0910.google.com ([64.233.182.186])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GRo3f-0003dF-48
	for linux-mtd@lists.infradead.org; Mon, 25 Sep 2006 11:51:31 +0100
Received: by nf-out-0910.google.com with SMTP id l37so1562341nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Sep 2006 03:50:25 -0700 (PDT)
Message-ID: <625fc13d0609250350t3434dd69r72c1fc92fcfbc622@mail.gmail.com>
Date: Mon, 25 Sep 2006 05:50:25 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: ajain@neomagic.com
Subject: Re: Questions regarding JFFS2/NAND
In-Reply-To: <071301c6e082$985f23a0$561fa8c0@pcajain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <071301c6e082$985f23a0$561fa8c0@pcajain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/25/06, Ajay Jain <ajain@neomagic.com> wrote:
>
> 1. Is it possible to run JFFS2 on NAND Flash on 2.4. I am seeing that
> the mtd website mentions that it is not supported. I do not clearly
> understand what it means. Does it mean that mtd guys do not support it,
> or does it mean that you can't run JFFS2 on nand in 2.4 at all.

The latter.  Unless you attempt to backport the code from 2.6.  And
that is definitely unsupported.

> 3. Because of this, we backported 'mtd' from 2.6 version. Now the mtd
> appears to be reasonably stable. But we still have the old jffs2 in
> place. The new mtd does not allow unaligned writes, but jffs2 (the old
> one) keeps sending unaligned requests. We modified the mtd layer to
> handle this, but then the issue is that we are writing to the same page
> again and again, as the writes are unaligned. But the ecc value can only
> be written once. So this solution will not work either. It does work if
> we switch off the ecc. Are you aware of any of these issues, is my
> observation correct.

You would need newer JFFS2.

> 4. Is it realistically possible to backport 2.6 JFFS2 to 2.4.

No, not really.

> Please help me to solve these issues. We want to run JFFS2 on 2.4/NAND.

http://linux-mtd.infradead.org/source.html#kernelversions

josh
