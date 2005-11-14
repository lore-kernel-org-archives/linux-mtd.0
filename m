Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EbbMM-00077G-4F
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2005 05:14:54 -0500
Message-ID: <43786392.5030102@arcom.com>
Date: Mon, 14 Nov 2005 10:14:42 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: jbowler@acm.org
References: <006101c5e8e7$bb98f460$1001a8c0@kalmiopsis>
In-Reply-To: <006101c5e8e7$bb98f460$1001a8c0@kalmiopsis>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: 'Alessandro Zummo' <azummo-lists@towertech.it>,
	linux-mtd@lists.infradead.org
Subject: Re: ixp4xx stuff
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

John Bowler wrote:
> 
> along with the other NSLU2 patches.  We found that it is now necessary to
> set CONFIG_MTD_LE_BYTE_SWAP - with the NSLU2 patches CONFIG_MTD_BE_BYTE_SWAP
> must be set.  If this is not done (i.e. if BE is set) the flash probe fails.

Neither of these options should be enabled.  The flash data is returned
in the same order regardless of the endianness of the CPU.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
