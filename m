Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8xJB-0003Dx-Ns
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 20:34:26 +0000
Received: by mail-pd0-f179.google.com with SMTP id fp1so6730862pdb.10
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 12:34:04 -0800 (PST)
Date: Wed, 7 Jan 2015 12:34:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxpart: lower minimal blocksize to 4Ki (from
 64Ki)
Message-ID: <20150107203401.GM9759@ld-irv-0074>
References: <1418060700-1977-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1418060700-1977-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 08, 2014 at 06:45:00PM +0100, Rafał Miłecki wrote:
> Some devices like Netgear WNR1000v3 or WGR614v10 have partitions aligned
> to 0x1000. Using bigger blocksize stopped us from detecting some parts.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Applied to l2-mtd.git. Thanks.

Brian
