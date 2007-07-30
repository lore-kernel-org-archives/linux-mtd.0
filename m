Received: from wx-out-0506.google.com ([66.249.82.237])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IFWcy-00043I-AU
	for linux-mtd@lists.infradead.org; Mon, 30 Jul 2007 10:53:46 -0400
Received: by wx-out-0506.google.com with SMTP id s7so1342771wxc
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Jul 2007 07:53:43 -0700 (PDT)
Message-ID: <e1d5030b0707300753m400e5196w99a4c05430c36572@mail.gmail.com>
Date: Mon, 30 Jul 2007 20:23:42 +0530
From: "Midhun A" <midhunagni@gmail.com>
To: "Alan Cox" <alan@lxorguk.ukuu.org.uk>
Subject: Re: Testing of CPRM on SD Card
In-Reply-To: <20070730135723.4e5338b4@the-village.bc.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <e1d5030b0707280108v236cc522m454c58e1044f1996@mail.gmail.com>
	<0A50DBE80DD6674E94F7269DC964A7B6440EDA@dbde01.ent.ti.com>
	<20070730135723.4e5338b4@the-village.bc.nu>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, "Sriram, Kannan" <ksriram@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey All,

    Thanks a lot for the replies. I have the development keys. But the
algorithm and some intellectual property needs to be licenced from the
4C entity guys to implement it. As of now I just want to test the CPRM
functionality. So licensing the algo for a prototype testing is a huge
cost.

   That is why I was looking for an already implemented solution -
hardware/software - so that I can just test. If it does not suite our
needs, then I have just paid for a chip only and not for a whole
license.

  Seems like there is no other way out than shelling out money for the
license. :(

Thanks anyways,
Midhun.



On 7/30/07, Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> On Mon, 30 Jul 2007 11:20:58 +0530
> "Sriram, Kannan" <ksriram@ti.com> wrote:
>
> >
> > Midhun,
> >
> >  There is no open-source implementation of CPRM (SD-Audio/ SD-Bind
> > standards). So first of all, you need to license keys from 4C (device
> > keys, media keys etc) and do your own implementation.
>
> Also remember that if you do your own implementation in the kernel you
> will be required to publish the source code under the GPL and that will
> not be permitted with the CPRM licensing. Thus you will need to do all
> the work in user space.
>
>
