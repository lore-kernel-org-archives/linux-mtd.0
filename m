Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9Gae-0004gr-BP
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 17:09:49 +0000
Received: by mail-ie0-f169.google.com with SMTP id y20so10564977ier.0
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2015 09:09:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <0D23F1ECC880A74392D56535BCADD73526C0EA9A@NTXBOIMBX03.micron.com>
References: <CALupW3DF2BmHBjm11yiBMLFSwX-yNFeW3q_EDyEWsBQrFPU-xw@mail.gmail.com>
 <54AE04ED.8080002@vanguardiasur.com.ar>
 <CALupW3BrZpq1GwJL1VRw8adPUdhR8SmprveTtEOHAiG==AQ=Qw@mail.gmail.com>
 <0D23F1ECC880A74392D56535BCADD73526C0EA9A@NTXBOIMBX03.micron.com>
Date: Thu, 8 Jan 2015 09:09:20 -0800
Message-ID: <CALupW3BC1PE8hAGxsfZ4ABUy35vZeHxt6Kkq_yK=aoq9LV=cNQ@mail.gmail.com>
Subject: Re: NAND ECC capabilities
From: Steve deRosier <derosier@gmail.com>
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 8, 2015 at 8:38 AM, Jeff Lauruhn (jlauruhn)
<jlauruhn@micron.com> wrote:
> You might find this interesting http://www.cyclicdesign.com/index.php/ecc-trends-in-nand-flash.
>
>

Jeff,

Thanks for that.  The diagram on page 7 actually illustrates exactly
what I was getting at.  In my case, the ECC can handle 4-bits on each
512 sector, yet since the increment we handle in the higher levels is
per-page, we really need to set the threshold at a max of 4 (probably
3 as Richard points out) for the page.

- Steve
