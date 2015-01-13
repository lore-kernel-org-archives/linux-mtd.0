Date: Mon, 12 Jan 2015 20:04:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 11/13] mtd: st_spi_fsm: General tidy-up
Message-ID: <20150113040441.GL9759@ld-irv-0074>
References: <1418644760-18773-1-git-send-email-lee.jones@linaro.org>
 <1418644760-18773-12-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1418644760-18773-12-git-send-email-lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 15, 2014 at 11:59:18AM +0000, Lee Jones wrote:
> Due to the nature of the port (lots of copy/paste) much of the white-space
> is taken up by spaces instead of tab separators. This patch aims to change
> that.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

checkpatch.pl gives several warnings like this on this patch:

    WARNING:SPACE_BEFORE_TAB: please, no space before tabs

Please consider fixing them up.

Brian
