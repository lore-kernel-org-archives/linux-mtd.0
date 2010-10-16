Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P72rE-0005m0-N8
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 09:15:17 +0000
Received: by wwd20 with SMTP id 20so1432858wwd.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Oct 2010 02:15:14 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1282974300-11664-1-git-send-email-vapier@gentoo.org>
References: <1282974300-11664-1-git-send-email-vapier@gentoo.org>
From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 16 Oct 2010 05:14:53 -0400
Message-ID: <AANLkTiktR-zNsv4KrnOBh3PxXZTHa6UypzqnwSBpE1=R@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [PATCH] mtd: Blackfin NFC: fix build error
	after nand_scan_ident() change
To: stable@kernel.org
Content-Type: text/plain; charset=UTF-8
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

stable team: could you pick this up for 2.6.35.x ?

it has been merged in mainline as eac15a429a27cb74115daaf4c1127c5e854d50e4
-mike
