Received: from mail-yh0-x236.google.com ([2607:f8b0:4002:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcAnG-0008Aw-BS
 for linux-mtd@lists.infradead.org; Sun, 29 Mar 2015 10:50:15 +0000
Received: by yhim52 with SMTP id m52so50587290yhi.2
 for <linux-mtd@lists.infradead.org>; Sun, 29 Mar 2015 03:49:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1427402596-28081-1-git-send-email-richard@nod.at>
References: <1427402596-28081-1-git-send-email-richard@nod.at>
Date: Sun, 29 Mar 2015 12:49:50 +0200
Message-ID: <CAFLxGvy5-_vJQ_NF_TM0Qdg6SyavOftdn=Z4RFXwLSJkEV3vqw@mail.gmail.com>
Subject: Re: [PATCH] UBI: Fastmap: Fall back to scanning mode after ECC error
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Alexander.Block@continental-corporation.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 26, 2015 at 9:43 PM, Richard Weinberger <richard@nod.at> wrote:
> If we encounter an uncorrectable ECC error while scanning for the fastmap
> UBI must not fail hard. Instead fall back to scanning mode.
>
> Reported-by: Alexander Block <Alexander.Block@continental-corporation.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Pushed to linux-ubifs.git/master.

-- 
Thanks,
//richard
