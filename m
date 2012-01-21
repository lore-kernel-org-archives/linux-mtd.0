Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RoXuW-0006C3-7l
 for linux-mtd@lists.infradead.org; Sat, 21 Jan 2012 10:11:01 +0000
Received: by werm13 with SMTP id m13so1341635wer.36
 for <linux-mtd@lists.infradead.org>; Sat, 21 Jan 2012 02:10:58 -0800 (PST)
Date: Sat, 21 Jan 2012 12:10:49 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 2/2] mtd: nand: write BBM to OOB even with
 flash-based BBT
Message-ID: <20120121121049.7dbfa3a1@pixies.home.jungo.com>
In-Reply-To: <1327120684-7066-3-git-send-email-computersforpeace@gmail.com>
References: <1327120684-7066-1-git-send-email-computersforpeace@gmail.com>
 <1327120684-7066-3-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Angus CLARK <angus.clark@st.com>, Dan Carpenter <error27@gmail.com>,
 Kulikov Vasiliy <segooon@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Peter Wippich <pewi@gw-instruments.de>, Gabor Juhos <juhosg@openwrt.org>,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Jamie Iles <jamie@jamieiles.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Barry Song <21cnbao@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Florian Fainelli <florian@openwrt.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Guillaume LECERF <glecerf@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 20 Jan 2012 20:38:04 -0800 Brian Norris <computersforpeace@gmail.com> wrote:
>  static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  {
>  	struct nand_chip *chip = mtd->priv;
>  	uint8_t buf[2] = { 0, 0 };
> -	int block, ret, i = 0;
> +	int block, res, ret = 0, i = 0;
> +	int write_oob = !(chip->bbt_options & NAND_BBT_NO_OOB_BBM);
>  
> -	if (!(chip->bbt_options & NAND_BBT_USE_FLASH)) {
> +	BUG_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
> +			!(chip->bbt_options & NAND_BBT_USE_FLASH));
> +
> +	if (write_oob) {
>  		struct erase_info einfo;
>  
>  		/* Attempt erase before marking OOB */

About to erase the block, but it could have been OOB BBM marked (due
to former power cut between BBM marking and BBT update).
Should we test if the OOB BBM is already set, as Artem suggested?
(at least when NAND_BBT_USE_FLASH && !NAND_BBT_NO_OOB_BBM)

>  
> -	/* Do we have a flash based bad block table? */
> -	if (chip->bbt_options & NAND_BBT_USE_FLASH)
> -		ret = nand_update_bbt(mtd, ofs);
> -	else {
> +	/* Write bad block marker to OOB */
> +	if (write_oob) {

Same question as above.

Regards,
Shmulik
