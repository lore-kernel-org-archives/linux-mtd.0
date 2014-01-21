Received: from vps1.hno.se ([2a02:750:5::f0])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5iMf-0002xt-HM
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2014 20:56:05 +0000
Message-ID: <1390337734.5046.24.camel@localhost>
Subject: Re: [linux-sunxi] Re: [RFC PATCH 0/9] mtd: nand: add sunxi NAND
 Flash Controller support
From: Henrik =?ISO-8859-1?Q?Nordstr=F6m?= <henrik@henriknordstrom.net>
To: linux-sunxi@googlegroups.com
Date: Tue, 21 Jan 2014 21:55:34 +0100
In-Reply-To: <1390328011.5046.16.camel@localhost>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
 <52D1494E.9090303@overkiz.com> <1389449230.19197.2.camel@localhost>
 <52D1541F.4040400@overkiz.com> <1389456075.20989.11.camel@localhost>
 <1389474709.22660.4.camel@localhost> <52D3ABB6.9030204@overkiz.com>
 <1389606496.29053.16.camel@localhost>
 <6de6ead1-e437-410b-91c0-74afb37dbf39@googlegroups.com>
 <1390328011.5046.16.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dev@linux-sunxi.org, linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

tis 2014-01-21 klockan 19:13 +0100 skrev Henrik Nordström:
> > Are you sure ?
> > This thread says that only the first 1024 bytes of data (+ 96 bytes of
> > ECC) of each page are used:
> 
> yes I am sure. There was no page access commands between the sectors,
> only linear read of data,ecc,data,ecc.

Hmm.. but thinking back I am no longer so sure. Need to test this again
while verifying with logic probe what is going on.

Regards
Henrik
