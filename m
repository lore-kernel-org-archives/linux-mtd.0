Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GjmM-00061V-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Dec 2001 16:41:14 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C20C36F.D02FD5A5@wann.com> 
References: <3C20C36F.D02FD5A5@wann.com>  <01121914160800.03136@rob> <Pine.LNX.4.21.0112181832140.3242-100000@dagobert.svc.sysgo.de> <20544.1008697534@redhat.com> <12142.1008768097@redhat.com> 
To: Vladimir Doukhanine <vdoukhan@wann.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Two flash chips with a gap between them. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 19 Dec 2001 16:51:54 +0000
Message-ID: <17497.1008780714@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

vdoukhan@wann.com said:
> I have two flash chips Am29lv320db90ei, which are physically mapped to
> different memory areas and even have a memory gap between each other.

Just create a 'map' driver for your board which makes them appear 
to be together. 

__u16 xxx_read16(struct map_info *map, unsigned long ofs)
{
	if (ofs < CHIP_SIZE)
		return __raw_readw(map->map_priv_1 + ofs);
	else
		return __raw_readw(map->map_priv_2 + ofs - CHIP_SIZE);
}

etc.
}

--
dwmw2
