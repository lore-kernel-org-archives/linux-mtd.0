Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZupLT-0004f6-32
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 22:18:55 +0000
Received: by obdgf3 with SMTP id gf3so103222764obd.3
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2015 14:18:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAEAJfDEPj1nuLbPxcLvmnGUKWh7WNwXncTW2uTpD-3Sa3hz0A@mail.gmail.com>
References: <1445104555-30509-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <56228D96.7070408@nod.at>
 <CAAEAJfDEPj1nuLbPxcLvmnGUKWh7WNwXncTW2uTpD-3Sa3hz0A@mail.gmail.com>
Date: Fri, 6 Nov 2015 23:18:34 +0100
Message-ID: <CAFLxGvy-nzBEFY3R9BjVWZbZ26Z-G8WVRc8mnoaHE7N5hPgDEQ@mail.gmail.com>
Subject: Re: [PATCH] UBI: Fastmap: Fix PEB array type
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Richard Weinberger <richard@nod.at>, hs@denx.de,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 17, 2015 at 8:10 PM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> On 17 October 2015 at 15:04, Richard Weinberger <richard@nod.at> wrote:
>> Am 17.10.2015 um 19:55 schrieb Ezequiel Garcia:
>>> The PEB array is an array of __be32, so let's fix the
>>> scan_pool() prototype accordingly.
>>>
>>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Applied!

-- 
Thanks,
//richard
