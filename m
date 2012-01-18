Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rndcn-0008Ol-2Z
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2012 22:04:57 +0000
Received: by wgbdq13 with SMTP id dq13so2362258wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2012 14:04:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4F154BF6.6020608@st.com>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de> <1326320928.2338.37.camel@koala>
 <4F154BF6.6020608@st.com>
Date: Wed, 18 Jan 2012 14:04:50 -0800
Message-ID: <CAN8TOE9W2txK+tcnuFBKB3ZTp99Fx385=8zxq9N5cbthVJCwoA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
From: Brian Norris <computersforpeace@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Dan Carpenter <error27@gmail.com>, Barry Song <21cnbao@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Adrian Hunter <adrian.hunter@intel.com>, Gabor Juhos <juhosg@openwrt.org>,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Jamie Iles <jamie@jamieiles.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Florian Fainelli <florian@openwrt.org>, dedekind1@gmail.com,
 Peter Wippich <pewi@gw-instruments.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
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

On Tue, Jan 17, 2012 at 2:22 AM, Angus CLARK <angus.clark@st.com> wrote:
> (Indeed, this issue was raised recently in a meeting with one of the majo=
r NAND
> manufacturers, and the design enginner was horrified at the thought of re=
lying
> on the OOB for tracking worn blocks.)

That's interesting. I never had this impression, but perhaps the topic
just never came up.

> The use of OOB BB markers certainly has some benefits (as already mention=
ed in
> previous posts), and I like the idea of being able to use OOB markers in
> conjunction with BBTs. =A0However, IMHO, I believe the BBT should be rega=
rded as
> the primary source of information, especially when considering inconsiste=
ncies
> between the OOB markers and the BBTs.

It looks like the facts are leaning toward flash-based BBT being the
preferable source of info, at least. But due to some practical
concerns (over reliability of BBT, resistance to corruption, and
non-Linux interaction with flash), I feel like we can't say 100% that
BBT is the primary source of bad block info. Now, if we can mitigate
the reliability/corruption issues, that leaves non-Linux (e.g.,
bootloader) interaction with flash.

Anyway, the important question is: how does this impact the current
solution I am developing? IMO, this seems primarily a matter of
perspective, which would drive future development but does not
fundamentally alter my proposed patch(es). The choice of "primary
source" may affect the order in which we update them and the handling
of power cuts, but otherwise, we want the same result regardless of
the "primary."

Another note regarding the primary source: if the BBT is sufficiently
corrupted (according to ECC), we fall back to the OOB markers. That
doesn't make the flash-based BBT the 100% primary source, but I think
it makes sense. This feature was pulled into the 3.2 release, BTW.

> On 01/11/2012 10:28 PM, Artem Bityutskiy wrote:
>> 1. When we get erase error. Well, if SW erases a block, it does not care
>> of the contents. This means that if after the reboot SW will re-try
>> erasing it. And if the block is bad, and previously the erasure failed,
>> it will fail again, and SW will mark it as bad again.
...
> In other words, we cannot rely on erase failures as a way of recovering b=
ad
> block status, although I accept in some circumstances, it is probably the=
 best
> we can do!

I think that if there are really power-cut issues while marking a bad
block, we will often have to resort to the imperfect "best we can do".
If we don't have any more fundamental objections, I will resend soon,
where we will write to OOB first, then to BBT. There will be an option
to simply disable writing markers to OOB.

Thanks,
Brian
