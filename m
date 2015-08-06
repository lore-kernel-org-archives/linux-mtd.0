Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNGIJ-0003kA-Db
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 08:12:56 +0000
Subject: Re: ubi_wl_get_peb: Unable to get a free PEB from user WL pool
To: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 linux-mtd@lists.infradead.org
References: <1438809724.6328.18.camel@embedded.rocks>
 <55C28070.2000804@nod.at> <1438810690.6328.26.camel@embedded.rocks>
 <55C2840B.5000709@nod.at> <1438811611.6328.32.camel@embedded.rocks>
 <55C287A9.8000006@nod.at> <1438813074.6328.35.camel@embedded.rocks>
 <55C30D24.1010504@nod.at> <1438848603.32524.6.camel@embedded.rocks>
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C316F0.5000003@nod.at>
Date: Thu, 6 Aug 2015 10:12:32 +0200
MIME-Version: 1.0
In-Reply-To: <1438848603.32524.6.camel@embedded.rocks>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 06.08.2015 um 10:10 schrieb Jörg Krause:
> I tried the "dirty hack", but it does not solves the problem. I also
> tested with 100 retries, but the error remains.
> 
> I will turn fastmap off for now, but feel free to send more patches to
> try.

Okay. Maybe you're facing something completely different.
Let me cook a more advanced debug patch to find out what is going on.

LG,
//richard
