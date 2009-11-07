Received: from isilmar.linta.de ([213.133.102.198] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N6jKC-00032h-QD
	for linux-mtd@lists.infradead.org; Sat, 07 Nov 2009 11:19:25 +0000
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	Pep Talens <pep.talens@f1-connecting.com>
Subject: pcmciamtd -- what's broken, who needs it?
Message-ID: <20091107110259.GA1173@comet.dominikbrodowski.net>
References: <200911041120.25305.pep.talens@f1-connecting.com>
	<20091024194219.GA19546@comet.dominikbrodowski.net>
	<1256413386-20501-14-git-send-email-linux@dominikbrodowski.net>
	<1256539331.29885.360.camel@localhost>
	<20091026071352.GA26980@isilmar.linta.de>
	<1256541991.29885.376.camel@localhost>
	<20091026101909.271c109e@lxorguk.ukuu.org.uk>
	<1256552337.29885.419.camel@localhost>
	<1257237433.21596.60.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200911041120.25305.pep.talens@f1-connecting.com>
	<1257237433.21596.60.camel@localhost>
Cc: 'David Woodhouse' <dwmw2@infradead.org>, linux-pcmcia@lists.infradead.org,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Sat, 07 Nov 2009 11:19:25 -0000

Hey,

it seems that just as we were preparing to move pcmciamtd to staging, an
user who still tries to use it has appeared:

> ATTR{modalias}=="pcmcia:m0000c0000f00fn00pfn00paEBF91155pb805360CApc00000000pd00000000"
>     ATTR{prod_id2}=="  2MB SRAM CARD"
>     ATTR{prod_id1}=="PRETEC"
>     ATTR{pm_state}=="on"
>     ATTR{function}=="0x00"

So, what is actually BROKEN with pcmciamtd.c ?

Best,
	Dominik
