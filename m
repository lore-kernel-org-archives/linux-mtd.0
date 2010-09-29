Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0vtV-0007DF-16
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 12:36:21 +0000
Received: by fxm15 with SMTP id 15so496684fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 05:36:19 -0700 (PDT)
Subject: Re: [RFC] Online firmware upgrade in non-embedded systems
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Hutchings <bhutchings@solarflare.com>
In-Reply-To: <1285696787.2282.45.camel@achroite.uk.solarflarecom.com>
References: <1285696787.2282.45.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 29 Sep 2010 15:34:18 +0300
Message-ID: <1285763658.2437.112.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: netdev <netdev@vger.kernel.org>,
	sf-linux-drivers <linux-net-drivers@solarflare.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-28 at 18:59 +0100, Ben Hutchings wrote:
> Currently the sfc network driver is optionally combined with an MTD
> driver (CONFIG_SFC_MTD) which exposes all upgradable firmware and
> configuration partitions in flash.  This works nicely in kernels with
> MTD enabled, but since MTD is mainly used in embedded systems with
> on-board flash it is often disabled in distribution kernels and custom
> kernels alike.  This leaves users of sfc unable to upgrade firmware
> without rebuilding the kernel or booting some other distribution.  The
> lack of widespread MTD support is a regular cause of support requests.

At least Fedora does have MTD enabled. But I guess commercial
distributions like RHEL might have it disabled (but I did not check),
and I think I could guess the reason for this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
