Received: from relay02.pair.com ([209.68.5.16])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KaYdg-0003u1-PZ
	for linux-mtd@lists.infradead.org; Tue, 02 Sep 2008 16:21:57 +0000
Date: Tue, 02 Sep 2008 09:21:37 -0700
Subject: Re: [PATCH] [MTD-UTILS] nandwrite: read from stdin support
From: Grant Erickson <gerickson@nuovations.com>
To: Tommi Airikka <tommi.airikka@ericsson.com>
Message-ID: <C4E2B621.1167B%gerickson@nuovations.com>
In-Reply-To: <816E1A2C67CC2B488292E7A0981FFD7702AC16FB@esealmw110.eemea.ericsson.se>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/2/08 2:04 AM, Tommi Airikka wrote:
> Here is a patch that adds read from stdin support for nandwrite.
> I have tried it with 'cat filename.jffs2 | nandwrite -i filesize -p
> /dev/mtdX -'  and it did work.

Tommi:

Thank you for this patch. Your timing is perfect since I had written about
precisely this feature a little over a week ago:

http://lists.infradead.org/pipermail/linux-mtd/2008-August/022556.html

If I can get my nanddump deblocking patch completed, the following should
work as a use case:

    flash_eraseall -q <device-out>
    nanddump -o -b -s <offset> -l <size> <device-in> | nandwrite -q -p -s
<offset> <device-out>

Regards,

Grant
