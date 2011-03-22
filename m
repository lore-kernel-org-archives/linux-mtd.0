Received: from eu1sys200aog114.obsmtp.com ([207.126.144.137])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q1tKo-00039v-PS
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2011 04:36:48 +0000
Message-ID: <4D882750.6090706@st.com>
Date: Tue, 22 Mar 2011 10:06:32 +0530
From: viresh kumar <viresh.kumar@st.com>
MIME-Version: 1.0
To: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>
Subject: Re: [PATCH] Newly erased page read workaround
References: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
In-Reply-To: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Vipin KUMAR <vipin.kumar@st.com>, Shiraz HASHIM <shiraz.hashim@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/24/2011 11:40 AM, Viresh KUMAR wrote:
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

Artem, David,

Have you pushed this patch for 39-rc1?

-- 
viresh
