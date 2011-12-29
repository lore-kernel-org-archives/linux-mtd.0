Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RgNgX-0005A6-18
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 21:38:50 +0000
Received: by wibhq15 with SMTP id hq15so8013932wib.36
 for <linux-mtd@lists.infradead.org>; Thu, 29 Dec 2011 13:38:47 -0800 (PST)
Subject: Re: [PATCH 1/2] mtd: docprobe: use kzalloc instead
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Dec 2011 23:38:45 +0200
In-Reply-To: <20111229223105.34c7163a@skate>
References: <1325173626-6739-1-git-send-email-dedekind1@gmail.com>
 <20111229223105.34c7163a@skate>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1325194726.2078.2.camel@koala>
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

On Thu, 2011-12-29 at 22:31 +0100, Thomas Petazzoni wrote:
> Le Thu, 29 Dec 2011 17:47:05 +0200,
> Artem Bityutskiy <dedekind1@gmail.com> a écrit :
> 
> > +		mtd = kzmalloc(sizeof(struct DiskOnChip) + sizeof(struct mtd_info), GFP_KERNEL);
> 
> I guess you mean kzalloc() and not kzmalloc().

Yes, I have actually had fixed that but then sent the bogus patcy
version, thanks!

Artem.
