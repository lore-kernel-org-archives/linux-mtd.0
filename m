Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtXeB-0007XN-Kj
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 09:12:55 +0000
Message-ID: <1446541937.6126.125.camel@gmail.com>
Subject: Re: master node can not be recovered
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Bean Huo
 =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?= "(beanhuo)"
 <beanhuo@micron.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Date: Tue, 03 Nov 2015 11:12:17 +0200
In-Reply-To: <5637934D.5000503@nod.at>
References: <A765B125120D1346A63912DDE6D8B6310BF4FB2A@NTXXIAMBX02.xacn.micron.com>
 <5637934D.5000503@nod.at>
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

On Mon, 2015-11-02 at 17:46 +0100, Richard Weinberger wrote:
> ubifs_recover_master_node() is very strict.

Just like the rest of the recovery code, the master node part is
consistent with that.

> Can it be that in your case more than the last written page is
> corrupted?

I suspect so too.
