Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZvGF-000641-7F
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 09:37:19 +0000
Message-ID: <1530524174.469.95.camel@gmail.com>
Subject: Re: [PATCH v3 1/2] ubi: provide a way to skip CRC checks
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@bootlin.com>, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Date: Mon, 02 Jul 2018 12:36:14 +0300
In-Reply-To: <20180702095121.67bc61ef@bbrezillon>
References: <cover.6d66955e7c1848c8255870deb42eddb69bd276f3.1530169759.git-series.quentin.schulz@bootlin.com>
 <3f9cef553d4f5da3fe2d76113d79ada1f0fe5224.1530169759.git-series.quentin.schulz@bootlin.com>
 <1530516625.469.82.camel@gmail.com> <20180702095121.67bc61ef@bbrezillon>
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

On Mon, 2018-07-02 at 09:51 +0200, Boris Brezillon wrote:
> Well, I thought checking the CRC just after updating the volume made
> sense, just to make sure things were written correctly on the medium.
> Let's add a comment explaining why we keep the check here, unless you
> see a strong reason to get rid of this check in the update path.

I am fine with this, thanks.
