Received: from mail-vc0-x236.google.com ([2607:f8b0:400c:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1roC-0004Qz-CT
 for linux-mtd@lists.infradead.org; Fri, 19 Dec 2014 07:17:08 +0000
Received: by mail-vc0-f182.google.com with SMTP id hq12so137422vcb.27
 for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2014 23:16:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAK6Zt3xuzVO+wZL9Ee4rLrmiqYUKGqb6uXgto482zWjUoftYg@mail.gmail.com>
References: <1418945601-27388-1-git-send-email-dehrenberg@chromium.org>
 <549366C4.5060802@vanguardiasur.com.ar>
 <CAAK6Zt3xuzVO+wZL9Ee4rLrmiqYUKGqb6uXgto482zWjUoftYg@mail.gmail.com>
Date: Fri, 19 Dec 2014 08:16:46 +0100
Message-ID: <CAFLxGvyLC7QakDV+OB+PeT96W87KDuk0-OjP4vSuBfza2SiZ5g@mail.gmail.com>
Subject: Re: [PATCH v4] UBI: block: Continue creating ubiblocks after an
 initialization error
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Daniel Ehrenberg <dehrenberg@google.com>
Content-Type: text/plain; charset=UTF-8
Cc: Grant Grundler <grundler@chromium.org>,
 Gwendal Grignou <gwendal@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 19, 2014 at 1:52 AM, Daniel Ehrenberg <dehrenberg@google.com> wrote:
> On Thu, Dec 18, 2014 at 3:44 PM, Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
>> I think you should re-send on top of linux-next. Commit
>> 326087033108e7806e24974f2c8271f95cddaf3a has changed the way
>> user messages are printed.
>>
>> Other than that, the patch looks good:
>>
>> Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>
> Hi,
>
> When you say linux-next, do you mean Linus's linux-next? I had based
> my patch on linux-mtd.git's master branch (based on what I saw at
> http://www.linux-mtd.infradead.org/source.html#kernelversions) but
> apparently that doesn't include the patch you mention, whereas Linus
> does have it. Is Linus's linux-next where to find the most up-to-date
> version of the MTD code, or is there another repository that includes
> bleeding-edge stuff?

You want the most current UBI stuff. :-)
git://git.infradead.org/linux-ubifs.git

-- 
Thanks,
//richard
