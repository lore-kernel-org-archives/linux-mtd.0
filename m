From: David Woodhouse <dwmw2@infradead.org>
To: Wookey <wookey@aleph1.co.uk>
In-Reply-To: <20040517163945.GJ12570@knossos.aleph1.co.uk>
References: <20040517163945.GJ12570@knossos.aleph1.co.uk>
Content-Type: text/plain
Message-Id: <1084818456.4831.10.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 17 May 2004 19:27:36 +0100
Content-Transfer-Encoding: 7bit
cc: YAFFS list <yaffs@toby-churchill.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: blkmtd (and YAFFS)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-05-17 at 17:39 +0100, Wookey wrote:
> blkmtd appears to allow this but I see few mentions of it since early 2002.
> Is it stable, does it work, has anyone ever tried it with YAFFS?

It doesn't give you OOB data, so I don't know if it will work with
YAFFS. It certainly works with JFFS2.

The JFFS2 support could be severely optimised on blkmtd though --
batching into 512 byte writes as we do for NAND but without the ECC or
putting cleanmarkers in the OOB area (or possibly without cleanmarkers
at all although that's harder).

-- 
dwmw2
