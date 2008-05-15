Received: from wa-out-1112.google.com ([209.85.146.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JwVYw-0001Uy-DF
	for linux-mtd@lists.infradead.org; Thu, 15 May 2008 04:59:30 +0000
Received: by wa-out-1112.google.com with SMTP id v33so242701wah.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 May 2008 21:59:29 -0700 (PDT)
Message-ID: <bae050c10805142159t68b1766ej13657d8e14f4506a@mail.gmail.com>
Date: Thu, 15 May 2008 12:59:29 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH] [MTD] [UBI] add block device layer on top of UBI
In-Reply-To: <1210773048.5708.83.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10803030317j49cfce3ds7a6af593d16d3736@mail.gmail.com>
	<1204623622.23706.22.camel@sauron>
	<bae050c10803040154t2f635dfewe1221c18255f7bda@mail.gmail.com>
	<1204624414.23706.26.camel@sauron>
	<bae050c10803040207odbaebe5vd85b619b370a16cd@mail.gmail.com>
	<bae050c10803040555y3a398fla89fe54c01908838@mail.gmail.com>
	<bae050c10805122116g4295f202j40e1a8528be5220@mail.gmail.com>
	<1210672391.5708.15.camel@sauron>
	<bae050c10805130631g7de2a4b0x1d67ddd3b84511bc@mail.gmail.com>
	<1210773048.5708.83.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/14/08, Artem Bityutskiy <dedekind@infradead.org> wrote:
> Please, no need to send lengthy explanations like this. I have nothing
> agains a good FTL. In opposite, I think it would be nice to develop one.
> I just think the patches you send are not good enough and need more work
> if you want them to be merged upstream.
     OK. please show your opinion about the patches, where need to
improve. I know the code style is too diffrent. lack of code comments,
........
     You can teach me to meet your requriement. If you think it's more
quick to do it by yourself, just need me to explain some place you do
not clear. OK. All I am asking for is to merge this new feature
upstream as soon as possible. I do not care copyright much. In fact I
will be so happy to see you turn those code to your style. I mean I am
lack of professional program skill. I need someone like you guide me
to be professional, to improve my skill. Nothing better than implement
the same idea but different code formulate to see the ..... sorry, i
don't know how to express, I think you knows : )

> Please, no need to flame. Please, make technical arguments instead.
>
> Thank you!
      In fact, the patches should be more easier done by UBI awared
and Block device layer awared developer. As you can see in my patches,
90% was direct copy-plase from mtdblock.c mtd_blktrans.c and some
sections of UBI code. I was wondering why Artem Bityutskiy, David
Woodhouse, Nicolas Pitre do not unite together to finish a good NFTL
which is so in need by lots of people. To make linux better and
better. Then I see it may be imply a competition in you. Oh, come on,
you are all so greate! all the best!

-- 
Best wishes,
Nancy
