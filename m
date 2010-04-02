Subject: Re: [PATCH v2 1/7] mtd: cfi_probe: enter Auto Select Mode after
	filling cfi->cfiq members
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <s2gb8e9195f1004020446ndf60e7ddqf17eb5137a1e3269@mail.gmail.com>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
	<1270042093.15073.19.camel@localhost>
	<s2gb8e9195f1004020446ndf60e7ddqf17eb5137a1e3269@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 02 Apr 2010 15:11:41 +0300
Message-ID: <1270210301.15073.65.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-04-02 at 13:46 +0200, Guillaume LECERF wrote:
> 2010/3/31 Artem Bityutskiy <dedekind1@gmail.com>:
> > Pushed the series to the "dunno" branch of my l2-mtd-2.6.git tree,
> > thanks.
> 
> Thanks.
> May I ask you what is the status of this branch ? Do you plan to merge
> it to mtd-2.6 (and finally to the official kernel.git) ?

dwwm2 should at some point look at that branch and take your patches,
and then merge them upstream, unless he does not like something, in
which case I guess he should let you know what is wrong.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
