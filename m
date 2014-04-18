Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wb4tQ-000760-Tv
 for linux-mtd@lists.infradead.org; Fri, 18 Apr 2014 09:15:33 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "David Woodhouse (dwmw2@infradead.org)" <dwmw2@infradead.org>,
 "Bityutskiy, Artem (artem.bityutskiy@intel.com)"
 <artem.bityutskiy@intel.com>, Brian Norris <computersforpeace@gmail.com>
Subject: update patch state on patchwork
Date: Fri, 18 Apr 2014 09:15:03 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAC3B93@DBDE04.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I was just wondering if there is a script which can automatically search th=
e
git tree and update state of patch on patchwork [1]. If not then is it poss=
ible
to update the patch status from now onwards (or may be a month back) ?
This can be added as part of git-commit script used by Maintainers.

This would be helpful in reviewing and finding references. And would be
good for Maintainers too to keep a track of pending ones.

[1] http://patchwork.ozlabs.org/project/linux-mtd/list/


with regards, pekon
