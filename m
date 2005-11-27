Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EgMAE-0007ui-2Q
	for linux-mtd@lists.infradead.org; Sun, 27 Nov 2005 08:02:00 -0500
Message-ID: <4389AE3D.8000807@inf.u-szeged.hu>
Date: Sun, 27 Nov 2005 14:01:49 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <8126E4F969BA254AB43EA03C59F44E840C3738@pdsmsx404>
	<4386FC5F.9050305@yandex.ru>
In-Reply-To: <4386FC5F.9050305@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, "Zhao, Forrest" <forrest.zhao@intel.com>
Subject: Re: The problem that I didn't think out
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem (& Zhao),

We had some time, so we read the plan of JFFS3 (with RaiserFS
documentation).

There are many nice solutions in it. I like wandering trees, the journal
and the superblock management. Nice work, congratulation.

The key compression is the only one in the plan that I think that is
better if we don't use. I think to make key management as simple and
fast as possible is more important than some percent in flash usage. (if
I am right the bottleneck of real products is not the flash usage but
the speed) But it is small techniqual question.

The big questions are that questions you already thinging on: garbage
collection and wear leveling. Without solving them JFFS3 have no nice
future. I only would like to say that now we are also thinking on these
important problems... and we will write if anything usable found. (I may
be better feeling to thinking on someting not alone... :) )

Ferenc
