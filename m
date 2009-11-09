Subject: Re: NAND: Add option to quieten off the no device found messgae
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Dooks <ben@simtec.co.uk>
In-Reply-To: <20091102181232.800355727@fluff.org.uk>
References: <20091102181232.800355727@fluff.org.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 09 Nov 2009 13:02:41 +0200
Message-Id: <1257764561.21596.252.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Simtec Linux Team <linux@simtec.co.uk>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-11-02 at 18:12 +0000, Ben Dooks wrote:
> plain text document attachment (nand-update-probe3.patch)
> Add NAND_SCAN_SILENT_NODEV to chip->options to the user-worrying messages
> 'No NAND device found!!!'. This message often worries users (was three
> exclamation marks really necessary?) and especially in systems such as the
> Simtec Osiris where there may be optional NAND devices which are not
> known until probe time.
> 
> Revised version of the original NAND_PROBE_SPECULATIVE patch after comments
> by Artem Bityutskiy about adding a whole new call.
> 
> Signed-off-by: Ben Dooks <ben@simtec.co.uk>
> Signed-off-by: Simtec Linux Team <linux@simtec.co.uk>

Pushed both patches to my l2-mtd-2.6 tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
