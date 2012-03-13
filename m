Received: from gw1.transmode.se ([195.58.98.146])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7N56-0004Z9-63
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 08:27:45 +0000
In-Reply-To: <1331289909.22872.65.camel@sauron.fi.intel.com>
References: <OF56C9B29B.F0D0442B-ONC12579B5.00450ADB-C12579B5.00458326@transmode.se>
 <1330697193.91058.YahooMailClassic@web29016.mail.ird.yahoo.com>
 <OF3BA4765E.16024E23-ONC12579B5.004E96D5-C12579B5.004FAAF8@transmode.se>
 <1331289909.22872.65.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: dedekind1@gmail.com
Message-ID: <OF75BE5BF1.29391153-ONC12579C0.002D7F3D-C12579C0.002E7828@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 13 Mar 2012 09:27:34 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, philipp.zabel@gmail.com,
 Paul Parsons <lost.distance@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>
> On Fri, 2012-03-02 at 15:30 +0100, Joakim Tjernlund wrote:
> > yes, UBI probably has some different use. One seems that it keeps
> > erasing the
> > same block over and over again if the erase fails. JFFS2 doesn't do
> > that since
> > you can't trust a block that is failing erase(how can you be sure that
> > write will work?)
> > So, IMHO, UBIFS should reconsider this policy.
>
> The thread is very long and I would like save my time by not going
> through it. But if you could start a new thread and formulate the
> problem with UBI, I could think about it a bit. I am open to change
> policies if it is not too much work.  Otherwise I am open to give hints
> and suggestions and accept patches which change the policy. :-)

I just noted from one of the logs Paul sent, it LOOKED like UBI tried
to erase the same sector several times if erase failed, gave me the impression
that UBI would try erasing a failing sector over and over again.
I think Paul will have to provide details if this is the case or not.
