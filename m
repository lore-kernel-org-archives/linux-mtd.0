Received: from vps0.lunn.ch ([178.209.37.122])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAxu0-0003bx-L8
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 12:18:06 +0000
Date: Wed, 17 May 2017 14:17:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] mtd: mchp23k256: Add support for mchp23lcv1024
Message-ID: <20170517121716.GF19968@lunn.ch>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-5-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170517053908.26138-5-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +	switch (chip){

Space please, between ) and {

      Andrew
