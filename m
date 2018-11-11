Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLwlj-00025X-R2
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 20:55:45 +0000
Date: Sun, 11 Nov 2018 21:55:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Cc: boris.brezillon@bootlin.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 juliensu@mxic.com.tw, zhengxunli@mxic.com.tw
Subject: Re: [PATCH] mtd: rawnand: Add All 1.8V AC chips have a broken
 GET_FEATURES(TIMINGS)
Message-ID: <20181111215531.7ee18d98@xps13>
In-Reply-To: <1540449871-7224-2-git-send-email-masonccyang@mxic.com.tw>
References: <1540449871-7224-1-git-send-email-masonccyang@mxic.com.tw>
 <1540449871-7224-2-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mason,

masonccyang@mxic.com.tw wrote on Thu, 25 Oct 2018 14:44:31 +0800:

> From: Mason Yang <masonccyang@mxic.com.tw>
>=20
> Make sure we flag all 1.8V broken chips as not supporting this features.
>=20
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---

Applied to nand/next (with the title slightly modified).

Thanks,
Miqu=C3=A8l
