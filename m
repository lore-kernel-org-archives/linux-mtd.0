Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgD7q-0007iC-OP
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 13:35:55 +0000
Message-ID: <1413812127.7906.282.camel@sauron.fi.intel.com>
Subject: Re: UBI/UBFS: ubi_eba_read_leb() reporting unmapped LEB
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Steve B <steve@baconbits.demon.co.uk>
Date: Mon, 20 Oct 2014 16:35:27 +0300
In-Reply-To: <alpine.DEB.2.02.1410101444510.2556@ubuntu>
References: <alpine.DEB.2.02.1410101444510.2556@ubuntu>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-10-10 at 14:45 +0100, Steve B wrote:
> Our test setup has the facility of pulling the power on the unit if a GPIO line
> is toggled, with this we can test sensitive areas of the code, can anyone suggest
> where would be a good place to perform this action.

Did you perform testing with UBI/UBIFS debug messages on? Or the
messages in this e-mail were enable after the corruption happened?

Artem.
