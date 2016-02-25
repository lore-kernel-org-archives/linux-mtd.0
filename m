Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYtUs-0005NF-TU
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2016 10:50:15 +0000
Message-ID: <1456397391.4719.30.camel@gmail.com>
Subject: Re: Filesystems over UBI can't handle badblocks
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Guilherme de Oliveira Costa <guilherme.oliveira@autotrac.com.br>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 25 Feb 2016 12:49:51 +0200
In-Reply-To: <7F9DB42F7DDA544EA3EB31D694929A30EB84DA@PERU.autotrac.corp>
References: <7F9DB42F7DDA544EA3EB31D694929A30EB84DA@PERU.autotrac.corp>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2016-02-24 at 20:08 +0000, Guilherme de Oliveira Costa wrote:
> As you can see, UBI starts just fine, and I'm able to initialize
> ubiblk and at least mount the filesystem. I thought UBI was supposed
> to make any badblocks transparent to the upper layers... Is there a
> problem with that tought, or did my manual tampering (with nand
> markbad) got in the way of UBI's bad block management capabilities?

It is right that UBI makes things transparent to upper layers. However,
this is true only if you follow a set of reasonable rules, like you do
not go and change the MTD partition directly, all the changes go via
UBI.

Marking an eraseblock as bad is a change, and it should be done via
UBI, not directly via MTD.

Now, how to do it via UBI? I think this is not supported, but it can be
implemented, I believe.
