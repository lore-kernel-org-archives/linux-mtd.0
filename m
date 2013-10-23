Received: from mail-vb0-x236.google.com ([2607:f8b0:400c:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ72f-00019y-Es
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 22:36:42 +0000
Received: by mail-vb0-f54.google.com with SMTP id q12so815871vbe.41
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 15:36:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8738nraab0.fsf@dell.be.48ers.dk>
References: <1382560842-428-1-git-send-email-computersforpeace@gmail.com>
 <8738nraab0.fsf@dell.be.48ers.dk>
Date: Wed, 23 Oct 2013 15:36:18 -0700
Message-ID: <CAN8TOE8u4-Qe5Raw8dnuppvrWJms-N1ogXdTNLhFBNJTxvkf0Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Macronix mx25l3255e
From: Brian Norris <computersforpeace@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 23, 2013 at 3:31 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Brian" == Brian Norris <computersforpeace@gmail.com> writes:
>
>  > A new 32Gbit SPI NOR flash from Macronix. Nothing special.
>
> Presumably you mean Mbit?

Yes. In fact, this very thought popped into my head an hour ago, where
I thought I recalled mistyping Mbit as Gbit...

I'll fix this and send v2. Thanks.

Brian
