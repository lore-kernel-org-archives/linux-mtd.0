Date: Tue, 19 Dec 2017 06:34:59 +0100
From: Willy Tarreau <w@1wt.eu>
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: pxa3xx_nand times out in 4.14 with JFFS2
Message-ID: <20171219053459.GA7756@1wt.eu>
References: <20171217190056.GA1107@1wt.eu>
 <CAAEAJfArtxcWgcjHAb__3BQxWEBgWU8uWtHGYETc-m9eUs91nA@mail.gmail.com>
 <20171217211650.GA6815@1wt.eu> <20171217222611.59f9031b@bbrezillon>
 <20171217224617.1f9b8b84@xps13> <20171218063715.GA20461@1wt.eu>
 <20171218070617.GA16559@1wt.eu> <20171218112208.0057634d@xps13>
 <20171218215217.GA17755@1wt.eu> <20171219011315.2fa0f9d1@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171219011315.2fa0f9d1@xps13>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 19, 2017 at 01:13:15AM +0100, Miquel RAYNAL wrote:
> Boris' fix wouldn't apply anyway as it was written for pxa3xx_nand.c
> and here you are using marvell_nand.c and the code is really different.

yep I noticed already during the first problem, I couldn't even find
where the equivalent part of the code was located.

> Thanks again for your help, reviews or tested-by's are welcome for this
> driver ;)

do not hesitate to add my tested-by on your current patchset if that helps.

Willy
