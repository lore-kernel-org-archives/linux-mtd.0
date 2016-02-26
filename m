Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZDi9-00005a-5p
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 08:25:17 +0000
Message-ID: <1456475093.8024.14.camel@gmail.com>
Subject: Re: Filesystems over UBI can't handle badblocks
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Guilherme de Oliveira Costa <guilherme.oliveira@autotrac.com.br>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 26 Feb 2016 10:24:53 +0200
In-Reply-To: <CAFLxGvwmRSHG1r9CAKa+1q-H2AWtZpS_Lgj2VTRcJfNZCG8JDw@mail.gmail.com>
References: <7F9DB42F7DDA544EA3EB31D694929A30EB84DA@PERU.autotrac.corp>
 <1456397391.4719.30.camel@gmail.com>
 <CAFLxGvwmRSHG1r9CAKa+1q-H2AWtZpS_Lgj2VTRcJfNZCG8JDw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-02-25 at 22:10 +0100, Richard Weinberger wrote:
> On Thu, Feb 25, 2016 at 11:49 AM, Artem Bityutskiy <dedekind1@gmail.c
> om> wrote:
> > 
> > Now, how to do it via UBI? I think this is not supported, but it
> > can be
> > implemented, I believe.
> Implementing this is rather easy.

I agree.

>  But what exactly is the use case?

I guess the reporter would come up with a good justification.

I can imagine one, but it is not very strong: you have a development
device, you mess with bad blocks by marking/unmarking them for some
research reasons. You put UBI image there, then remember that some of
the blocks were bad and want to mark them as bad without re-flashing
UBI. Kind of a developer convenience.
