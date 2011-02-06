Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm6AM-0000YP-47
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 15:04:42 +0000
Received: by eyd9 with SMTP id 9so1805207eyd.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Feb 2011 07:04:40 -0800 (PST)
Subject: Re: [PATCH/RFC v2 1/3] Shared BCH ECC library
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
In-Reply-To: <181c9a1c88b781116615761109cccdf89ea877a1.1296641159.git.ivan.djelic@parrot.com>
References: <181c9a1c88b781116615761109cccdf89ea877a1.1296641159.git.ivan.djelic@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 06 Feb 2011 17:03:47 +0200
Message-ID: <1297004627.4460.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Tim Barr <tbarr@multitech.com>, Sukumar Ghorai <s-ghorai@ti.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-02-02 at 11:50 +0100, Ivan Djelic wrote:
> Hello,
> 
> This is a repost of my previous patches introducing generic BCH support, with
> a few fixes and an RFC mention that I forgot to put in the first series.
> 
> Comments and suggestions are welcome and appreciated :)

Hi Ivan,

thanks for the library, but could you please re-send it with LKML in CC.

This is not strictly MTD code, you are adding this as a generic library.
So send it to Andrew Morton and CC mtd list and LKML list, ask for
review, wait for comments and then ask Andrew to pick it.

I'm CCing LKML and Andrew Morton.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
