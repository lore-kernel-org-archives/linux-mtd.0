Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1lo0-0002Uy-Rr
 for linux-mtd@lists.infradead.org; Fri, 19 Dec 2014 00:52:33 +0000
Received: by mail-ob0-f179.google.com with SMTP id va2so8549319obc.10
 for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2014 16:52:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <549366C4.5060802@vanguardiasur.com.ar>
References: <1418945601-27388-1-git-send-email-dehrenberg@chromium.org>
 <549366C4.5060802@vanguardiasur.com.ar>
Date: Thu, 18 Dec 2014 16:52:10 -0800
Message-ID: <CAAK6Zt3xuzVO+wZL9Ee4rLrmiqYUKGqb6uXgto482zWjUoftYg@mail.gmail.com>
Subject: Re: [PATCH v4] UBI: block: Continue creating ubiblocks after an
 initialization error
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
Cc: Grant Grundler <grundler@chromium.org>,
 Gwendal Grignou <gwendal@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 18, 2014 at 3:44 PM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> I think you should re-send on top of linux-next. Commit
> 326087033108e7806e24974f2c8271f95cddaf3a has changed the way
> user messages are printed.
>
> Other than that, the patch looks good:
>
> Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Hi,

When you say linux-next, do you mean Linus's linux-next? I had based
my patch on linux-mtd.git's master branch (based on what I saw at
http://www.linux-mtd.infradead.org/source.html#kernelversions) but
apparently that doesn't include the patch you mention, whereas Linus
does have it. Is Linus's linux-next where to find the most up-to-date
version of the MTD code, or is there another repository that includes
bleeding-edge stuff?

Thanks,
Dan
