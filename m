Subject: Re: [PATCH] mtd: cfi_probe: print manufacturer and id of probed chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20100629083204.11146.37097.stgit@dev.siriade.com>
References: <20100629083204.11146.37097.stgit@dev.siriade.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 12:54:53 +0300
Message-ID: <1279014893.31639.19.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-06-29 at 10:32 +0200, Guillaume LECERF wrote:
> 2010/6/29 Artem Bityutskiy <dedekind1@gmail.com>:
> > This is not a debugging print, so I think you should do it in a more
> > user-friendly way. E.g., "manufect. ID %#08x, chip id %#08x".
> 
> OK, here it is again.
> 
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>

Pushed to l2-mtd-2.6.git / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
