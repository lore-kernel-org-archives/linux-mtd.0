Received: from mail.udm.ru ([217.14.192.20] helo=aps.mark-itt.ru)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15aD8N-0002ol-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2001 10:20:11 +0100
Received: from [195.161.198.29] (HELO 127.0.0.1)
  by aps.mark-itt.ru (CommuniGate Pro SMTP 3.4.8)
  with ESMTP id 13867621 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2001 14:26:07 +0500
Date: Fri, 24 Aug 2001 14:27:20 +0500
From: ASA <atris@mail.ru>
Reply-To: ASA <atris@mail.ru>
Message-ID: <11219204985.20010824142720@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: Re[2]: BLKRRPART bug in NFTL?
In-reply-To: <E15aB7O-0002fC-00@pentafluge.infradead.org>
References: <E15aB7O-0002fC-00@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hello Alexandru,

> Date: Fri, 24 Aug 2001 10:15:29 +0800
> From: Alexandru Harsanyi <a.harsanyi@willhart-tech.com>

> Subject: Re: BLKRRPART bug in NFTL?
>
> I'm not sure about that, but I think DOC should be formated/partitioned
> with nftl_format, not *fdisk.

What? I mean logical partitions, or any kind of logical layer. In
other words, I want to have /dev/nftla1 and /dev/nftla2, not
/dev/nftla and /dev/nftlb

According documentation, nftl_format is designed to "unhose" virgin
chip and destroys firmware BIOS as said recently (in this list).
Isn't it?

In other words, I think that nftl_format can be compared with
fdformat, not mformat - they operates on different layers.

-- 
Best regards,
 ASA                            mailto:atris@mail.ru
