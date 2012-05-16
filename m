Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUeuo-0001bb-Lh
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 14:09:23 +0000
Received: by lbbgg6 with SMTP id gg6so658594lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 16 May 2012 07:09:20 -0700 (PDT)
Date: Wed, 16 May 2012 17:09:15 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/7] [RFC] UBI: Export compare_lebs()
Message-ID: <20120516170915.55675b6a@pixies.home.jungo.com>
In-Reply-To: <1337101871-31181-3-git-send-email-richard@nod.at>
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337101871-31181-3-git-send-email-richard@nod.at>
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

On Tue, 15 May 2012 19:11:06 +0200 Richard Weinberger <richard@nod.at> wrote:
> The fastmap mechanism needs this funtion,
> rename it to ubi_compare_lebs() and export it.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/scan.c |    8 ++++----
>  drivers/mtd/ubi/ubi.h  |    4 ++++
>  2 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Regards,
Shmulik
