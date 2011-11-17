Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RRA1e-0001rc-NS
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2011 22:01:43 +0000
Received: by bkat2 with SMTP id t2so3437732bka.36
 for <linux-mtd@lists.infradead.org>; Thu, 17 Nov 2011 14:01:31 -0800 (PST)
Subject: Re: [PATCH] mtd: cfi: Allow per-mapping CFI device endianness
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Date: Fri, 18 Nov 2011 00:01:27 +0200
In-Reply-To: <43e9f17b-665e-489d-a987-495c847c44f1@zimbra>
References: <43e9f17b-665e-489d-a987-495c847c44f1@zimbra>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321567289.2272.20.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-11-14 at 18:44 -0600, Aaron Sierra wrote:
> This patch allows each CFI device map to use its own endianness. The
> globally defined CFI endianness (CONFIG_MTD_CFI_NOSWAP,
> CONFIG_MTD_CFI_BE_BYTE_SWAP or CONFIG_MTD_CFI_LE_BYTE_SWAP) becomes the
> default value which can be overridden by a driver for a particular device.
> 
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Would be nice to get someone's tested-by from the list to make sure it
does not break existing setups. Anyone?

But anyway, looks sane, so I take it to my l2-mtd-2.6.git, thanks!

Artem.
