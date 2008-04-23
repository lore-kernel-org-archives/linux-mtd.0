Received: from wf-out-1314.google.com ([209.85.200.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoZCH-0000HZ-0L
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 07:15:17 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1945209wff.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 00:15:14 -0700 (PDT)
Message-ID: <bae050c10804230015r50b7747apef8b1d8cab302c9a@mail.gmail.com>
Date: Wed, 23 Apr 2008 15:15:14 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: [RFC] slight UBI scan time improvement
In-Reply-To: <1208882552.11721.13.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1208882552.11721.13.camel@sauron>
Cc: Hamish Moffatt <hamish@cloud.net.au>, linux-mtd@lists.infradead.org,
	Bruce_Leonard@selinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I've prepared 2 UBI patches which may slightly improve the scan time. I
> am not sure though. Would you guys please try them and tell if UBI scan
> time changed? Thanks in advance.
I have tried, as you said slightly improve the scan time, slightly,
even don't feel it exist. en....I don't like the two stages displaying
when ubi attach to mtd. First time I see it, I doubt the NFS server is
too busy. It is just like a kid playing sliding board who do not like
being block in the middle, or a group of men "cheers!", then drink off
the beer. Oh, don't make it stop in the half way.

You still do not add patch to handle write fail issue, a little disappointment.

-- 
Best wishes,
Nancy
