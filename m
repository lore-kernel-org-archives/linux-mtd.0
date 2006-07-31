Received: from ug-out-1314.google.com ([66.249.92.172])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7YC7-00028I-Pl
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 09:52:36 -0400
Received: by ug-out-1314.google.com with SMTP id u40so763113ugc
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Jul 2006 06:52:29 -0700 (PDT)
Message-ID: <625fc13d0607310652m75b872a7r7a642c740b8c93e4@mail.gmail.com>
Date: Mon, 31 Jul 2006 08:52:29 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: how to use jff2 on UBI layer?
In-Reply-To: <44CDB4A4.1010809@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1152536472.6066.28.camel@localhost.localdomain>
	<004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>
	<20060720094558.GA30897@wohnheim.fh-wedel.de>
	<1153737968.16170.19.camel@sauron.oktetlabs.ru>
	<20060724114007.GB20849@wohnheim.fh-wedel.de>
	<44C8B789.4030505@yandex.ru>
	<625fc13d0607301228y2bfd2c62q462c508d57a32043@mail.gmail.com>
	<44CDAF7D.4040300@yandex.ru> <44CDB4A4.1010809@yandex.ru>
Cc: linux-mtd@lists.infradead.org, haver@vnet.ibm.com,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	Marteo Tim <tim.marteo@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/31/06, Artem B. Bityutskiy <dedekind@yandex.ru> wrote:
> Artem B. Bityutskiy wrote:
>
> >> For what it's worth, I personally prefer the gluebi approach.  Or at
> >> least it's design.  I don't see why UBI cannot add_mtd_device for
> >> every volume that is found within the overall MTD given to it.
> >
> > Just because it's strange from the design POV. UBI != MTD device
> > semantically => any attempt to access UBI as MTD device is a dirty hack.
>
> Err, I have to refine my position Of course, the idea itself is OK - it
> is useful to make MTD-oriented software work on top of UBI. But it is
> still a hack, just because UBI != MTD subset, strictly speaking.

So now that you've agreed the idea of gluebi is OK, could you please
revert your changes in the ubi-2.6 tree?  As it stands right now,
there is no tree to even generate a gluebi patch against.  The
ubi-2.6.git tree can't be used since it currently has your
implementation, and the mtd-2.6.git tree can't be used since it lacks
the base UBI support.

If you could revert those, it would allow a patch to be generated and
sent out for gluebi so that everyone could see the positives/negatives
of each approach.

(Obviously you can keep your changes in a different tree under your
user account)

josh
