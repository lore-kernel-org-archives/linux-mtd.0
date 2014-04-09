Date: Wed, 9 Apr 2014 00:27:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/15] mtd: st_spi_fsm: Align with ST's internal
 development
Message-ID: <20140409072710.GF3131@norris-Latitude-E6410>
References: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 26, 2014 at 04:39:14PM +0000, Lee Jones wrote:
> This patch-set updates ST's FSM SPI-NOR driver with all the internal
> goodness which has happened since the initial (now upstreamed) snapshot
> was taken. It covers just over 6 months worth of internal development
> and bug-fixes. A final whitespace clean-up is also appended to the set
> - to make it look pretty and stuff. :)

I applied the first 6 to l2-mtd.git/spinor. Please rebase the others so
they can apply, and address the DT comment I sent.

Thanks,
Brian
