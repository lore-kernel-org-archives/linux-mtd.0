Received: from nf-out-0910.google.com ([64.233.182.188])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ft6z1-0002hO-Sl
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 13:59:30 -0400
Received: by nf-out-0910.google.com with SMTP id p48so140480nfa
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Jun 2006 10:59:18 -0700 (PDT)
Message-ID: <625fc13d0606211059r6a20fd91lf0b08b0e20c330c0@mail.gmail.com>
Date: Wed, 21 Jun 2006 12:59:18 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: tglx@linutronix.de
Subject: Re: [PATCH] [NAND] S3C2410 convert prinks to dev_*()s
In-Reply-To: <1150909487.25491.11.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20060621144305.GA4207@home.fluff.org>
	<1150909487.25491.11.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/21/06, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Wed, 2006-06-21 at 15:43 +0100, Ben Dooks wrote:
> > Convert the use of printk() to the correct dev_info/dev_err
> > functions
> >
> > Signed-off-by: Ben Dooks <ben-linux@fluff.org>
>
> Thanks for the almost perfect patch :)
>
> [PATCH] [MTD] NAND: S3C2410 convert prinks to dev_*()s
>
> The mail filter sorts out the [PATCH] mails. My git-wrapper removes the
> leading [PATCH] so I get the format which we used in CVS already:

We should put that info on the website somewhere.  Most won't read it
anyway, but it's still worth put it there I think.

josh
