Received: from mga03.intel.com ([143.182.124.21])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5xHk-0000Yt-Ur
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 10:42:58 +0000
Message-ID: <1331289909.22872.65.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 09 Mar 2012 12:45:09 +0200
In-Reply-To: <OF3BA4765E.16024E23-ONC12579B5.004E96D5-C12579B5.004FAAF8@transmode.se>
References: <OF56C9B29B.F0D0442B-ONC12579B5.00450ADB-C12579B5.00458326@transmode.se>
 <1330697193.91058.YahooMailClassic@web29016.mail.ird.yahoo.com>
 <OF3BA4765E.16024E23-ONC12579B5.004E96D5-C12579B5.004FAAF8@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, philipp.zabel@gmail.com,
 Paul Parsons <lost.distance@yahoo.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-03-02 at 15:30 +0100, Joakim Tjernlund wrote:
> yes, UBI probably has some different use. One seems that it keeps
> erasing the
> same block over and over again if the erase fails. JFFS2 doesn't do
> that since
> you can't trust a block that is failing erase(how can you be sure that
> write will work?)
> So, IMHO, UBIFS should reconsider this policy. 

The thread is very long and I would like save my time by not going
through it. But if you could start a new thread and formulate the
problem with UBI, I could think about it a bit. I am open to change
policies if it is not too much work.  Otherwise I am open to give hints
and suggestions and accept patches which change the policy. :-)

-- 
Best Regards,
Artem Bityutskiy
