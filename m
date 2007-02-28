Received: from wr-out-0506.google.com ([64.233.184.229])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HMQRa-0001q2-Ri
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 10:10:17 -0500
Received: by wr-out-0506.google.com with SMTP id 69so248954wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Feb 2007 07:10:13 -0800 (PST)
Message-ID: <87f18bad0702280710g93cbc7bnf4f8884b14efeaec@mail.gmail.com>
Date: Wed, 28 Feb 2007 17:10:08 +0200
From: "J. Doo" <doodiexx@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: NAND flash mounting problem
In-Reply-To: <200702281041.49203.indrek.kruusa@artecdesign.ee>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <87f18bad0702272352v44058e20x17390c10b9373930@mail.gmail.com>
	<200702281041.49203.indrek.kruusa@artecdesign.ee>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > I try to flash_eraseall -j and it completes without any error, but
> > when I try to mount it I get :
> > # mount /dev/mtd1 /mnt/nand
> > mount: mounting /dev/mtd1 on /mnt/nand failed
>
> Is it busybox? The error message is not too verbose. I suppose you missed -t
> jffs2 here. This and other nice hints can be found:
>
No, I've also tried that, but it doesn't make any difference.

BR,
J.Doo
