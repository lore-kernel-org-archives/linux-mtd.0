Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mdiqk-0004nx-FW
	for linux-mtd@lists.infradead.org; Wed, 19 Aug 2009 10:57:11 +0000
Subject: Re: about ubifs question
From: tommy <jiujin.hong@mid-fun.com>
To: dedekind@infradead.org
In-Reply-To: <1250658794.3885.1.camel@localhost>
References: <1250656786.11476.2.camel@tommy-desktop>
	<1250658794.3885.1.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2009 18:56:55 +0800
Message-Id: <1250679415.24937.0.camel@tommy-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,sir !

I have fix my error !

it is cause by Nand flash register isn't correct when kernel resume !

it is caused by MCU software area lock!
On 三, 2009-08-19 at 08:13 +0300, Artem Bityutskiy wrote:
> linux-mtd@lists.infradead.org
