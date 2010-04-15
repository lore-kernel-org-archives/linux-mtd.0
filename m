Received: from mail2.aviatnet.com ([192.147.115.134])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2Vad-0004P8-TJ
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2010 20:23:08 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: selecting UBI boot partition on startup
Date: Thu, 15 Apr 2010 13:22:06 -0700
Message-ID: <0687C69BF96AF349833719247B11C1CE76EDF7@exchtxus2.HSTX.global.vpn>
In-Reply-To: <20100415061854.B7757EEE8D8@gemini.denx.de>
References: <0687C69BF96AF349833719247B11C1CE76ED6C@exchtxus2.HSTX.global.vpn>
	<20100415052950.5224CEEE8D8@gemini.denx.de>
	<0687C69BF96AF349833719247B11C1CE76ED80@exchtxus2.HSTX.global.vpn>
	<20100415061854.B7757EEE8D8@gemini.denx.de>
From: "Deon Carr" <Deon.Carr@Aviatnet.com>
To: "Wolfgang Denk" <wd@denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message
<0687C69BF96AF349833719247B11C1CE76ED80@exchtxus2.HSTX.global.vpn> you
wrote:

> Redundant environment is a standard feature in U-Boot. It covers
> exactly the issue you have in mind - if you have a reset or power loss
> while writing the environment, U-Boot will automatically fall back to
> the redudant copy and use the previously used settings.

> All you have to do is to enable this feature in your board config
> file.

Found it. Thanks for the help.=20

Deon
=20
