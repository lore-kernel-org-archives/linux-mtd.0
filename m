Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9HZY-0001q1-I1
 for linux-mtd@lists.infradead.org; Wed, 16 Dec 2015 19:17:13 +0000
Received: by mail-pf0-x22e.google.com with SMTP id 68so16652182pfc.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Dec 2015 11:16:51 -0800 (PST)
Date: Wed, 16 Dec 2015 11:16:48 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 dehrenberg@google.com, cernekee@gmail.com, sboyd@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, agross@codeaurora.org
Subject: Re: [PATCH v4 2/5] mtd: nand: Qualcomm NAND controller driver
Message-ID: <20151216191648.GA28424@google.com>
References: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-3-git-send-email-architt@codeaurora.org>
 <20151216101547.74c77bdd@bbrezillon>
 <567151BC.7010508@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <567151BC.7010508@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 16, 2015 at 05:27:48PM +0530, Archit Taneja wrote:
> On 12/16/2015 02:45 PM, Boris Brezillon wrote:
> >On Wed, 19 Aug 2015 10:19:03 +0530
> >Archit Taneja <architt@codeaurora.org> wrote:

> >>+	return mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
> >
> >	return mtd_device_parse_register(mtd, NULL, NULL, NULL 0);
> 
> Will fix.

Or just:

	return mtd_device_register(mtd, NULL, 0);
