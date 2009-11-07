Message-ID: <31862236.11111257593349372.komurojun-mbn@nifty.com>
Date: Sat, 7 Nov 2009 20:29:09 +0900 (JST)
From: Komuro <komurojun-mbn@nifty.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: pcmciamtd -- what's broken, who needs it?
In-Reply-To: <20091107110259.GA1173@comet.dominikbrodowski.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
References: <20091107110259.GA1173@comet.dominikbrodowski.net>
	<200911041120.25305.pep.talens@f1-connecting.com>
	<20091024194219.GA19546@comet.dominikbrodowski.net>
	<1256413386-20501-14-git-send-email-linux@dominikbrodowski.net>
	<1256539331.29885.360.camel@localhost>
	<20091026071352.GA26980@isilmar.linta.de>
	<1256541991.29885.376.camel@localhost>
	<20091026101909.271c109e@lxorguk.ukuu.org.uk>
	<1256552337.29885.419.camel@localhost>
	<1257237433.21596.60.camel@localhost>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	Pep Talens <pep.talens@f1-connecting.com>,
	linux-pcmcia@lists.infradead.org,
	linux-mtd <linux-mtd@lists.infradead.org>,
	'David Woodhouse' <dwmw2@infradead.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

staging directory is not the place for broken driver,
is it?

>Hey,
>
>it seems that just as we were preparing to move pcmciamtd to staging, an
>user who still tries to use it has appeared:
>
>> ATTR{modalias}=="pcmcia:m0000c0000f00fn00pfn00paEBF91155pb805360CApc0000000
0pd00000000"
>> ? ? ATTR{prod_id2}==" ?2MB SRAM CARD"
>> ? ? ATTR{prod_id1}=="PRETEC"
>> ? ? ATTR{pm_state}=="on"
>> ? ? ATTR{function}=="0x00"
>
>So, what is actually BROKEN with pcmciamtd.c ?

Best Regards
Komuro
