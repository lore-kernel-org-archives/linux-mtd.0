Received: from nabagan.bluegap.ch ([88.198.58.248])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5bgJ-0003Rw-Ei
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 07:20:43 +0000
Message-ID: <484CD9C0.8060105@bluegap.ch>
Date: Mon, 09 Jun 2008 09:20:32 +0200
From: Markus Schiltknecht <markus@bluegap.ch>
MIME-Version: 1.0
To: "=?UTF-8?B?SsO2cm4gRW5nZWw=?=" <joern@logfs.org>
Subject: Re: Intel Turbo Memory
References: <261293.50747.qm@web31815.mail.mud.yahoo.com>
	<20080605064814.GB17037@logfs.org>
In-Reply-To: <20080605064814.GB17037@logfs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Russell Fleitman <fleitman68@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Jörn Engel wrote:
> It appears as if those devices are raw flash and could be accessed
> through mtd - provided someone either has documentation or creates some
> by reverse engineering.

Isn't that the first - and so far only - device which adheres to their 
NVMHCI specification [1]?

Markus


[1]: Non-Volatile Memory Host Controller Interface Specification:
http://www.intel.com/standards/nvmhci/index.htm
