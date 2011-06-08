Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUGS9-0000f5-OP
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 10:57:38 +0000
Received: by bwz1 with SMTP id 1so402525bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 03:57:35 -0700 (PDT)
Subject: Re: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at 4KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <BANLkTin3zBCy3MFHS0Q=L4uoRyG3YERE-g@mail.gmail.com>
References: <20110602064832.GA7319@july> <1307115701.3069.20.camel@localhost>
	<E942AFD653C85241BF3CCD5F471BEDA203FC6E79@008-AM1MPN1-041.mgdnok.nokia.com>
	<1307354557.3112.21.camel@localhost>
	<1307354791.3112.24.camel@localhost>
	<BANLkTinPBum1WB=-tx833hj032mfs1TdVg@mail.gmail.com>
	<E942AFD653C85241BF3CCD5F471BEDA203FD21D7@008-AM1MPN1-041.mgdnok.nokia.com>
	<BANLkTi=aukCraGS1iOuemwuCvWrOaY0oxA@mail.gmail.com>
	<BANLkTin3zBCy3MFHS0Q=L4uoRyG3YERE-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 13:53:17 +0300
Message-ID: <1307530397.31223.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	roman.tereshonkov@nokia.com, m.szyprowski@samsung.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2011-06-08 at 09:59 +0900, Kyungmin Park wrote:
> then how to detect the NOP for similar chip? Using VersionID? or
> simply the minimum value?

You are from Samsung, could you use your channels and ask your HW guys
how to detect NOP? What is the proper way?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
