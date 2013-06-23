Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UqohJ-0007kk-0t
 for linux-mtd@lists.infradead.org; Sun, 23 Jun 2013 18:07:34 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "Balbi, Felipe" <balbi@ti.com>
Subject: RE: [PATCH v3 1/4] mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW ECC
 configurations in device_probe
Date: Sun, 23 Jun 2013 18:06:51 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9DF3A8@DBDE04.ent.ti.com>
References: <1371935030-20773-1-git-send-email-pekon@ti.com>
 <1371935030-20773-2-git-send-email-pekon@ti.com>,
 <20130622214717.GA1569@arwen.pp.htv.fi>
In-Reply-To: <20130622214717.GA1569@arwen.pp.htv.fi>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Cousson, Benoit" <b-cousson@ti.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> From: "Gupta, Pekon" <pekon@ti.com>

> Can you fix your From address ? I guess:
> git config --global user.name "Pekon Gupta"
> should do it, but you'll have to recommit those commits with:
> git commit --amend --reset-author
[Pekon]: Thanks for pointing it out. I had missed this.
I updated my global config recently, But as this patch series was=20
ported from my older branch, so older 'from' string continued.
Fixed now and re-sent.

with regards, pekon=
