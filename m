Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ENAD0-0002Bf-MS
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2005 10:25:45 -0400
Message-ID: <4343E24E.8020507@arcom.com>
Date: Wed, 05 Oct 2005 15:25:18 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: Jan Pedersen <jan.pedersen@glaze.dk>
References: <20051004204918.E02AE37646A@rocket.glaze.se>
In-Reply-To: <20051004204918.E02AE37646A@rocket.glaze.se>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] cfi: remove warning message on expected behaivor
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jan Pedersen wrote:
> When an erase operation is in progress, the DQ5 (data bit 5 / exceeded
> timing limit) pin on the flash chips may raise just before operation
> complete is detected. This is expected behaivor because when the erase is
> complete, DQ5 switches from 'exceeded timing limit' to 'data bit 5' which
> therefore might be read as '1' just before operation complete is detected.
> This fix is well tested.

If you look at the current cfi_cmdset_0002.c (in 2.6) you'll notice that
all it does it check for toggling bits.  The software timeout handles
failed erases and writes rather than checking DQ5.

Trying to handle the various error bits was deemed too tricky/complex to
get right for interleaved chips.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
