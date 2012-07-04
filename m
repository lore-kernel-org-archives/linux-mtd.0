Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SmNqD-0007F7-1P
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2012 11:33:54 +0000
Received: by bkcji2 with SMTP id ji2so2013168bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jul 2012 04:33:50 -0700 (PDT)
Date: Wed, 4 Jul 2012 14:33:39 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 0/5] ubi: Fix bad PEBs reserve caclulation
Message-ID: <20120704143339.513439b4@pixies.home.jungo.com>
In-Reply-To: <4FF4005E.1070106@nod.at>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <4FF4005E.1070106@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 04 Jul 2012 10:35:42 +0200 Richard Weinberger <richard@nod.at> wrote:
> Has this patch set an impact on UBI fastmap?

Not sure yet. Maybe. Need to medidate on this :-)

> ...wondering why I'm CC'd. :-)

Heads-up.
As this is a bit delicate, you may review if the parts modified relate
to your fastmap work.

Regards,
Shmulik
