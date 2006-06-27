Subject: Re: [PATCH] MTD performance issues on XIP configuration.
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.56.0606261628560.8547@pentafluge.infradead.org>
References: <Pine.LNX.4.56.0606261628560.8547@pentafluge.infradead.org>
Content-Type: text/plain
Date: Tue, 27 Jun 2006 14:40:59 +0100
Message-Id: <1151415660.17609.132.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: nico@cam.org, davide.cascone@st.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-06-26 at 16:37 +0100, Alexey Korolev wrote:
> Hi All,
> 
> Current implementation of cfi_cmdset_0001 driver has serious performance issues in case of enabled MTD XIP configuration.
> Performance tests showed RAW write performance on XIP configuration ~60Kb/sec on Sibley (It should be over 400Kb/s)
> I investigated this problem:
> When we perform write or lock/unlock operation we call WAIT_TIMEOUT which passes chip_op_time = 0 to function xip_wait_for_operation. When zero timeout is passed to xip_wait_for_operation it automatically sets the usec = 500000 - and we send cpu to idle when it is unnecessary.
> To fix the issue I corrected the condition for sending CPU to idle.
> 
> If you don't have any concerns regarding the following code could you please put it into the repository?

Code looks fine but please could you resubmit with an appropriate
Signed-off-by: line?

And how did you send your mail, btw? You should be sending from
akorolev@infradead.org rather than at any specific host.

-- 
dwmw2
