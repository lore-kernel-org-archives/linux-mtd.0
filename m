Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RPZZG-0006bj-63
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2011 12:53:51 +0000
Received: by bkat2 with SMTP id t2so7093072bka.36
 for <linux-mtd@lists.infradead.org>; Sun, 13 Nov 2011 04:53:47 -0800 (PST)
Subject: Re: [PATCH v2 07/16] mtd/docg3: add OOB layout to mtdinfo
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Sun, 13 Nov 2011 14:53:43 +0200
In-Reply-To: <87vcqoiavr.fsf@free.fr>
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
 <1320912342-30147-8-git-send-email-robert.jarzmik@free.fr>
 <4EBECB89.2020102@newsguy.com> <87vcqoiavr.fsf@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321188825.2273.4.camel@koala>
Mime-Version: 1.0
Cc: dwmw2@infradead.org, Mike Dunn <mikedunn@newsguy.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-11-13 at 11:18 +0100, Robert Jarzmik wrote:
> I personally think this should be provided by the MTD API. A function
> is_page_blank(ofs) could tell if the page was written or not. Now if the
> function is NULL, the upper layer (UBIFS, ...) could decide _by itself_ to
> assign a free OOB byte to that meaning. But IMHO it's not the drivers duty to
> take these decisions to restrict the OOB, let it be done at an upper level.

Probably it is a good idea to introduce an mtd_is_page_blank. But it
should either work for all flashes or not introduced at all. I do not
think upper layers should use OOB at all. And this interface should also
work for NOR flash. Probably it should just fall-back to comparing the
data with 0xFF if the driver cannot offer anything special.

Artem.
