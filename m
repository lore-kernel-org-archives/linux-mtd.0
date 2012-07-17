Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sr4Xh-0001Hm-Ow
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2012 09:58:11 +0000
From: Stefan Roese <sr@denx.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: physmap_of: Add "map-indirect" DT property
Date: Tue, 17 Jul 2012 11:56:45 +0200
References: <1341303991-6219-1-git-send-email-sr@denx.de>
 <4FF7E253.4080604@gatzka.org>
 <1342471312.25411.30.camel@shinybook.infradead.org>
In-Reply-To: <1342471312.25411.30.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201207171156.45375.sr@denx.de>
Cc: Albrecht Dress <albrecht.dress@arcor.de>,
 Anatolij Gustschin <agust@denx.de>, linux-mtd@lists.infradead.org,
 stephan@gatzka.org, Stephan Gatzka <Stephan.Gatzka@hbm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 16 July 2012 22:41:52 David Woodhouse wrote:
> On Sat, 2012-07-07 at 09:16 +0200, Stephan Gatzka wrote:
> > this patch works very well for us (of course, because Stefan made it for
> > us). Are there any concerns against it? Probably against introducing a
> > new DT property? Of course we can make this fix much more MPC5200
> > specific but this will result in largely copying physmap_of.c and some
> > additional code for access routines and Kconfig.
> 
> I don't much like the "map-indirect" name. If it's actually unaligned
> access, or non-word-sized access, that's forbidden, then that's what the
> DT property should be.
>
> The term "map-indirect" is more a description of how the software
> currently behaves... which is exactly that DT bindings *shouldn't* be.

Okay. I've chosen "map-indirect" because it might be used by other platforms 
as well, perhaps because of different reasons (so not restricting this to the 
unaligned access problem of the MPC5200). But I have no strong feelings here, 
so I can prepare a new patch version with a different name.

How about "no-unaligned-direct-access"? Pretty long though. Any other 
suggestions here?

Thanks,
Stefan
