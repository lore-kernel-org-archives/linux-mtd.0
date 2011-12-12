Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaDHn-00073b-Dd
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 21:19:48 +0000
Received: by lahc1 with SMTP id c1so688309lah.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2011 13:19:45 -0800 (PST)
Subject: Re: [PATCH 3/3] mtd/nand : workaround for Freescale FCM to support
 large-page Nand chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Date: Mon, 12 Dec 2011 23:19:37 +0200
In-Reply-To: <4EE66EFE.1050608@freescale.com>
References: <1322973098-2528-1-git-send-email-shuo.liu@freescale.com>
 <1322973098-2528-3-git-send-email-shuo.liu@freescale.com>
 <4EDEAEB9.6020703@freescale.com> <1323724195.2297.11.camel@koala>
 <4EE66EFE.1050608@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323724784.2297.20.camel@koala>
Mime-Version: 1.0
Cc: Artem.Bityutskiy@nokia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, shuo.liu@freescale.com,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org, leoli@freescale.com,
 dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-12-12 at 15:15 -0600, Scott Wood wrote:
> NAND chips come from the factory with bad blocks marked at a certain
> offset into each page.  This offset is normally in the OOB area, but
> since we change the layout from "4k data, 128 byte oob" to "2k data, 64
> byte oob, 2k data, 64 byte oob" the marker is no longer in the oob.  On
> first use we need to migrate the markers so that they are still in the oob.

Ah, I see, thanks. Are you planning to implement in-kernel migration or
use a user-space tool?

Artem.
