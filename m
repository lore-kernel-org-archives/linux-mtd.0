Message-ID: <52A83258.5070506@st.com>
Date: Wed, 11 Dec 2013 09:37:28 +0000
From: Angus Clark <angus.clark@st.com>
MIME-Version: 1.0
To: Lee Jones <lee.jones@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 01/36] mtd: st_spi_fsm: Allocate resources and register
 with MTD framework
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-2-git-send-email-lee.jones@linaro.org>
 <20131210204635.GD27149@ld-irv-0074.broadcom.com>
 <20131211084856.GF2390@lee--X1>
In-Reply-To: <20131211084856.GF2390@lee--X1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linus.walleij@linaro.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lee and Brian,

I would also like to thank Brian; as always, very sensible comments.

I am tied up most of today and off work tomorrow (Christmas shopping!), but I
will set aside Friday to go through the comments in detail.  I should also have
some time next week if necessary, subject to any panics that might arise!

I also intend to respond to Huang's updated 'spi-nor' framework at the same
time.  At some stage, I would expect some of the device probing code in
st_spi_fsm, particularly the configuration of read/write/erase operations based
on capabilities, to be pulled into the 'spi-nor' framework.  I do not see this
an an obstacle to st_spi_fsm being integrated earlier though; it's presence in
the kernel would provide another example of a H/W Controller that 'spi-nor'
needs to accommodate.

Cheers,

Angus


On 12/11/2013 08:48 AM, Lee Jones wrote:
> Hi Brian,
> 
> Thank you for taking the time to review, it's very much appreciated.
> You bought out some interesting points that I'm happy to go away and
> rectify. Firstly however, as I inherited this code I'd like to give
> Angus a chance to comment before we go off on our own tangent and
> rework some of the good code which perhaps should remain unchanged.
> 
> Angus, do you have enough time to go through Brian's review comments
> and perhaps reply to the ones that you feel would benefit from your
> expert knowledge. To be frank, some of the questions that were asked I
> wouldn't be able to answer without your guidance in any case.
> 
> Thanks both.
> 
> Kind regards,
> Lee
> 
