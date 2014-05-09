Date: Fri, 9 May 2014 14:05:26 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [PATCH v3 5/9] mtd: nand: add sunxi NAND flash controller support
Message-ID: <20140509170526.GA9768@arch.cereza>
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
 <1394647664-8258-6-git-send-email-b.brezillon.dev@gmail.com>
 <20140509160341.GA6984@arch.cereza> <536D069A.40401@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <536D069A.40401@gmail.com>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-doc@vger.kernel.org,
 Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, dev@linux-sunxi.org,
 Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>,
 linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09 May 06:47 PM, Boris BREZILLON wrote:
> > Can you add some documentation about this read-back stuff?
> 
> This has nothing to do with read-back, RB means ready/busy :-).
> 

Hehe... right... I guess I was thinking in read/busy.

See? That's why you need to document it: so it's fool-proof.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
