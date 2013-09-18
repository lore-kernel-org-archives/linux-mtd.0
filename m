Date: Wed, 18 Sep 2013 14:45:42 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v2 1/2] mtd: atmel_nand: remove #if defined(CONFIG_OF)
 around OF-specific code
Message-ID: <20130918214542.GQ4550@ld-irv-0074.broadcom.com>
References: <1379475080-14984-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1379475080-14984-1-git-send-email-josh.wu@atmel.com>
Cc: dedekind1@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 18, 2013 at 11:31:19AM +0800, Josh Wu wrote:
> Since the of specific code are declared in <linux/of_mtd.h> regardless
> of CONFIG_OF. Remove the #if defined(CONFIG_OF) guard and use an
> IS_ENABLED(CONFIG_OF) instead.
> 
> Thanks to Ezequiel Garcia's for this protype.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Pushed both to l2-mtd.git. Thanks!

Brian
