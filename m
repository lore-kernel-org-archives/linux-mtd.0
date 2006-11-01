Received: from za-gw.sanpeople.com ([196.211.225.226])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gf9rm-0002LV-KO
	for linux-mtd@lists.infradead.org; Wed, 01 Nov 2006 01:46:29 -0500
Subject: Re: NOR Flash on at91rm9200 status?
From: Andrew Victor <andrew@sanpeople.com>
To: Aras Vaichas <arasv@magellan-technology.com>
In-Reply-To: <4548195D.80505@magellan-technology.com>
References: <4548195D.80505@magellan-technology.com>
Content-Type: text/plain
Message-Id: <1162363021.16797.4.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 01 Nov 2006 08:37:02 +0200
Content-Transfer-Encoding: 7bit
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Aras,

> looking at your Linux-2.6-at91 patch status page it shows:
> "NOR Flash  	 unknown  	 ?"
> 
> Is this still accurate? I understand that the Cogent boards use NOR Flash with
> the at91rm9200. Does that mean the NOR Flash drivers are all working fine, or
> do they only work with the Strataflash parts?

The only AT91RM9200-based board I have with NOR flash is an
AT91RM9200-DK.  On that board the flash chips (Atmel AT49BV1614) is not
detected properly - worked fine in 2.4 though.

I haven't had any other reports of NOR flash not working, so I assume it
is something particular with the DK board and/or the AT49BV1614.


Regards,
  Andrew Victor
