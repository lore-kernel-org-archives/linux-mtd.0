Received: from sargas.omicron.se ([194.52.58.130])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16azNn-0002ii-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 13:23:35 +0000
Date: Wed, 13 Feb 2002 14:33:36 +0100
From: Daniel =?iso-8859-1?Q?Engstr=F6m?= <daniel@omicron.se>
To: robert@schwebel.de
Cc: linux-mtd@lists.infradead.org, "Klaus-D . Walter" <k.d.walter@t-online.de>
Subject: Re: MTD concat layer
Message-ID: <20020213143336.C26867@jupiter.omicron.se>
References: <31104.1013598277@redhat.com> <Pine.LNX.4.33.0202131235550.24650-100000@callisto.local>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.33.0202131235550.24650-100000@callisto.local>; from robert@schwebel.de on Wed, Feb 13, 2002 at 12:37:48 +0100
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On 2002.02.13 12:37 Robert Schwebel wrote:
> The DNP has only one Intel 28F016F3 flash chip. Does anybody know
> something about the reason why this strange layout for the BIOS was
> chosen?

The realmode BIOS must reside at 0xf0000-0xfffff in system memory. 
Depending
on which options the chipset offers to map the flash, the BIOS may have to
be located in the middle of the flash device.

/Daniel
