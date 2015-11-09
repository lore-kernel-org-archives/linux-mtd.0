Received: from mail02.rohde-schwarz.com ([80.246.32.97])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvmVf-0000zV-Nc
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 13:29:25 +0000
In-Reply-To: <5640506C.1030005@huawei.com>
References: <OF1A12855F.4E78FEFE-ONC1257EF4.004CEFDC-C1257EF4.00663F07@rohde-schwarz.com>
 <56404913.3060104@huawei.com> <5640506C.1030005@huawei.com>
To: Wei Fang <fangwei1@huawei.com>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Subject: Re: jffs2: Excess summary entries
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OFB301B57C.70128EFE-ONC1257EF8.00439A43-C1257EF8.004A0DEC@rohde-schwarz.com>
Date: Mon, 9 Nov 2015 14:28:49 +0100
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Wei:

> > I prefer:
> >    if (jffs2_sum_active() && *retlen == len) {
> >       ...
> >       res = jffs2_sum_add_kvec(...)
> >       ...
> >    }
> > 
> > In the case that part of node has been written to flash, this whole 
node
> > will be marked as dirty node, only in memory, not marked without
> > JFFS2_NODE_ACCURATE on flash.
> > 
> > If the summary is stored when *retlen != len, there are two cases:
> > 
> > * In most case, another write with the same node info performs
> >   successfully later, the node written partially before will be marked
> >   as obsolete node when scan, and we won't read from it
> > * This node is the newest node about this region, it will be treated
> >   as normal node when scan, and we may read the data already 
corrupted.
> >   Yet it won't break any rules of JFFS2 and lead to a muddle
> 
> I forgot there's crc check about the data, so in this case, this node
> couldn't pass the crc check and will be marked as obsolete too :)
> 
> > The node written partially will be treated as normal node in a full 
scan
> > routine too, so I think we should mark this node as dirty on flash in
> > the case that *retlen != len.

Yes, this is basically what I have been seeing in my tests: After the 
first write has failed, the node is written again, and only the second 
node is used upon remount. So I can guess we can go either way: dropping 
the summary entry, or keeping it.

By now, I have come to the conclusion that it's probably cleaner to drop 
the summary entry, just as it is done when write buffering is enabled. 
This way, we can be sure that the node data is ignored on reboot the same 
way as it is ignored at the moment when the MTD write fails. And while 
extra summary entries won't usually cause any problems, there is no 
advantage in wrting them out if they are ignored anyway.

Best regards,
Thomas Betker
