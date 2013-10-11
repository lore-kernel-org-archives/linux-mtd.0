Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUiEM-0004JQ-NF
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 19:18:37 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH] mtg: docg3: use free_bch() instead of kfree()
References: <CAPgLHd_vT4cJ1F1a6TDzYb2LFSb-me90K58K22Z=ae3VsOfbng@mail.gmail.com>
Date: Fri, 11 Oct 2013 21:17:51 +0200
In-Reply-To: <CAPgLHd_vT4cJ1F1a6TDzYb2LFSb-me90K58K22Z=ae3VsOfbng@mail.gmail.com>
 (Wei Yongjun's message of "Fri, 11 Oct 2013 12:40:21 +0800")
Message-ID: <878uxzy5uo.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, jg1.han@samsung.com,
 linux-kernel@vger.kernel.org, yongjun_wei@trendmicro.com.cn,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org, dan.carpenter@oracle.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Wei Yongjun <weiyj.lk@gmail.com> writes:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Use free_bch() instead of kfree() to free init_bch()
> allocated data.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
