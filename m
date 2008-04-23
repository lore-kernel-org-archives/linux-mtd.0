Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoZn0-00073z-Cp
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 07:53:15 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1955837wff.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 00:53:13 -0700 (PDT)
Message-ID: <bae050c10804230053y67b7a429yeda4e122fcb2e459@mail.gmail.com>
Date: Wed, 23 Apr 2008 15:53:13 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: ubi-utils
In-Reply-To: <1208936266.11721.25.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10804210148g7e36db07vd7df62e286da6490@mail.gmail.com>
	<1208769345.5965.363.camel@sauron>
	<bae050c10804210243l848eeb6m97a33c5a65d5dfc6@mail.gmail.com>
	<1208776123.5965.367.camel@sauron>
	<bae050c10804210449w14e75e0wf977815c22423358@mail.gmail.com>
	<1208881852.11721.6.camel@sauron>
	<bae050c10804230027h6121713fw2f594d49d89e5137@mail.gmail.com>
	<1208936266.11721.25.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/23/08, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Wed, 2008-04-23 at 15:27 +0800, Nancy wrote:
> > OK, pass, will you please answer me one question:
> > Compare with attaching only 1 MTD device, attaching 2 MTD devices will
> > eat system resources a lot? will slow down the Nand write or read
> > speed?
> > All I need to know is the performances differences. Thanks a lot !
>
> As I understand you are talking about splitting your single chip on 2
> partitions and you are questioning about the difference between 1 big
> partition and 2 smaller.
>
> Well, I never tried this with real flash. But theoretically there should
> be no difference. But I do not recommend you doing this with your MLC
> NAND where an eraseblock survives just 10000 erase-cycles.

Ok, I got what you mean, the only difference is Nand lifetime. Thank you : )

-- 
Best wishes,
Nancy
