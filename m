Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSfnw-0001KY-Dn
 for linux-mtd@lists.infradead.org; Thu, 28 Jul 2016 07:32:28 +0000
Received: by mail-oi0-x233.google.com with SMTP id w18so51609860oiw.3
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2016 00:32:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <DB4PR07MB062499D49F50F0923E2DE33BF2000@DB4PR07MB0624.eurprd07.prod.outlook.com>
References: <DB4PR07MB062499D49F50F0923E2DE33BF2000@DB4PR07MB0624.eurprd07.prod.outlook.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 28 Jul 2016 09:32:05 +0200
Message-ID: <CAFLxGvz+5rKiK5si4XtPKkHtJwJ=nub6xDMxOyMfYqQZrdzRLA@mail.gmail.com>
Subject: Re: how to create one ubifs image support both for different page
 size and sector size?
To: "Zhou, John (Nokia - CN/Hangzhou)" <john.zhou@nokia.com>
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

John,

On Thu, Jul 28, 2016 at 8:37 AM, Zhou, John (Nokia - CN/Hangzhou)
<john.zhou@nokia.com> wrote:
> Dear Experts
>
> I am facing a problem about one flash image support for both spansion and micron flash chip which has different page/sector size.
>
> What means if I create the flash image from spansion chip , it can't be used on micron chip, vice versa.
>
> Do you know how to solve this problem?

You need to have two images. When min IO and LEB size don't match you
can't re-use the image.

-- 
Thanks,
//richard
