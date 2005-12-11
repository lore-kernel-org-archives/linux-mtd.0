Received: from blood.actrix.co.nz ([203.96.16.163])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ElVOW-0008Vx-6q
	for linux-mtd@lists.infradead.org; Sun, 11 Dec 2005 12:54:01 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Date: Mon, 12 Dec 2005 06:53:33 +1300
References: <439821F4.7010403@yandex.ru>
	<200512111128.34835.manningc2@actrix.gen.nz>
	<439C2DA3.9090405@yandex.ru>
In-Reply-To: <439C2DA3.9090405@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200512120653.33614.manningc2@actrix.gen.nz>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: NAND simulator
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 12 December 2005 02:46, Artem B. Bityutskiy wrote:
> Charles Manning wrote:
> > Yes please.
>
> Uhh, will pospone this for now, will try to repair JFFS2 which doesn't
> work after the last month's commits. Crud! Not sure whom to blame so far.
>
> > Can nandsim simulate storage larger than physical RAM (just swapping out)
> > or would this need special support (eg. add some block device support?
> > We're getting people in YAFFSland who are working with 8Gbytes of flash
> > (and it will only get bigger!) and I expect you'd want large emulations
> > to stress JFFS3. Being able to simulate areas up to, say, 16Gbytes for
> > now would be a nice thing.
>
> Well, did not plan it. But we probably may add this functionality. We
> may borrow it from mtd2blk ...
>
> > A way of simulating a failure (bit flip, write error) would also be handy
> > for testing fs and ecc error handling.
>
> Yeah, good feature. But I'm not sure how to implement an interface for
> this. It is probably easier to hack nandsim and add this manually...

Manual hacking does work. I have done stuff like that in the past. Perhaps 
dynamic hacking could be done via procfs? 
eg, perhaps somethiong like
echo "flip 12345 400 1" > /procfs/nandsim   # flip bit 1 in byte 400, page 
12345
