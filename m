Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAhMH-0000o6-AX
 for linux-mtd@lists.infradead.org; Mon, 12 Jan 2015 15:56:50 +0000
Received: by mail-vc0-f176.google.com with SMTP id hq12so6844349vcb.7
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jan 2015 07:56:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1420994209-20980-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
References: <1420994209-20980-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Date: Mon, 12 Jan 2015 16:56:26 +0100
Message-ID: <CAFLxGvxBbnKugf49_7TtdLh-7QB3Hmv_iqjMqPFbGUDXBcy3yA@mail.gmail.com>
Subject: Re: [PATCH] jffs2: compr_rubin: Remove unused function
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 11, 2015 at 5:36 PM, Rickard Strandqvist
<rickard_strandqvist@spectrumdigital.se> wrote:
> Remove the function pulledbits() that is not used anywhere.
>
> This was partially found by using a static code analysis program called cppcheck.
>
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

Looks good to me.
Reviewed-by: Richard Weinberger <richard@nod.at>


-- 
Thanks,
//richard
