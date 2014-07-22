Date: Mon, 21 Jul 2014 20:12:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v2 1/3] mtd: atmel_nand: add NFC status error check
Message-ID: <20140722031214.GD7537@ld-irv-0074>
References: <1402393811-24578-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402393811-24578-1-git-send-email-josh.wu@atmel.com>
Cc: Matthieu.CRAPET@ingenico.com, linux-mtd@lists.infradead.org,
 voice.shen@atmel.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 10, 2014 at 05:50:09PM +0800, Josh Wu wrote:
> Add a new function to read the NFC status. Meantime, this function will
> theck if there is any errors in NFC.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Fixed up some of the wording and pushed to l2-mtd.git. Thanks!

Brian
