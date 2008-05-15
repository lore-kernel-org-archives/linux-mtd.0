Received: from ug-out-1314.google.com ([66.249.92.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JwUk6-0006Vx-2q
	for linux-mtd@lists.infradead.org; Thu, 15 May 2008 04:06:59 +0000
Received: by ug-out-1314.google.com with SMTP id m2so1213220ugc.45
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 May 2008 21:06:56 -0700 (PDT)
Message-ID: <90d987c0805142106h41412b1ah42e647314629ed0@mail.gmail.com>
Date: Thu, 15 May 2008 09:36:56 +0530
From: "rohit h" <hrohit85@gmail.com>
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: [JFFS2] Running fsstress on JFFS2 causing freeze
In-Reply-To: <90d987c0804170158x73f3ad16o1b0cefe6adddb9b9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <90d987c0804150511v7063ebcdx8e769c6c20161899@mail.gmail.com>
	<4804AAE5.9060609@nokia.com>
	<90d987c0804170158x73f3ad16o1b0cefe6adddb9b9@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yup, the patch solves the deadlock.

On Thu, Apr 17, 2008 at 2:28 PM, rohit h <hrohit85@gmail.com> wrote:
> Thanks a lot.
> I'll  test the patch and post the the results.
> Rohit
>
