Date: Tue, 16 Nov 2004 15:09:32 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1100617420.8191.6959.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.58.0411161507340.27293@phoenix.infradead.org>
References: <Pine.LNX.4.58.0411161316390.25950@phoenix.infradead.org>
	<1100613327.8191.6954.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.58.0411161405080.27293@phoenix.infradead.org>
	<1100615381.8191.6957.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.58.0411161450260.27293@phoenix.infradead.org>
	<1100617420.8191.6959.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: your mail
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 Nov 2004, David Woodhouse wrote:

> On Tue, 2004-11-16 at 14:54 +0000, Artem B. Bityuckiy wrote:
> > Yes. But imagine some file which is constant and is never changed. We 
> > create checkpoint for it and this checkpoint covers all the nodes. So, we 
> > will need to rewrite new checkpoint even for this file when its nodes are 
> > garbage collected... 
> 
> Yeah. In particular we'd nee to rewrite a new checkpoint when the block
> containing the old checkpoint was garbage-collected anyway.
> 
Hmm, do not get it why. Why we need this? We may just copu old checkpoint 
inact I believe. What happen If we do this? 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
