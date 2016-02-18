Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aWKry-0005Vr-Mt
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2016 09:27:31 +0000
Received: by mail-ob0-x22f.google.com with SMTP id gc3so56831865obb.3
 for <linux-mtd@lists.infradead.org>; Thu, 18 Feb 2016 01:27:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56C57F32.8080301@mlbassoc.com>
References: <56C57F32.8080301@mlbassoc.com>
Date: Thu, 18 Feb 2016 10:27:09 +0100
Message-ID: <CAFLxGvwzdcTs+hLoOCzc26VcxD08bke92EfHVVbmRgoqrooMpA@mail.gmail.com>
Subject: Re: NAND dump questions
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
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

Hi!

On Thu, Feb 18, 2016 at 9:22 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> I'm trying to use 'nanddump' to help me duplicate a NAND device.
> The idea is to provide a production lab with raw dumps, including
> OOB data for every page.  They have a programming machine which can
> take these dumps and program the device.  This process is interesting
> because we need to make thousands of identical devices and programming
> the NAND manually takes a lot of time & manpower.

[...]

> Any ideas what's going on here?  What else can I look at to diagnose the
> issue?
>
> Note: I've actually done this process on another system which is
> TI/OMAP Davinci based.  On that device (a different NAND chip and
> a different production lab), the duplication worked perfectly.

I read your mail and the first thing that alarmed me was, why OOB?
Can you please retry without OOB and which read errors do you get?
I bet uncorrectable ECC errors...

-- 
Thanks,
//richard
