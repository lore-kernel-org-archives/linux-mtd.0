Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=VA3EHSOBE009.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OvFGa-00071r-2A
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 20:04:40 +0000
Received: from mail43-va3 (localhost.localdomain [127.0.0.1])	by
	mail43-va3-R.bigfish.com (Postfix) with ESMTP id 4D4B278149	for
	<linux-mtd@lists.infradead.org>; Mon, 13 Sep 2010 20:04:38 +0000 (UTC)
Received: from VA3EHSMHS022.bigfish.com (unknown [10.7.14.239])	by
	mail43-va3.bigfish.com (Postfix) with ESMTP id 1975F1880050	for
	<linux-mtd@lists.infradead.org>; Mon, 13 Sep 2010 20:04:38 +0000 (UTC)
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw01.freescale.net (8.14.3/8.14.3) with ESMTP id
	o8DK4ZAx019440	for
	<linux-mtd@lists.infradead.org>; Mon, 13 Sep 2010 13:04:35 -0700 (MST)
Received: from az33exm25.fsl.freescale.net (az33exm25.am.freescale.net
	[10.64.32.16])	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	o8DKIhMe011402	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2010 15:18:43 -0500 (CDT)
Date: Mon, 13 Sep 2010 15:04:32 -0500
From: Scott Wood <scottwood@freescale.com>
To: Timur Tabi <timur.tabi@gmail.com>
Subject: Re: [PATCH v2 3/3][MTD] P4080/mtd: Fix the freescale lbc issue with
	36bit mode
Message-ID: <20100913150432.1e1625c7@schlenkerla.am.freescale.net>
In-Reply-To: <AANLkTimUR5-hWRkDAwWTXJYCOcse7LTR0r-vSsZec1g1@mail.gmail.com>
References: <1284027632-32573-1-git-send-email-tie-fei.zang@freescale.com>
	<1284027632-32573-2-git-send-email-tie-fei.zang@freescale.com>
	<1284027632-32573-3-git-send-email-tie-fei.zang@freescale.com>
	<20100909114153.GB6622@oksana.dev.rtsoft.ru>
	<3850A844E6A3854C827AC5C0BEC7B60A1FC158@zch01exm23.fsl.freescale.net>
	<AANLkTimfKwdw+nLAjDjxf52dbZKLF-3aES+bT7CHskAS@mail.gmail.com>
	<1284388075.10955.51.camel@localhost>
	<AANLkTinyELs7KNDQxWsaR8Ea13SewWYwgtnie_P7cAzC@mail.gmail.com>
	<1284396320.1783.30.camel@brekeke>
	<AANLkTimUR5-hWRkDAwWTXJYCOcse7LTR0r-vSsZec1g1@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: Wood Scott-B07421 <B07421@freescale.com>, dedekind1@gmail.com,
	Zang Roy-R61911 <r61911@freescale.com>,
	Lan Chunhe-B25806 <B25806@freescale.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Anton Vorontsov <cbouatmailru@gmail.com>,
	akpm@linux-foundation.org, dwmw2@infradead.org,
	Gala Kumar-B11780 <B11780@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 13 Sep 2010 13:36:45 -0500
Timur Tabi <timur.tabi@gmail.com> wrote:

> On Mon, Sep 13, 2010 at 11:45 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > Unsigned int is reliably >= 4 in Linux.
> 
> Not exactly.  sizeof(unsigned int) is effectively never greater than 4
> in Linux (I think it's still 32 bits even on a 64-bit kernel), so it
> makes no sense to say >=.  

I think the point is that if a machine/ABI comes along with
sizeof(int) > 4 (e.g. if there's a significant penalty for working
with anything < 64-bit), Linux might consider supporting that.  Whereas
if someone points to their microcontroller or ancient 286 with
sizeof(int) == 2, the answer would be, "Here's a nickel, kid -- get a
real computer".

-Scott
