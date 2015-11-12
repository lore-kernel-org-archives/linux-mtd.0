Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwr8E-0002KR-AE
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 12:37:38 +0000
Received: by obdgf3 with SMTP id gf3so45356893obd.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 04:37:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151103135002.GA21871@dw>
References: <20151103135002.GA21871@dw>
Date: Thu, 12 Nov 2015 13:37:17 +0100
Message-ID: <CAFLxGvxBSmjG+C3cL=VA_7FtabCKuwRG9o_g9LF3Y+c3YH2Juw@mail.gmail.com>
Subject: Re: [PATCH] Fix scanf() formatstring for modern C version
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Daniel Walter <dwalter@sigma-star.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 3, 2015 at 2:50 PM, Daniel Walter <dwalter@sigma-star.at> wrote:
> mkfs.jffs2 is using an old assignment-allocation
> modifier for scanf(). Add a check so this modifier
> does not get confused with a float formatstring
> on newer C standard (C99 onwards).
>
> Signed-off-by: Daniel Walter <dwalter@sigma-star.at>

Applied and pushed!

-- 
Thanks,
//richard
