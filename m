Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5ILJ-0001IG-1Z
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 13:55:22 +0000
Subject: Re: [PATCH] Newly erased page read workaround
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Viresh Kumar <viresh.kumar@st.com>
In-Reply-To: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
References: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 16:51:15 +0300
Message-ID: <1301579475.2828.82.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

sorry for late reply, was too busy and also missed your patch somehow.

On Thu, 2011-02-24 at 11:40 +0530, Viresh Kumar wrote:
> From: Vipin Kumar <vipin.kumar@st.com>
> 
> A newly erased page contains ff in data as well as spare area. While reading an
> erased page, the read out ecc from spare area does not match the ecc generated
> by fsmc ecc hardware accelarator. This is because ecc of data ff ff is not ff
> ff. This leads to errors when jffs2 fs erases and reads back the pages to
> ensure consistency.
> 
> This patch adds a software workaround to ensure that the ecc check is not
> performed for erased pages. An erased page is checked by checking data as ff ff.
> 
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
> Acked-by: Linus Walleij <linus.walleij@stericsson.com>

...

> +		/*
> +		 * This is a temporary erase check. A newly erased page read
> +		 * would result in an ecc error because the oob data is also
> +		 * erased to FF and the calculated ecc for an FF data is not
> +		 * FF..FF.
> +		 * This is a workaround to skip performing correction in case
> +		 * data is FF..FF
> +		 */
> +		for (k = 0; k < eccsize; k++) {
> +			if (*(p + k) != 0xff)
> +				break;
> +		}
> +

So eccsize is 512, and you are going to compare 512 bytes on every read?
Isn't it a very bad and wasteful solution? May be you could invent
something less straight-forward but more optimal?

Let's suppose ECC corresponding to all 0xFFs is P. May be you could do
this wasteful check only if ECC == P, not all the time?

Also, Ivan pointed you the right thing - you might have bit-flips on an
erased eraseblock. If not on freshly, then on an erasblock which was
erased and then not used for long time. If this is not of your concern,
then at least write this in the comments and tell that you know about
this issue but for reasons X and Y you do not handle them.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
