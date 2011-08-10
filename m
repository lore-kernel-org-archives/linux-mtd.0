Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qr6cH-0003xA-60
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2011 11:06:29 +0000
Received: by wwf10 with SMTP id 10so677714wwf.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Aug 2011 04:06:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110809145812.GR26160@logfs.org>
References: <CAMjNe_d9WVnKS_4416Kj21YgVEh3d6W4Wa6qWZObex+=LG4J6w@mail.gmail.com>
	<20110805160325.GM26160@logfs.org>
	<CAMjNe_c0qZ+opwHtO3AhD60v1p8-gpDLVykJoKo8oD4zNGk9kA@mail.gmail.com>
	<20110808083107.GN26160@logfs.org>
	<CAMjNe_c3J6UNi5LGmraD+CcbP9yGOOzepy=JFVy3wYx15hs55w@mail.gmail.com>
	<20110809145812.GR26160@logfs.org>
Date: Wed, 10 Aug 2011 16:36:26 +0530
Message-ID: <CAMjNe_f_364ir1iNgFFgh71GP-T_6vroMHFC1R7eazkhcR8c2g@mail.gmail.com>
Subject: Re: logfs unmount bug
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>> I am sorry , i dont know what i am missing. I tried it 5 times. 4/5
>> trials, the bonnie test didnt complete. .Even when it completed once,
>> the logs show kernel bug.
>
> Ok, since I cannot reproduce this at all, can you try the patch below?

I was using a week-old kernel from git. That may be the problem,
Can you tell the kernel version that you are using, in which bonnie test passes.
I am right now trying on kernel 3.0 and i will test and let you know
the results.
thanks,
mugunthan
