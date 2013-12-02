Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnZbA-0007Zu-6o
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2013 19:56:05 +0000
Received: by mail-ie0-f179.google.com with SMTP id x13so21101829ief.24
 for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2013 11:55:42 -0800 (PST)
Date: Mon, 2 Dec 2013 11:55:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Rosenberger, Philipp" <Philipp.Rosenberger@xse.de>
Subject: Re: [PATCH] of_mtd: Fix header file include guard
Message-ID: <20131202195538.GC9468@ld-irv-0074.broadcom.com>
References: <52972EEE.8070704@xse.de>
 <20131129081113.GA20013@norris.computersforpeace.net>
 <52985D12.6060901@xse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52985D12.6060901@xse.de>
Cc: Grant Likely <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Rob Herring <rob.herring@calxeda.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Philipp,

On Fri, Nov 29, 2013 at 09:22:44AM +0000, Rosenberger, Philipp wrote:
> Thanks for your replay and all the hints about submitting the correct
> way. Is it ok to paste the full git format-patch output like this?
> 
> From a2e84efe0d5335547ca3e6c0a8bf8a026b0f2353 Mon Sep 17 00:00:00 2001
> From: Philipp Rosenberger <philipp.rosenberger@xse.de>
> Date: Thu, 28 Nov 2013 12:36:52 +0100
> Subject: [PATCH] of_mtd: Fix header file include guard
> 
> It seems the include guard was copied from of_net.h.
> 
> Signed-off-by: Philipp Rosenberger <philipp.rosenberger@xse.de>
> ---
>  include/linux/of_mtd.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
> index 6f10e93..cb32d9c 100644
> --- a/include/linux/of_mtd.h
> +++ b/include/linux/of_mtd.h
> @@ -7,7 +7,7 @@
>   */
> 
>  #ifndef __LINUX_OF_MTD_H
> -#define __LINUX_OF_NET_H
> +#define __LINUX_OF_MTD_H
> 
>  #ifdef CONFIG_OF_MTD
> 
> --
> 1.7.9.5

That's workable for me, but that's not quite the standard way. The
git-format-patch output is meant to be mailed directly (via
git-send-email, for instance), not pasted into another email. If you
paste it, then git-am will see two sets of email headers and may not
understand it.

> On 29.11.2013 09:11, Brian Norris wrote:
> > + device tree guys
> >
> > Hi Grant/Rob,
> >
> > It looks like this header is technically owned by you guys. Once we have
> > a proper submission, should I merge this sort of change through MTD, or
> > do one of you want to take care of it?

Unless someone complains soon, I'll take this via MTD. No one else
should be creating conflicts on this file anyway.

...
> >> Confidentiality Notice: This e-mail message, including any attachments, is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by return e-mail and destroy all copies of the original message.
> >
> > This confidentiality notice is incongruous with sending patches to a
> > public mailing list, for inclusion in an open source project. This
> > message (combined with a lack of a Signed-off-by) means we cannot take
> > your patch. Please remove this footer and resubmit, with a CC to
> > linux-mtd@infradead.org and devicetree@vger.kernel.org.
> >
> > Thanks,
> > Brian
> >
> >
> 
> Thank you for this hint. I forgot that the mailserver append this
> footer. I hope now there is no company footer anymore.

Looks good now. Thanks.

Pushed to l2-mtd.git.

Brian
