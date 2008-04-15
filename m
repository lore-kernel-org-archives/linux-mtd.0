Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jljtw-0006g8-LL
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 12:04:40 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1979995wff.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Apr 2008 05:04:38 -0700 (PDT)
Message-ID: <bae050c10804150504v6b07ac06m62459278f2b375d@mail.gmail.com>
Date: Tue, 15 Apr 2008 08:04:37 -0400
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: Is there possible to integrate mtd ubi ubifs latest version in
	one git tree?
In-Reply-To: <1208173090.5965.187.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10804102348sceaef1bh557ecce22a96b03f@mail.gmail.com>
	<1207994233.5965.124.camel@sauron> <1207995042.5965.136.camel@sauron>
	<bae050c10804132146t284e9a3pd3952c30a7e892c7@mail.gmail.com>
	<1208163958.5965.158.camel@sauron>
	<bae050c10804140435v5141dec6qd61b325a4a1ff6ad@mail.gmail.com>
	<1208173090.5965.187.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>  > I'm looking forward to the new tools come out :-)
>  >
>  > > I suspect you have MLC NAND, do you? Could you please tell how many
>  > > erase-cycles the eraseblock may survive on your flash.
>  > Yes, MLC Nand,  Samsung K9G8G08U0M , 10K program/erase cycles(with
>  > 4bit/512byte ECC).
>
>  Then first of all you cannot use the default 4096 UBI WL threshold. Make
>  it 256 for example. 4K is almost lifetime of your eraseblock!
       Why 4K is almost lifetime of my eraseblock? the specs says 10K,
how you result that number 4?
       How to set the WL threshold? any equation?
       When eraseblock counter exceed 2*WL threshold, it will be less
used, move its data to seldom used eraseblock?
       Why WL can't just simply pick up the min used PEB to be the
next block to use?

-- 
Best wishes,
Nancy
