Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUepE-0000aN-Sb
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 14:03:38 +0000
Received: by laap9 with SMTP id p9so643178laa.36
 for <linux-mtd@lists.infradead.org>; Wed, 16 May 2012 07:03:34 -0700 (PDT)
Date: Wed, 16 May 2012 17:03:24 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/7] [RFC] UBI: Export next_sqnum()
Message-ID: <20120516170324.337f2932@pixies.home.jungo.com>
In-Reply-To: <1337101871-31181-2-git-send-email-richard@nod.at>
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337101871-31181-2-git-send-email-richard@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Tue, 15 May 2012 19:11:05 +0200 Richard Weinberger <richard@nod.at> wrote:
> The fastmap mechanism needs to read the next sequence nummber
> directly.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/eba.c |   18 +++++++++---------
>  drivers/mtd/ubi/ubi.h |    1 +
>  2 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index bd5fdbf..d75677d 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -57,7 +57,7 @@
>   * global sequence counter value. It also increases the global sequence
>   * counter.
>   */
> -static unsigned long long next_sqnum(struct ubi_device *ubi)
> +unsigned long long ubi_next_sqnum(struct ubi_device *ubi)

Minor nit.

Comment above the function should have been changed too.
(look for the "next_sqnum - get next sequence number" comment)

Other than that,
Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Regards,
Shmulik
