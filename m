Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKWNc-0002Rp-Nj
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 13:56:41 +0000
Received: by eyh6 with SMTP id 6so509469eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 06:56:38 -0700 (PDT)
Subject: Re: Bug in MTD NAND ONFI chipsize detection
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nitin Garg <nitingarg98@gmail.com>
In-Reply-To: <BANLkTik37R8tSxc9_qmBT5a2m9mAA_2XKQ@mail.gmail.com>
References: <BANLkTi=e1mUTX4X7ui+HVCGh=sZ=HLoNCw@mail.gmail.com>
	<20110511183322.da0739c9.akpm@linux-foundation.org>
	<BANLkTikrqzpU8qZ5FUgG4HaBgZAvmbOHrQ@mail.gmail.com>
	<BANLkTinGFDHj4s6nAXMiq8dYW_UO6W+YXg@mail.gmail.com>
	<BANLkTin5X7d+_b5+7N5g941bz12jc+zMZA@mail.gmail.com>
	<4DCB908C.80505@parrot.com>
	<BANLkTik37R8tSxc9_qmBT5a2m9mAA_2XKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 16:53:00 +0300
Message-ID: <1305208380.14423.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-12 at 07:34 -0500, Nitin Garg wrote:
> I do not see any diff for mtd.

Please, send a patch with a better commit message clearly explaining
which problem the bug fixes, and make sure the commit message is
understandable even by people who have not read the ONFI standard.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
