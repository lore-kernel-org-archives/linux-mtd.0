Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dR3mx-0001st-Lm
 for linux-mtd@lists.infradead.org; Fri, 30 Jun 2017 21:49:21 +0000
Received: by mail-vk0-x22a.google.com with SMTP id r125so73409423vkf.1
 for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2017 14:48:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170629190120.21245-1-harpreet@nestlabs.com>
References: <20170629190120.21245-1-harpreet@nestlabs.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 30 Jun 2017 18:48:57 -0300
Message-ID: <CAOMZO5C-KMf_DDe2iQATi05AD0dMEV_yqig5Cx7LemkfEAi+UQ@mail.gmail.com>
Subject: Re: [PATCH] mtd-utils: tests: Add Erased Pages Bit Flip Test
To: Harpreet Eli Sangha <harpreet@nestlabs.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Harpreet,

On Thu, Jun 29, 2017 at 4:01 PM, Harpreet Eli Sangha
<harpreet@nestlabs.com> wrote:
> From: "Harpreet \"Eli\" Sangha" <harpreet@nestlabs.com>
>
> Bit flip detection for written and erased pages tend to have different
> implementations. Where written pages are detected and corrected using
> ECC, erased pages are typically detected by ensuring that the number of
> zeros is less than a specified threshold.
>
> As such, it's necessary to have the 'nandbiterrs' test support the
> testing of written and erased pages. Bit flips in erased pages are
> emulated by rewriting the page in raw mode, to prevent the use of ECC.
>
> Signed-off-by: Harpreet "Eli" Sangha <harpreet@nestlabs.com>

Looks like you missed to add David on Cc once again.

A nitpick: your From and Signed-off-by still do not match.

The From field has two \ character , which is not very common.
