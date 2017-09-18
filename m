Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dtw70-0003Xe-8L
 for linux-mtd@lists.infradead.org; Mon, 18 Sep 2017 13:29:24 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Jaap de Jong <jaap.dejong@nedap.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: ubi resize shrink volume
Date: Mon, 18 Sep 2017 15:29:19 +0200
Message-ID: <1570263.NLm9V0WY08@blindfold>
In-Reply-To: <43d9497f-ba72-d7e2-757c-79c88411c630@nedap.com>
References: <f91150f4-8aff-1069-afaf-d602c4494fdc@nedap.com>
 <2434284.gX760p0sQM@blindfold>
 <43d9497f-ba72-d7e2-757c-79c88411c630@nedap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Montag, 18. September 2017, 14:32:56 CEST schrieb Jaap de Jong:
> >> Sorry for the confusion.
> >> Yes, I want to shrink of a not-mounted UBIFS preferably in u-boot.
> >> In the posts I read it should not be that hard to do, so I was wondering
> >> if anyone had taken the effort to implement this...
> > 
> > Nope. So far nobody cared enough about this feature.
> > Please note that many other major filesystems alos don't support this.
> > Such das XFS.
> 
> Well we do care!
> Any thoughts to share? We could use some help...
> My first impression was that the size of the partition was just a
> maximum number of PEBs to use for it,
> so lowering that value would just set a new limit and whatever PEBs were
> used for that specific partition
> was under control of the wear-levelling algorithms. But apparently it is
> more complicated.

Well, on UBI level it is easy.
On UBIFS you need to do more.

Think about the situation where you have N LEBs where M are in use by UBIFS 
and you reduce the volume size to X.
Assuming that all existing files can fit into X LEBs, therefore X >= M.
Now you have to find all UBIFS data structures that have a reference to a LEB 
(> X) that is now outside of the new volume size. You have move data around 
patch all references.

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
