Received: from ug-out-1314.google.com ([66.249.92.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JmPwl-0002Cj-UO
	for linux-mtd@lists.infradead.org; Thu, 17 Apr 2008 08:58:24 +0000
Received: by ug-out-1314.google.com with SMTP id 23so1024477ugr.45
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Apr 2008 01:58:19 -0700 (PDT)
Message-ID: <90d987c0804170158x73f3ad16o1b0cefe6adddb9b9@mail.gmail.com>
Date: Thu, 17 Apr 2008 14:28:19 +0530
From: "rohit h" <hrohit85@gmail.com>
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: [JFFS2] Running fsstress on JFFS2 causing freeze
In-Reply-To: <4804AAE5.9060609@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <90d987c0804150511v7063ebcdx8e769c6c20161899@mail.gmail.com>
	<4804AAE5.9060609@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 15, 2008 at 6:47 PM, Adrian Hunter
<ext-adrian.hunter@nokia.com> wrote:
> rohit h wrote:
>
> > Hello everyone.
> > I am running a filesystem testing application "fsstress" on JFFS2.
> > The JFFS2 code is from linux-2.6.22 kernel.All the processes spawned
> > by fsstress do filesystem operations on the JFFS2 partition.After some
> > time all the processes go into "UNINTERRUPTIBLE SLEEP" state as shown.
> >
>
>  It is probably the same issue described here:
>
>  http://lists.infradead.org/pipermail/linux-mtd/2008-April/021039.html
>
>
Thanks a lot.
I'll  test the patch and post the the results.
Rohit
