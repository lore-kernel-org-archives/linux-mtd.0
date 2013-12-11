Date: Wed, 11 Dec 2013 10:01:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Angus Clark <angus.clark@st.com>
Subject: Re: [PATCH v3 01/36] mtd: st_spi_fsm: Allocate resources and
 register with MTD framework
Message-ID: <20131211180103.GQ27149@ld-irv-0074.broadcom.com>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-2-git-send-email-lee.jones@linaro.org>
 <20131210204635.GD27149@ld-irv-0074.broadcom.com>
 <20131211084856.GF2390@lee--X1> <52A83258.5070506@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52A83258.5070506@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Angus,

On Wed, Dec 11, 2013 at 09:37:28AM +0000, Angus Clark wrote:
> At some stage, I would expect some of the device probing code in
> st_spi_fsm, particularly the configuration of read/write/erase operations based
> on capabilities, to be pulled into the 'spi-nor' framework.

Yes, I think this driver's device probing is starting to improve the ID
table approach that we currently have, which is why I directed a few
comments at it. I don't think it goes far enough to being useful to
others yet, though. It employs a few hacks that tie it very closely to
its own implementation, and I think this can be improved now, before its
methods are entrenched too much.

> I do not see this
> an an obstacle to st_spi_fsm being integrated earlier though; it's presence in
> the kernel would provide another example of a H/W Controller that 'spi-nor'
> needs to accommodate.

No, I don't think a generally-useful framework will pop up overnight,
but I think this driver can be one piece of the puzzle.

I await your further responses.

Thanks,
Brian
