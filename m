Received: from wf-out-1314.google.com ([209.85.200.173])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoZvH-0003ho-Rx
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 08:01:48 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1958237wff.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 01:01:47 -0700 (PDT)
Message-ID: <bae050c10804230101m64bc2558icf9a5ad7efb8c824@mail.gmail.com>
Date: Wed, 23 Apr 2008 16:01:46 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: [RFC] slight UBI scan time improvement
In-Reply-To: <1208935971.11721.20.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1208882552.11721.13.camel@sauron>
	<bae050c10804230015r50b7747apef8b1d8cab302c9a@mail.gmail.com>
	<1208935971.11721.20.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/23/08, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Wed, 2008-04-23 at 15:15 +0800, Nancy wrote:
> > I have tried, as you said slightly improve the scan time, slightly,
> > even don't feel it exist. en....I don't like the two stages displaying
> > when ubi attach to mtd. First time I see it, I doubt the NFS server is
> > too busy. It is just like a kid playing sliding board who do not like
> > being block in the middle, or a group of men "cheers!", then drink off
> > the beer. Oh, don't make it stop in the half way.
>
> Hmm, may be. But the reason for this is that we want to see this
> information even if UBI refuses your MTD device later.
   Thank you for your explaination.

> > You still do not add patch to handle write fail issue, a little disappointment.
>
> I do not see any UBI/UBIFS issue in your case. The issue was that you
> abused your flash using wrong tools, I think. Use the "ubiformat"
> utility which we have recently implemented - the issue should go.
    Thanks for the "ubiformat " tool.
    Yes, the issue is go away by properly use MLC nand.
    But the write fail issue in UBI still exist! Suppose you are
properly used your Nand, when it return write fail, but can erase
successfully, UBI still group this block in good block heap. That is
wrong and dangerous.


-- 
Best wishes,
Nancy
