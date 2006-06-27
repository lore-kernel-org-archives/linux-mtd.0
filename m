Subject: Re: [PATCH]Fixes of performance and stability issues in CFI driver.
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@pentafluge.infradead.org>
In-Reply-To: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
References: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
Content-Type: text/plain
Date: Tue, 27 Jun 2006 14:55:43 +0100
Message-Id: <1151416544.17609.145.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-06-27 at 13:40 +0100, Alexey Korolev wrote:
> 
> static inline void cfi_udelay(int us)
> {
>         if (us >= 1000) {
>                 msleep((us+999)/1000);
>         } else {
>                 udelay(us);
>                 cond_resched();
>         }
> }
> According to spec Sibley buffer write time is 2048us. It is greater
> than 1000us. 
> So we call msleep which has resolution 10000 us.  

I don't like your 'timer_resolution' fix. Why not just fix cfi_udelay()
to use udelay() or mdelay() or msleep() in order of increasing delay?

-- 
dwmw2
