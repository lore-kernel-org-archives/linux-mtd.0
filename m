Received: from yx-out-1718.google.com ([74.125.44.157])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KfcVN-0006Tw-LL
	for linux-mtd@lists.infradead.org; Tue, 16 Sep 2008 15:30:18 +0000
Received: by yx-out-1718.google.com with SMTP id 3so1338545yxi.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Sep 2008 08:30:16 -0700 (PDT)
Message-ID: <6934efce0809160830v461a115ch305aeaadaf5d9883@mail.gmail.com>
Date: Tue, 16 Sep 2008 08:30:16 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Ricard Wanderlof" <ricard.wanderlof@axis.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <Pine.LNX.4.64.0809160856190.5966@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080915163421.GA13631@shareable.org>
	<Pine.LNX.4.64.0809160856190.5966@lnxricardw.se.axis.com>
Cc: "cotte@de.ibm.com" <cotte@de.ibm.com>, Greg Ungerer <gerg@snapgear.com>,
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
	"nickpiggin@yahoo.com.au" <nickpiggin@yahoo.com.au>,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	Jamie Lokier <jamie@shareable.org>,
	"Linux-kernel@vger.kernel.org" <Linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	"tim.bird@am.sony.com" <tim.bird@am.sony.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> NAND is significantly faster when writing than NOR, read speed is of the
> same magnitude, possibly slower in many cases.

Right.

Specifically, read bandwidth is on the same order of magnitude.
However the read latency of NAND is a couple orders of magnitude
higher (100ns vs 20,000ns) so it depends on what you are doing.
