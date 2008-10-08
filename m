Received: from rv-out-0708.google.com ([209.85.198.246])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnNRz-0004El-9L
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 01:02:51 +0000
Received: by rv-out-0708.google.com with SMTP id b17so5405486rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Oct 2008 18:02:49 -0700 (PDT)
Message-ID: <8bd0f97a0810071802t52bc60fs6a230e30d7ed1c8f@mail.gmail.com>
Date: Tue, 7 Oct 2008 21:02:49 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Mitch Davis" <mjd-linux-mtd@afork.com>
Subject: Re: mtd-utils: fec.c uses bcopy()
In-Reply-To: <8956d4ca0810071727i63554837k923a0091b3ef9bd0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8956d4ca0810071727i63554837k923a0091b3ef9bd0@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 7, 2008 at 20:27, Mitch Davis wrote:
> I use buildroot to build my embedded Linux.  My run-time library is
> uClibc, which doesn't provide bcopy().

actually it does.  you just disabled support for it.

> fec.c in mtd-utils uses bcopy(), so mtd-utils doesn't compile for me.
> I'd like to fix this.
>
>  - Should I rewrite fec.c so it uses memcpy instead?
>  - Should I just add #define NEED_BCOPY to fec.c?
>  - Should I leave fec.c unchanged and add -DNEED_BCOPY to the Makefile
> (which would be passed to every compile?)

a simple sed can fix the code as the only difference between bcopy()
and memcpy() is the argument order.  ifdef's are pointless/ugly in
this case.
-mike
