Received: from eu1sys200aog115.obsmtp.com ([207.126.144.139])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rn75J-0007QJ-Ao
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2012 11:20:14 +0000
Message-ID: <4F155937.1040108@st.com>
Date: Tue, 17 Jan 2012 11:19:19 +0000
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de> <1326320928.2338.37.camel@koala>
 <4F0EA32E.20500@linutronix.de> <1326494218.2258.36.camel@koala>
In-Reply-To: <1326494218.2258.36.camel@koala>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Dan Carpenter <error27@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
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
 Adrian Hunter <adrian.hunter@intel.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Guillaume LECERF <glecerf@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/13/2012 10:36 PM, Artem Bityutskiy wrote:
> On Thu, 2012-01-12 at 10:09 +0100, Sebastian Andrzej Siewior wrote:
>>
>> so the OOB array is by design more reliable than the data area?
> 
> I think so, because it is distributed, and it is historically the way
> blocks had been marked as bad, and I thing vendors make sure this
> mechanism works.
> 

Is this really true?  I was under the impression that the OOB area was the same
as the data area, as far as reliability is concerned, and is subject to the same
ECC requirements.

As far as I am aware, NAND manufacturers only guarantee that the
factory-programmed OOB BB markers are valid.  Nothing is mentioned in the
datasheets about using OOB BB markers to track worn blocks - they all tend to
recommend BBTs.

Cheers,

Angus
