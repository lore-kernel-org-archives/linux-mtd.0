Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RpRUS-000355-PT
 for linux-mtd@lists.infradead.org; Mon, 23 Jan 2012 21:31:49 +0000
Received: by wgbds1 with SMTP id ds1so1355234wgb.18
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jan 2012 13:31:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20120121121049.7dbfa3a1@pixies.home.jungo.com>
References: <1327120684-7066-1-git-send-email-computersforpeace@gmail.com>
 <1327120684-7066-3-git-send-email-computersforpeace@gmail.com>
 <20120121121049.7dbfa3a1@pixies.home.jungo.com>
Date: Mon, 23 Jan 2012 13:31:43 -0800
Message-ID: <CAN8TOE87aw2JCMokQfT+D+XV08xS3kMO76rQU2XRVWLvUTOSdw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mtd: nand: write BBM to OOB even with flash-based
 BBT
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

On Sat, Jan 21, 2012 at 2:10 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> On Fri, 20 Jan 2012 20:38:04 -0800 Brian Norris <computersforpeace@gmail.=
com> wrote:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Attempt erase before marking OOB */
>
> About to erase the block, but it could have been OOB BBM marked (due
> to former power cut between BBM marking and BBT update).
> Should we test if the OOB BBM is already set, as Artem suggested?
> (at least when NAND_BBT_USE_FLASH && !NAND_BBT_NO_OOB_BBM)

Possibly. This seems useful only for these few cases:
(1) you don't like erasing and rewriting the bad block marker
(2) power cut occurs after erase but before re-writing OOB
(3) write error occurs on re-writing OOB

And I suppose it's not too difficult. We could use chip->block_bad
(defaults to nand_block_bad()) to check this pretty simply.

Brian
