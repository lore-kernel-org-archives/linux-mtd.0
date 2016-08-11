Subject: Re: [LEDE-DEV] Older u-boot mangles UBI from ubinize 1.5.2
To: Daniel Golle <daniel@makrotopia.org>
References: <3e1a26f3-5539-01c5-0755-aea07c95d08a@jmomo.net>
 <CAFLxGvyfLdS3cBqoicS02NymT+BAq8B3tKsFzte7Am_4AW0qQA@mail.gmail.com>
 <20160811104049.GB1644@makrotopia.org>
 <477c00a0-fcdb-b302-d81f-42a58f401b29@jmomo.net>
 <6797ac7a-5eda-2844-e538-163a8e2e665f@jmomo.net>
 <20160811123126.GE1644@makrotopia.org>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Gabor Juhos <juhosg@openwrt.org>, lede-dev@lists.infradead.org,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 John Crispin <john@phrozen.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 openwrt-devel@lists.openwrt.org
From: J Mo <jmomo@jmomo.net>
Message-ID: <420605a7-61ea-b4c8-65be-6f113a510d94@jmomo.net>
Date: Thu, 11 Aug 2016 06:15:32 -0700
MIME-Version: 1.0
In-Reply-To: <20160811123126.GE1644@makrotopia.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 08/11/2016 05:31 AM, Daniel Golle wrote:
> That's what I told you in the previous mail, removing the rootfs=
> parameter from the dts should do the trick, because you just cannot
> mount a ubi device (which is a character device in Linux) with a
> block-based filesystem (like squashfs). This cannot and won't ever
> work and you could either leave it to OpenWrt/LEDE's auto-probing to
> figure out what to do based on the rootfs type (non-ubifs vs. ubifs)
> or append even more board- and filesystem-specific crap to your cmdline
> such as ubiblock=... root=/dev/ubiblock0_1 (however, that then won't
> work for ubifs, thus the auto-probing patches).

... OH!

Well, I needed some extra intellectual clubbing to catch on.

NOW I remember reading the UBI docs, about glubi, the fact that volumes 
are char devices, and I even seem to remember some ALL CAPS red size-20+ 
text at the top of the page saying something about it.

Tomorrow I'll go read the docs again, because I know I remember reading 
that you could put a RO-squashfs in a UBI volume.  I just need to have 
it mounted the right way.
