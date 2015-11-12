Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwqDW-0005rP-TY
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 11:39:03 +0000
Received: by oige206 with SMTP id e206so31198733oig.2
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 03:38:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151112112014.GA22505@dw-nb.local>
References: <20151112112014.GA22505@dw-nb.local>
Date: Thu, 12 Nov 2015 12:38:41 +0100
Message-ID: <CAFLxGvxJcaqWLf-3scEWSLye90PqRVcBsuCgFE98R+buWWCASQ@mail.gmail.com>
Subject: Re: [PATCH] mkfs.ubifs: fix compiler warning for WITHOUT_LZO
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Daniel Walter <dwalter@sigma-star.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 12:20 PM, Daniel Walter <dwalter@sigma-star.at> wrote:
> Fix compiler warning for WITHOUT_LZO builds
>
> Signed-off-by: Daniel Walter <dwalter@sigma-star.at>

Please add the compiler warning into the commit message
such that google can find this patch by searching for the message.

-- 
Thanks,
//richard
