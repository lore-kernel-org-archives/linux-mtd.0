Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSQZ5-0001VZ-86
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 09:21:12 +0000
Received: by wwb39 with SMTP id 39so1118467wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 02:21:06 -0700 (PDT)
Date: Fri, 3 Jun 2011 10:20:57 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Axel Lin <axel.lin@gmail.com>
Subject: Re: [PATCH] mtd: denali: remove calling mtd_device_unregister()
	after nand_release()
Message-ID: <20110603092057.GC2637@pulham.picochip.com>
References: <1307063535.10001.1.camel@phoenix>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1307063535.10001.1.camel@phoenix>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Jamie Iles <jamie@jamieiles.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 03, 2011 at 09:12:15AM +0800, Axel Lin wrote:
> The implementation of nand_release() already call mtd_device_unregister(),
> no need to call it again.

Good catch!

> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Acked-by: Jamie Iles <jamie@jamieiles.com>
