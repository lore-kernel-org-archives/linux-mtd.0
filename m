Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5Ys4-0002YC-Uj
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 07:34:17 +0000
Received: by wwb39 with SMTP id 39so2670879wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 00:34:15 -0700 (PDT)
Subject: Re: [PATCH 2.6.34 1/2] cfi_cmdset_0002.c: Read max timeouts from
	cfi query data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: list-09_linux_mtd@tqsc.de, Guillaume LECERF <glecerf@gmail.com>, Joakim
	Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <4D8C49C7.5090700@tqsc.de>
References: <4D8C49C7.5090700@tqsc.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 10:31:52 +0300
Message-ID: <1301643112.2789.18.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-03-25 at 08:52 +0100, Markus Niebel wrote:
> The max timeouts are coded in the electronic flash data sheet (CFI query
> data). Read the timeouts and store them in the chips structure table.
> 
> Signed-off-by: Markus Niebel <markus.niebel@tqs.de>

Hi,

could CFI guys please review these patches?

http://thread.gmane.org/gmane.linux.drivers.mtd/34176
http://thread.gmane.org/gmane.linux.drivers.mtd/34177

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
