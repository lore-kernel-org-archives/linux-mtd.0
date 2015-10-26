Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqoK5-0003vb-Hj
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 20:24:54 +0000
Received: by pasz6 with SMTP id z6so197728957pas.2
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 13:24:32 -0700 (PDT)
Date: Mon, 26 Oct 2015 13:24:29 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Shraddha Barke <shraddha.6596@gmail.com>
Cc: outreachy-kernel@googlegroups.com, y2038@lists.linaro.org,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [RESEND v2] mtd: tests: Replace timeval with ktime_t
Message-ID: <20151026202429.GH13239@google.com>
References: <1445525994-15331-1-git-send-email-shraddha.6596@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445525994-15331-1-git-send-email-shraddha.6596@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 22, 2015 at 08:29:54PM +0530, Shraddha Barke wrote:
> Changes the 32-bit time type timeval to the 64-bit time type
> ktime_t, since 32-bit systems using struct timeval will break in the
> year 2038. Correspondingly change do_gettimeofday() to ktime_get()
> since ktime_get returns a ktime_t, but do_gettimeofday returns a
> struct timeval.Here, ktime_get() is used instead of ktime_get_real()
> since ktime_get() uses monotonic clock.
> 
> Signed-off-by: Shraddha Barke <shraddha.6596@gmail.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Looks OK. With luck, these tests will be moving out of the kernel and
into user space soon anyway, but that's no reason not to fix this one.

Applied to l2-mtd.git
